import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["scoreboard", "form", "toggleButton", "notification"]

  connect() {
    this.element.addEventListener('show-notification', this.handleNotification.bind(this))
  }

  disconnect() {
    this.element.removeEventListener('show-notification', this.handleNotification.bind(this))
  }

  // Helper method to retrieve CSRF token
  get csrfToken() {
    return document.querySelector('meta[name="csrf-token"]').getAttribute('content')
  }

  toggleForm() {
    if (this.formTarget.style.display === 'none' || this.formTarget.style.display === '') {
      this.formTarget.style.display = 'block'
      this.toggleButtonTarget.textContent = 'Göm formulär'
    } else {
      this.formTarget.style.display = 'none'
      this.toggleButtonTarget.textContent = 'Skicka in ditt formulär'
    }
  }

  hideForm() {
    this.formTarget.style.display = 'none'
    this.toggleButtonTarget.textContent = 'Skicka in ditt formulär'
  }

  showNotification(message, type = 'success') {
    this.notificationTarget.innerHTML = `<p>${message}</p>`
    if (type === 'success') {
      this.notificationTarget.style.backgroundColor = '#d4edda'
      this.notificationTarget.style.color = '#155724'
      this.notificationTarget.style.borderColor = '#c3e6cb'
    } else if (type === 'error') {
      this.notificationTarget.style.backgroundColor = '#f8d7da'
      this.notificationTarget.style.color = '#721c24'
      this.notificationTarget.style.borderColor = '#f5c6cb'
    }
    this.notificationTarget.style.display = 'block'

    setTimeout(() => {
      this.hideNotification()
    }, 3000)
  }

  hideNotification() {
    this.notificationTarget.style.display = 'none'
  }

  handleNotification(event) {
    const { message, type } = event.detail
    if (type === 'success') {
      this.hideForm()
    }
    this.showNotification(message, type)
  }
}
