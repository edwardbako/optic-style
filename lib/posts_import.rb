class PostsImport

  def initialize(filename)
    @filename = filename
  end

  def create_posts_from_file
    data = read_yaml
    data.each do |post|
      Post.create created_at: post[:date], body: post[:text]
    end
  end

  private

  def read_yaml
    YAML.load(File.read(@filename))
  end
end