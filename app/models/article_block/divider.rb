class ArticleBlock::Divider < ArticleBlock

  before_create :set_default_text

  private

  def set_default_text
    self.text = default_text
  end

  def default_text
    <<EOS
      <div class="row">
        <div class="col-xs-5">
          <hr class="divider">
        </div>
        <div class="col-xs-2">
          <h3 class="text-center divider">
            <b>
              <div class="ionicons ion-ios-glasses">
              </div>
            </b>
          </h3>
        </div>
        <div class="col-xs-5">
          <hr class="divider">
        </div>
      </div>
EOS
  end
end
