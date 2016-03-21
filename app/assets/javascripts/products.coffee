$(document).ready ->
  baseUrl = 'http://devpoint-ajax-example-server.herokuapp.com/api/v1'
  $.ajax
    url: "#{baseUrl}/products"
    type: 'GET'
    success: (data) ->
      for product in data.products
        $.ajax
          url: '/product_card'
          type: 'GET'
          data:
              product: product
          success: (data) ->
            $('#products').append data
          error: (data) ->
            console.log data
    error: (data) ->
      console.log data


  $(document).on 'click', '.edit_product', (e) ->
    e.preventDefault()
    editForm = $('#product_edit_form')
    $.ajax
      type: 'GET'
      url: baseUrl + '/products/' + $(this).data('product-id')
      success: (data) ->
        product = data.product
        editForm.find('#product_name').val product.name
        editForm.find('#product_base_price').val product.base_price
        editForm.find('#product_description').val product.description
        editForm.find('#product_quantity_on_hand').val product.quantity_on_hand
        editForm.find('#product_color').val product.color
        editForm.find('#product_weight').val product.weight
        editForm.find('#product__other_attributes').val product.other_attributes
        $('body').scrollTop 0
        editForm.removeClass 'hide'
        return
      error: (data) ->
        console.log data
        return
    return


  $(document).on 'click', '.show_product', (e) ->
    e.preventDefault()
    showForm = $('#show_product_info')
    showForm.removeClass 'hide'


  # $(document).on 'click', '.show_product', (e) ->
  #   e.preventDefault()
  #   showForm = $('#show_product_info')
  #     $.ajax
  #       type: 'GET'
  #       url: baseUrl + '/products/' + $(this.data)('product-id')
  #       success: (data) ->
  #         showForm.removeClass 'hide'
  #       error: (data) ->
  #         console.log data



