require "application_system_test_case"

class GameCardsTest < ApplicationSystemTestCase
  setup do
    @game_card = game_cards(:one)
  end

  test "visiting the index" do
    visit game_cards_url
    assert_selector "h1", text: "Game Cards"
  end

  test "creating a Game card" do
    visit game_cards_url
    click_on "New Game Card"

    fill_in "Default rating", with: @game_card.default_rating
    fill_in "Location", with: @game_card.location
    click_on "Create Game card"

    assert_text "Game card was successfully created"
    click_on "Back"
  end

  test "updating a Game card" do
    visit game_cards_url
    click_on "Edit", match: :first

    fill_in "Default rating", with: @game_card.default_rating
    fill_in "Location", with: @game_card.location
    click_on "Update Game card"

    assert_text "Game card was successfully updated"
    click_on "Back"
  end

  test "destroying a Game card" do
    visit game_cards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Game card was successfully destroyed"
  end
end
