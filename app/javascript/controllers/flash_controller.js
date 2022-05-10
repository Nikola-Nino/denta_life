import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "flashdisplay" ]

  connect(){
    setTimeout(() => this.flashClose(), 4000)
 }

  flashClose() {
    this.flashdisplayTarget.classList.add("hidden")
  }

}