import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static target = ("title", "form")
  static value = { submitUrl: String }
  connect() {
    console.log("hellooooooo")
  }

  click() {
    console.log("clickkkk")
    this.titleTarget.value = "Hello Stimulus"
    this.submitUrl.value = "Hello Stimulus"
    console.log.value.submitUrl
  }

  submit() {
    console.log("clickkkk")
    // this.formTarget.value = "Hello Stimulus"
    // this.submitUrl.value = "Hello Stimulus"
    // console.log.value.submitUrl
    console.log(this.submitUrlValue)
    this.formTarget.action = this.submitUrlValue
  }
}
