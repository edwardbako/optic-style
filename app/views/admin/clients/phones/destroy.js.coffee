$("input#client_phones_attributes_<%= params[:id] %>__destroy").val('true')
$(".phone-field#<%= params[:id] %>").hide()