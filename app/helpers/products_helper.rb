module ProductsHelper

  def folder_link(name, folder, product)
    if folder.id == params[:id].to_i || product.parents_ids.include?(folder.id)
      tag.li class: 'active'do
        name
      end
    else
      tag.li link_to(name, folder)
    end
  end
end