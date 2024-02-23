import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"

export default class extends Controller {
  static values = {unavailable: Array }

  connect() {
    const sum_field = document.querySelector('#total')
    const cost_calculation_field = document.querySelector('#cost-calculation')

    const daily_rate = document.querySelector('#power-price-for-calculation').innerHTML
    cost_calculation_field.innerHTML = `${daily_rate}0$ X 2 Days`
    sum_field.innerHTML = `Total: ${parseInt(daily_rate) + parseInt(daily_rate)}.00$`



    const config = {
      "plugins": [new rangePlugin({ input: "#booking_end_date"})],
      disable: this.unavailableValue,
      mode: 'range',
      dateFormat: "Y-m-d",
    };

    flatpickr(this.element, config, {
    });


    onchange = function(dateObj) {

      const set_start_date = dateObj.target._flatpickr.selectedDates[0];
      const set_end_date = dateObj.target._flatpickr.selectedDates[1];

      const diffInMs = Date.parse(set_end_date) - Date.parse(set_start_date);
      const diffInDays = diffInMs / (1000 * 60 * 60 * 24) + 1;
      const sum = diffInDays * parseInt(daily_rate);

      sum_field.innerHTML = `Total: ${sum}$`
      cost_calculation_field.innerHTML = `${daily_rate}0$ X ${diffInDays} Days`
    };
  }
}
