require "application_system_test_case"

class TeamsTest < ApplicationSystemTestCase
  setup do
    @team = teams(:one)
  end

  test "visiting the index" do
    visit teams_url
    assert_selector "h1", text: "Teams"
  end

  test "creating a Team" do
    visit teams_url
    click_on "New Team"

    fill_in "Player1", with: @team.player1
    fill_in "Player2", with: @team.player2
    fill_in "Player3", with: @team.player3
    fill_in "Player4", with: @team.player4
    fill_in "Player5", with: @team.player5
    fill_in "Player", with: @team.player_id
    fill_in "String", with: @team.string
    fill_in "Team name", with: @team.team_name
    fill_in "User", with: @team.user_id
    click_on "Create Team"

    assert_text "Team was successfully created"
    click_on "Back"
  end

  test "updating a Team" do
    visit teams_url
    click_on "Edit", match: :first

    fill_in "Player1", with: @team.player1
    fill_in "Player2", with: @team.player2
    fill_in "Player3", with: @team.player3
    fill_in "Player4", with: @team.player4
    fill_in "Player5", with: @team.player5
    fill_in "Player", with: @team.player_id
    fill_in "String", with: @team.string
    fill_in "Team name", with: @team.team_name
    fill_in "User", with: @team.user_id
    click_on "Update Team"

    assert_text "Team was successfully updated"
    click_on "Back"
  end

  test "destroying a Team" do
    visit teams_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Team was successfully destroyed"
  end
end
