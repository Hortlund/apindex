import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["dialog"]

  connect() {
  }

  open(event) {
    event.preventDefault()
    this.dialogTarget.classList.remove('hidden')
    document.body.classList.add('modal-open')
  }

  close(event) {
    event.preventDefault()
    this.dialogTarget.classList.add('hidden')
    document.body.classList.remove('modal-open')
  }
}
