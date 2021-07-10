class PasswordChecker {
  static setPasswordConfirmationTo(passwordId, passwordConfirmId) {
    const pass = document.getElementById(passwordId)
    const passConfirm = document.getElementById(passwordConfirmId)

    if (pass && passConfirm) {
      const fCheck = () => { new PasswordChecker(pass, passConfirm).check() }
      passConfirm.addEventListener('input', fCheck)
      pass.addEventListener('input', fCheck)
    }
  }

  constructor(pass, passConfirm) {
    this.pass = pass
    this.passConfirm = passConfirm
  }

  check() {
    const passValue        = this.pass.querySelector('input').value
    const passConfirmValue = this.passConfirm.querySelector('input').value

    const correct = '.octicon-check'
    const wrong = '.octicon-blocked'

    if (passConfirmValue == "") {
      //hide all
      this.pass.querySelector(wrong).classList.add('hide')
      this.pass.querySelector(correct).classList.add('hide')
      this.passConfirm.querySelector(wrong).classList.add('hide')
      this.passConfirm.querySelector(correct).classList.add('hide')
    }
    else if (passConfirmValue == passValue) {
      //matched
      this.pass.querySelector(correct).classList.remove('hide')
      this.passConfirm.querySelector(correct).classList.remove('hide')

      this.pass.querySelector(wrong).classList.add('hide')
      this.passConfirm.querySelector(wrong).classList.add('hide')
    }
    else {
      this.pass.querySelector(wrong).classList.remove('hide')
      this.passConfirm.querySelector(wrong).classList.remove('hide')

      this.pass.querySelector(correct).classList.add('hide')
      this.passConfirm.querySelector(correct).classList.add('hide')
    }
  }
}

export default PasswordChecker
