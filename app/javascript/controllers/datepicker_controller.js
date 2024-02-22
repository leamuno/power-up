import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static values = { default: String }

  connect() {
    flatpickr(this.element, {
      defaultDate: this.defaultValue,
      dateFormat: "l, F j",
      mode: 'range',
    });
  }
}
