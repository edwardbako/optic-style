module ArticleParams
  extend ActiveSupport::Concern

  def article_params
    params.require(:article).permit(:title, :published, :user_id,
                                    article_blocks_attributes: [:id, :text, :image, :video, :audio,
                                                                :caption_place, :_destroy])
  end
end