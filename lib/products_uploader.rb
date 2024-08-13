class ProductsUploader
  def process
    files_list.each do |filename|
      product = Product.create(
        name: "Оправа #{parent_name}", 
        sku: filename.split(".").first,
        parent: parent_folder
        )
      view = product.views.new
      File.open(File.join(path, filename)) { |image| view.image = image }
      view.save!
    end
  end

  private

  def path
    File.join(Rails.root, "tmp/Каталог/#{parent_name}")
  end

  def files_list
    Dir.entries(path).select {|f| File.file?(File.join(path, f))}
  end

  def parent_folder
    @parent_folder ||= Product.find_by_name(parent_name)
  end

  def parent_name
    "Etnia Barcelona"
  end
end