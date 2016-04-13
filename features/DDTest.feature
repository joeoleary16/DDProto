Feature: Running a test
As an iOS developer
I want to have a sample feature file
So I can test the DDproto App

Scenario: Test the Tab-bar items
	Then I see the text "Search"
	Then I touch "Search"
	Then I see the text "My DoneDeal"
	Then I see the text "Place Ad"
	Then I touch "Place Ad"
	Then I see the text "Messages"
	Then I touch "Messages"
	Then I see the text "More"
	Then I touch "More"
	
Scenario: Test the Search Tab
	Then I touch "Place Ad"
	Then I touch "Add Photos"
	Then I see the text "Gallery"
	Then I see the text "Camera"
	
Scenario: Test the Place Ad Page & Location Finder
	Then I touch "Place Ad"
	Then I touch "Add Photos"
	Then I see the text "Gallery"
	Then I see the text "Camera"
	Then I see the text "Cancel"
	Then I touch "Cancel"
	Then I touch "Add Photos"
	Then I touch "Gallery"
	Then I touch "Moments"
	Then I touch "Photos"
	Then I touch "Cancel"
	Then I scroll down
	Then I scroll down
	Then I touch "Get Location"
	Then I see the text "Find My Location"
	Then I see the text "Current Address:"
	Then I see the text "Current Data Location:"
	Then I wait to see "Cupertino"
	Then I see the text "Cupertino"
	Then I see the text "CA"
	Then I go back
	
Scenario: Test the Messages Tab
	Then I touch "Messages"
	Then I see the text "Messages"

Scenario: Test the More Tab
	Then I touch "More"
	Then I see the text "Help"
	Then I see the text "Login"
	Then I touch "Help"
	Then I see the text "Support"
	Then I see the text "Safety"
	Then I see the text "Legal"
	Then I see the text "Privacy & Cookies"
	Then I see the text "Contact Support"
	Then I see the text "Help & Tips"
	Then I see the text "Buying"
	Then I see the text "Selling"
	Then I see the text "Common Questions"
	Then I see the text "Social Media"
	Then I see the text "Facebook"
	Then I see the text "Twitter"
	Then I see the text "Blog"
	Then I touch "Safety"
	Then I see the text "Safety"
	Then I go back
	Then I touch "Legal"
	Then I see the text "Legal"
	Then I go back
	Then I touch "Privacy & Cookies"
	Then I see the text "Privacy & Cookies"
	Then I go back
	Then I touch "Contact Support"
	Then I see the text "Support"
	Then I go back
	Then I wait to see "Buying"
	Then I touch "Buying"
	Then I see the text "Buying"
	Then I go back
	Then I touch "Selling"
	Then I see the text "Selling"
	Then I go back
	Then I touch "Common Questions"
	Then I see the text "Common Questions"
	Then I go back
	Then I touch "Facebook"
	Then I see the text "Facebook"
	Then I go back
	Then I touch "Twitter"
	Then I see the text "Twitter"
	Then I go back
	Then I touch "Blog"
	Then I see the text "Blog"
	Then I go back
	
Scenario: Test the Login Page
	Then I touch "More"
	Then I see the text "Login"
	Then I touch "Login"
	Then I wait to see "Log In"
	Then I see the text "Email"
	Then I see the text "Password"
	Then I see the text "Log In"
	Then I see the text "I Need To Register"
	Then I touch "I Need To Register"
	Then I see the text "Email:"
	Then I see the text "Password:"
	Then I see the text "Re-enter Password"
	Then I see the text "Register"
	Then I see the text "I already have an account"
	Then I touch "I already have an account"
	Then I see the text "Log In"
	Then I touch "Enter your email"
	Then I enter "test@email.com" into the "userEmailTextField" input field
	Then I enter "testPassword" into the "userPasswordTextField" input field


	

	

	

	
	
	
	
	