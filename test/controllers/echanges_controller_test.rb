require "test_helper"

class EchangesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @echange = echanges(:one)
  end

  test "should get index" do
    get echanges_url
    assert_response :success
  end

  test "should get new" do
    get new_echange_url
    assert_response :success
  end

  test "should create echange" do
    assert_difference("Echange.count") do
      post echanges_url, params: { echange: { course_id: @echange.course_id, slug: @echange.slug, status: @echange.status, title: @echange.title, user_id: @echange.user_id } }
    end

    assert_redirected_to echange_url(Echange.last)
  end

  test "should show echange" do
    get echange_url(@echange)
    assert_response :success
  end

  test "should get edit" do
    get edit_echange_url(@echange)
    assert_response :success
  end

  test "should update echange" do
    patch echange_url(@echange), params: { echange: { course_id: @echange.course_id, slug: @echange.slug, status: @echange.status, title: @echange.title, user_id: @echange.user_id } }
    assert_redirected_to echange_url(@echange)
  end

  test "should destroy echange" do
    assert_difference("Echange.count", -1) do
      delete echange_url(@echange)
    end

    assert_redirected_to echanges_url
  end
end
