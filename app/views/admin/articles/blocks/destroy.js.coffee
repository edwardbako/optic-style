fieldset = $('#<%= @block.id %>.block-fields')
#fieldset.find('.remove-attr').val(true)
fieldset.slideUp()
fieldset.siblings("input[type='hidden'][value='<%= @block.id %>']").remove()
fieldset.remove()