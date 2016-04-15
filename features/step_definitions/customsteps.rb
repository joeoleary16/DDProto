Then /^I enter "([^\"]*)" into the "([^\"]*)" field$/ do |text_to_type, field_name|
  touch("textField marked:'#{field_name}'")
  wait_for_keyboard()
  keyboard_enter_text text_to_type
  sleep(STEP_PAUSE)
end