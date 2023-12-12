import {
  Given,
  When,
  Then,
  DataTable,
} from "@badeball/cypress-cucumber-preprocessor";
import loginPage from "../pages/login";
//import assert from "assert";

//const loginPage = new LoginPage();

beforeEach(function () {
  // cy.fixture("login").then((data) => {
  //   this.data = data;
  // });
  cy.fixture("login").as("data");
});

Given(/^I navigate to the Website$/, () => {
 // cy.visit("/"); // "https://opensource-demo.orangehrmlive.com/web/index.php/auth/login"
  cy.log(Cypress.config().baseUrl)
  cy.log(Cypress.env('username'))
  cy.log(Cypress.env('ENV'))
  let environment: string = Cypress.env('ENV');
  if(environment === "qa") {
    cy.visit("/");
    cy.log('username qa: '+Cypress.env('username_qa'))
    cy.log('password qa: '+Cypress.env('password_qa'))
  }else{
    cy.visit("/");
  }
});

When(/^I try to login with correct credentials$/, function () {
  loginPage.getUserName().type(this.data.username);
  loginPage.getPassword().type(this.data.password);
  loginPage.getLoginBtn().click();
});

When("I login", (datatable: DataTable) => {
  datatable.hashes().forEach((element) => {
    loginPage.getUserName().type(element.username);
    loginPage.getPassword().type(element.password);
  });
});

When(
  "User enters username as {string} and password as {string}",
  (username: string, password: string) => {
    cy.get('input[name="username"]').type(username);
    cy.get('input[name="password"]').type(password);
  }
);

When("User clicks on login button", () => {
  cy.get('button[type="submit"]').click();
});

Then("I am able to successfully login to the Website", () => {
  cy.get('span > img[alt="profile picture"]').should("be.visible", {
    timeout: 10000,
  });
});

When(/^I enter "([^"]*)" with "([^"]*)"$/, (args1: string, args2: string) => {
  cy.get('input[name="username"]').type(args2);
});

When(
  /^I enter the "([^"]*)" with "([^"]*)"$/,
  (args1: string, args2: string) => {
    cy.get('input[name="password"]').type(args2);
  }
);

When("I press login button", () => {
  cy.get('button[type="submit"]').click();
});

Then(/^the user should be logged into the application$/, () => {
  cy.get('div[class="alert alert-danger alert-dismissible"]')
    .contains("Invalid credentials")
    .should("be.visible");
  // assert.equal("",,)
});

Then("I should see an {string} message", (error: string) => {
  cy.get("div[class='orangehrm-login-error'] > div> div > p").then(
    (element) => {
      expect(element.text()).to.equal(error);
    }
  );
});

When("I enter {string}", (username: string) => {
  cy.get('input[name="username"]').type(username);
});

When("enter {string}", (password: string) => {
  cy.get('input[name="password"]').type(password);
});

When("I click on login button", () => {
  cy.get("button").click();
});



When(/^I type in the registration form$/, (datatable: DataTable) => {
  datatable.hashes().forEach((element) => {
    if (element.username === "test2@qa.com") {
      cy.log("aca taaaa" + element.username);
    }
    loginPage.getUserName().type(element.username);
    loginPage.getPassword().type(element.password);
  });
});

Then(/^I should see an error "([^"]*)"$/, (error: string) => {
  cy.get("div[class='orangehrm-login-error'] > div> div > p")
    .contains(error)
    .should("be.visible");
});

When(/^I login in$/, (datatable: DataTable) => {
  datatable.hashes().forEach((element) => {
    loginPage.getUserName().type(element.username);
    loginPage.getPassword().type(element.password);
  });
});

//https://demo.nopcommerce.com/login?returnUrl=%2F

// When("I visit duckduckgo.com", function () {
//   cy.visit("https://duckduckgo.com");
//   cy.log("Test When log: " + this.data.password);
// });

// Then("I should see a search bar", () => {
//   cy.get("#searchbox_input").should(
//     "have.attr",
//     "placeholder",
//     "Search the web without being tracked"
//   );

//   cy.get("#searchbox_input").should(
//     "have.attr",
//     "placeholder",
//     "Search the web without being tracked"
//   );
// });

// # @smoke
//   # Scenario: visiting the frontpage
//   #   When I visit duckduckgo.com
//   #   Then I should see a search bar
