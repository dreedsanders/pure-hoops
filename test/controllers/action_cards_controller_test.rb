require "test_helper"

class ActionCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @action_card = action_cards(:one)
  end

  test "should get index" do
    get action_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_action_card_url
    assert_response :success
  end

  test "should create action_card" do
    assert_difference('ActionCard.count') do
      post action_cards_url, params: { action_card: { description: @action_card.description, title: @action_card.title, type: @action_card.type } }
    end

    assert_redirected_to action_card_url(ActionCard.last)
  end

  test "should show action_card" do
    get action_card_url(@action_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_action_card_url(@action_card)
    assert_response :success
  end

  test "should update action_card" do
    patch action_card_url(@action_card), params: { action_card: { description: @action_card.description, title: @action_card.title, type: @action_card.type } }
    assert_redirected_to action_card_url(@action_card)
  end

  test "should destroy action_card" do
    assert_difference('ActionCard.count', -1) do
      delete action_card_url(@action_card)
    end

    assert_redirected_to action_cards_url
  end
end
