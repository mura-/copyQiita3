$(document).on 'ready page:load', ->
  $('#item-tags').tagit
    fieldName:   'item[tag_list]'
    singleField: true
    availableTags: gon.available_tags

  if gon.item_tags?
    console.dir gon.item_tags
    for tag in gon.item_tags
      $('#item-tags').tagit 'createTag', tag
