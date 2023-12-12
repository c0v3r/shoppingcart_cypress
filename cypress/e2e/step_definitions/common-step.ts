import { defineStep } from "@badeball/cypress-cucumber-preprocessor";

defineStep("I want to wait", function() {
  cy.wait(9000);
});
