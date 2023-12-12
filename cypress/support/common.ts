/// <reference types="cypress" />
// Above line needed as indicator for Cypress

class Common {

    // Function need to be called by Step definition files
    static goToLoginPage() {
        cy.visit("/");
    }

    static clickSignin() {
        cy.get('#navbarSupportedContent').contains('Sign In').click()
    }

    static fillUsername(username: string) {
        cy.get('#user_email').type(username)
    }

    static fillPassword(password: string) {
        cy.get('#user_password').type(password)
    }

    static clickLogin() {
        cy.get('.new_user').contains('Log in').click()
    }

    static signOutDisplayed() {
        cy.get('#navbarSupportedContent').contains('Sign Out').click();
    }
}// Export as Module for re-usability
export default Common