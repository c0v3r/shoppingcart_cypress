const USERNAME_TXT = "input[name='username']";
const PASSWORD_TXT  = "input[name='password']";
const SIGN_BTN  = "button[type='submit']";

class LoginPage {
  getUserName() {
    cy.get(USERNAME_TXT, { timeout: 10000 }).should('be.visible');
    return cy.get(USERNAME_TXT);
  }

  getPassword() {
    return cy.get(PASSWORD_TXT);
  }

  fillEmail(value) {
    const field = cy.get(`[data-testid=SignInEmailField]`);
    field.clear();
    field.type(value);

    return this;
  }

  fillPassword(value) {
    const field = cy.get(`[data-testid=SignInPasswordField]`);
    field.clear();
    field.type(value);

    return this;
  }

  getLoginBtn() {
    return cy.get(SIGN_BTN);
  }
}

const loginPage = new LoginPage();
export default loginPage;
