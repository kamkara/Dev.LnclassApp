require "application_system_test_case"

class EchangesTest < ApplicationSystemTestCase
  setup do
    @echange = echanges(:one)
  end

  test "visiting the index" do
    visit echanges_url
    assert_selector "h1", text: "Echanges"
  end

  test "should create echange" do
    visit echanges_url
    click_on "New echange"

    fill_in "Course", with: @echange.course_id
    fill_in "Slug", with: @echange.slug
    fill_in "Status", with: @echange.status
    fill_in "Title", with: @echange.title
    fill_in "User", with: @echange.user_id
    click_on "Create Echange"

    assert_text "Echange was successfully created"
    click_on "Back"
  end

  test "should update Echange" do
    visit echange_url(@echange)
    click_on "Edit this echange", match: :first

    fill_in "Course", with: @echange.course_id
    fill_in "Slug", with: @echange.slug
    fill_in "Status", with: @echange.status
    fill_in "Title", with: @echange.title
    fill_in "User", with: @echange.user_id
    click_on "Update Echange"

    assert_text "Echange was successfully updated"
    click_on "Back"
  end

  test "should destroy Echange" do
    visit echange_url(@echange)
    click_on "Destroy this echange", match: :first

    assert_text "Echange was successfully destroyed"
  end
end
