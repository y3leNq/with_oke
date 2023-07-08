import { Controller } from "@hotwired/stimulus"
import { Toast } from "bootstrap"

// Connects to data-controller="toast"
export default class extends Controller {
  connect() {
    const toast = new Toast(this.element, {
      delay: 2000
    })
    toast.show()
  }
}
