require "test_helper"

class GameCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_card = game_cards(:one)
  end

  test "should get index" do
    get game_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_game_card_url
    assert_response :success
  end

  test "should create game_card" do
    assert_difference('GameCard.count') do
      post game_cards_url, params: { game_card: { default_rating: @game_card.default_rating, location: @game_card.location } }
    end

    assert_redirected_to game_card_url(GameCard.last)
  end

  test "should show game_card" do
    get game_card_url(@game_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_card_url(@game_card)
    assert_response :success
  end

  test "should update game_card" do
    patch game_card_url(@game_card), params: { game_card: { default_rating: @game_card.default_rating, location: @game_card.location } }
    assert_redirected_to game_card_url(@game_card)
  end

  test "should destroy game_card" do
    assert_difference('GameCard.count', -1) do
      delete game_card_url(@game_card)
    end

    assert_redirected_to game_cards_url
  end
end
