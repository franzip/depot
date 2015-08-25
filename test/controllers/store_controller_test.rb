require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  fixtures :products

  test "should get index" do
    get :index
    assert_response :success
    assert_select '#columns #side a', minimum: 4
    assert_select '#main .entry', 4
    assert_select 'h3', 'A book'
    assert_select '.price', /\€[,\d]+\.\d\d/
  end
end
