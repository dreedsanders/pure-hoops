require "application_system_test_case"

class ActionCardsTest < ApplicationSystemTestCase
  setup do
    @action_card = action_cards(:one)
  end

  test "visiting the index" do
    visit action_cards_url
    assert_selector "h1", text: "Action Cards"
  end

  test "creating a Action card" do
    visit action_cards_url
    click_on "New Action Card"

    fill_in "Description", with: @action_card.description
    fill_in "Title", with: @action_card.title
    fill_in "Type", with: @action_card.type
    click_on "Create Action card"

    assert_text "Action card was successfully created"
    click_on "Back"
  end

  test "updating a Action card" do
    visit action_cards_url
    click_on "Edit", match: :first

    fill_in "Description", with: @action_card.description
    fill_in "Title", with: @action_card.title
    fill_in "Type", with: @action_card.type
    click_on "Update Action card"

    assert_text "Action card was successfully updated"
    click_on "Back"
  end

  test "destroying a Action card" do
    visit action_cards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Action card was successfully destroyed"
  end
end
