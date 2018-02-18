require "application_system_test_case"

class QuestionsTest < ApplicationSystemTestCase
  test "visting /ask renders the form" do
    visit ask_url

    assert_selector "p", text: "Ask your coach anything"
    take_screenshot
  end
  test "saying Hello yields a grumpy response from the coach" do
    visit ask_url
    fill_in "question", with: "Hello"
    click_on "Ask"

    assert_text "I don't care, get dressed and go to work!"
    take_screenshot
  end
  test "asking a question yields silly question response from coach" do
    visit ask_url
    fill_in "question", with: "How are you?"
    click_on "Ask"

    assert_text "Silly question, get dressed and go to work!"
    take_screenshot
  end
  test "telling coach I am going to work is respected by coach" do
    visit ask_url
    fill_in "question", with: "I am going to work"
    click_on "Ask"

    assert_text "Great!"
    take_screenshot
  end
  test "links /link from answer to ask" do
    visit ask_url
    fill_in "question", with: "Hello"
    click_on "Ask"
    click_on "Ask another question"

    assert_selector "p", text: "Ask your coach anything"
    take_screenshot
  end
end
