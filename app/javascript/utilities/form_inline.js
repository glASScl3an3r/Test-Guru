class FormInline {
  static setEventHandlersToLinks() {
    const errors = document.querySelector('.resource-errors')
    if (errors) {
      const resourceId = errors.dataset.resourceId
      new FormInline(resourceId).handle()

      return
    }

    const links = document.querySelectorAll('.form-inline-link')
    if (!links.length) return

    for (let i = 0; i < links.length; i++) {
      links[i].addEventListener('click', (event) => {
        event.preventDefault()

        const testId = event.currentTarget.dataset.testId
        new FormInline(testId).handle()
      })
    }

  }

  constructor(testId) {
    this.testId = testId
  }

  handle() {
    const link = document.querySelector(`.form-inline-link[data-test-id="${this.testId}"]`)
    const title = document.querySelector(`.test-title[data-test-id="${this.testId}"]`)
    const formInline = document.querySelector(`.form-inline[data-test-id="${this.testId}"]`)

    if (!formInline || !link || !title) return

    if (formInline.classList.contains('hide')) {
      formInline.classList.remove('hide')
      title.classList.add('hide')
      link.textContent = 'Cancel'
    }
    else {
      formInline.classList.add('hide')
      title.classList.remove('hide')
      link.textContent = 'Edit'
    }
  }
}

export default FormInline
