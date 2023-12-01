require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test 'render a lista de produtos' do
    get products_path
    assert_response :success

    # Check the presence of at least one element with class '.product'
    assert_select '.product', count: 5
  end

  test 'render a pagina de detalles de productos' do
    product = products(:one)
    get product_path(product)
    assert_response :success

    assert_select '.title', 'Laptop'
    assert_select '.description', text: product.description
    assert_select '.price', text: ActionController::Base.helpers.number_to_currency(product.price)
  end
  test 'render a new prodoctt form'do
    get newproduct_path
    assert_response :success
    assert_select 'form'
  end


  test 'render productos es valido' do
    product = products(:one)
    assert product.valid?
  end
end
