class ArticleBlock::Video < ArticleBlock

  before_save :save_original_info

  def video_id
    uri = URI.parse(video)
    raise URI::InvalidURIError unless uri.host == 'www.youtube.com'
    query = uri.query
    query ? CGI::parse(query)['v'].first : nil
  rescue URI::InvalidURIError
    nil
  end

  [:title, :description, :thumbnails].each do |m|
    define_method m do
      snippet.fetch(m, (m == :thumbnails ? blank_thumbnails : nil))
    end
  end

  def info
    (text == 'null' || text.blank?) ? {} : JSON.parse(text).with_indifferent_access
  end

  def snippet
    info.fetch(:snippet, {})
  end

  def player
    info.fetch(:player, {}).fetch(:embedHtml, '')
  end

  private

  def blank_thumbnails
    {
      default: {height: 0, width: 0, url: nil},
      high: {height: 0, width: 0, url: nil},
      medium: {height: 0, width: 0, url: nil},
      standard: {height: 0, width: 0, url: nil},
    }.with_indifferent_access
  end

  def save_original_info
    self.text = original_info.to_json
  end

  def original_info
    @original_info ||= begin
                         if video_id
                           response = service.list_videos(
                             'snippet,contentDetails,player,statistics, status',
                             id: video_id)
                           response.items[0]
                         else
                           Google::Apis::YoutubeV3::Video.new
                         end
    end
  end

  def service
    s = ::Google::Apis::YoutubeV3::YouTubeService.new
    s.key = Rails.application.credentials.dig(:google, :api_key)
    s
  end


end
