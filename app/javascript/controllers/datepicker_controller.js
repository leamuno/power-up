import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"

export default class extends Controller {
  static values = { default: String, unavailable: Array }

  connect() {
    const end_date = document.querySelector('#booking_end_date').value
    const end_date_input = document.querySelector('#booking_end_date')

    const config = {
      "plugins": [new rangePlugin({ input: "#booking_end_date"})],
      disable: this.unavailableValue,
      mode: 'range',
      dateFormat: "Y-m-d",
      defaultDate: this.defaultValue,
    };

    flatpickr(this.element, config, {
    });

    end_date_input.value = end_date;
  }
}
