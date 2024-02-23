import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="booking-price"
export default class extends Controller {
  static targets = ["start_date", "end_date", "price", "info"];
  static values = { price: Number };
  
  connect() {

  }
}
