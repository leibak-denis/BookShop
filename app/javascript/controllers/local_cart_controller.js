import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="local-cart"
export default class extends Controller {

  connect() {
    sessionStorage.setItem('cart', '');
	}
}
