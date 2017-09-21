fieldset = $('#<%= @block.id %>.block-fields')
fieldset.find('.remove-attr').val(true)
fieldset.slideUp()