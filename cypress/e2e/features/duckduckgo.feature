Feature: Login App
  As a valid user
  I want to log in into application

  As a invalid user
  I can not log in into application

  Background:
    Given I navigate to the Website


  @smoke
  Scenario: Login an user with valid data
    When I try to login with correct credentials
    #And I want to wait
    Then I am able to successfully login to the Website

  @smoke2
  Scenario: special login
    When I login in
      | username | password |
      | Admin    | admin1123 |
    And I press login button
    Then I am able to successfully login to the Website

  @smoke2
  Scenario: Login an user with valid data 2
    When I enter "the username" with "Admin"
    And I enter the "password" with "admin123"
    And I press login button
    Then I am able to successfully login to the Website

  
  Scenario Outline: Login to Orange CRM Website
    When User enters username as '<username>' and password as '<password>'
    And User clicks on login button
    Then I am able to successfully login to the Website
    Examples:
      | username | password |
      | Admin    | admin123 |


  Scenario Outline: Login into the Application
    When I enter '<username>'
    When enter '<password>'
    And I click on login button
    Then I should see an '<error>' message

    Examples:
      | username     | password    | error               |
      | test1@qa.com | ba@8838     | Invalid credentials |
      | test2@qa.com | b3a@8$32323 | Invalid credentials |
      | test3@qa.com | xSba@3e3    | Invalid credentials |


  Scenario Outline: Login to Orange CRM Website
    When I type in the registration form
      | username     | password |
      | test1@qa.com | ba@8838  |
      | test2@qa.com | b3a@8$3  |
      | test3@qa.com | xSba@3e3 |
    And User clicks on login button
    Then I should see an error "Invalid credentials"


# ------------------- MAS PARA ESTUDIAR ----------------------------
# Scenario: Successful search

#   Given I am on the homepage
#   When I search for ‘cucumber’
#   Then I should see a list of products related to ‘cucumber’


# Scenario: Creating a <listName> list within a board
#   Given I am on empty home page
#   When I type in "<boardName>" and submit
#   And Create a list with the name "<listName>"
#   Then I should be redirected to the board detail

#   Examples:
#     | boardName     | listName         |
#     | Shopping list | Groceries        |
#     | Rocket launch | Preflight checks |


# Scenario: Create multiple cards
#   Given I am in board detail
#   When I create cards with names
#     | Milk | Bread | Butter | Jam |
#   Then 4 cards are visible


# Feature: Payments with Master Card.
# As a Master Cardholder,
# I Want to use my Master Card,
# For paying my online bill.
# Scenario: The Master Cardholder uses the Master card for online payment.
#     Given I am a Master Card Holder.
#     When I make online payments with my Master Card.
#     Then My master card is accepted



# Feature: Shopping on Tools QA
# I want to shop on Tools QA Shopping Website

# Scenario: Placing Order for 2 Shirts

# Given I open the Account Page for Tools QA
# And I do the registration for my user by entering username as "aashishk17" and email address as
# "aashish.khetarpal.07@gmail.com" and password as "cypresstutorials"
# And I do the assertions for Register Button and Register successfully by entering new password
# as "cypresstutorials77"
# When I do the search for shirts with below specifications
# | ShirtSpec  | Size | Color |
# | blue denim | 34 | Black |
# | playboy | 40 | Grey |
# Then I do the verification on the Cart Page that it contains "blue denim" and "playboy"
# and do the checkout successfully
# And I do the login with same credentials used above "aashish.khetarpal.07@gmail.com" and "cypresstutorials"
# And I enter all the billing details and then place the order
# | BillingFirstName | BillingLastName | StreetAddress | City | PostalCode | Phone |
# | Aashish | Khetarpal | 77 | Gurgaon | 122001 | 7777777777 |
# And I verify that order has been successfully placed

# https://shop.demoqa.com/cart/





# And('I do the registration for my user by entering username as {string} and email address as {string}
# and password as {string}', (Username , Email , Password) => {
# homePage.getUserName().type(Username);
# homePage.getEmail().type(Email);
# homePage.getPassword().type(Password);
# })

# And ('I do the assertions for Register Button and Register successfully by entering new password
# as {string}', (NewPassword) => {
# //homePage.getRegisterButton().should('have.attr','disabled','disabled');
# //homePage.getRegisterButton().should('be.disabled');
# //homePage.getPassword().type(NewPassword);
# homePage.getRegisterButton().click();
# })

# When ('I do the search for shirts with below specifications', datatable => {
#     datatable.hashes().forEach(row => {
#     cy.selectProduct(row.ShirtSpec,row.Size,row.Color);
#     })
# })

# Then ('I do the verification on the Cart Page that it contains {string} and {string} and do the checkout
# successfully' , (ProductText1 , ProductText2) => {
#     //End to End Test Completion including Checkout and Placing Order
#     checkoutPage.getCartButton().click();
#     //Validate if the items we added are successfully there in the cart using should and expect together.
#     checkoutPage.getProducts().should(($p) => {
#     expect($p).to.have.length(2); // There should be 2 items in cart.
#     expect($p.first()).to.contain(ProductText1); // First Element should have blue denim
#     expect($p).to.contain(ProductText2); // Verifying that playboy shirt should also be there
#     });
#     checkoutPage.getCheckoutButton().click();
# })

# And ('I do the login with same credentials used above {string} and {string}',(Email , Password) => {
#     billingPage.getShowLogin().click();
#     billingPage.getLoginUserName().type(Email);
#     billingPage.getLoginPassword().type(Password);
#     billingPage.getLoginButton().click();
# })

# And ('I enter all the billing details and then place the order', datatable => {
#     datatable.hashes().forEach(row => {
#     billingPage.getBillingFirstName().clear().type(row.BillingFirstName);
#     billingPage.getBillingLastName().clear().type(row.BillingLastName);
#     billingPage.getBillingAddress().clear().type(row.StreetAddress);
#     billingPage.getStateDropdown().click().then(function(){
#         billingPage.getStateSearchBox().clear().type('Haryana').type('{enter');
#     });
#     billingPage.getBillingCity().clear().type(row.City);
#     billingPage.getBillingPostCode().clear().type(row.PostalCode);
#     billingPage.getBillingPhone().clear().type(row.Phone);

#     //Placing the Order button click by selecting the checkbox

#     billingPage.getTermsCheckbox().click();
#     billingPage.getPlaceOrderButton().click();
# })
# })

# And ('I verify that order has been successfully placed',() => {
#     billingPage.getOrderPlacedText().then(function(element){
#     expect(element.text().includes("Thank you")).to.be.true;
# })
# })
# })