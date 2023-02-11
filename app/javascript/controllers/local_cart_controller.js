import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="local-cart"
export default class extends Controller {

    connect() {
        sessionStorage.setItem('cart', '');

    }

    addProduct(event) {

        let cart = {};
        cart.id = event.target.id.value;
        cart.amount = event.target.amount.value;

        //console.log(cart);

        let temp = sessionStorage.getItem('cart');
        if (temp == '') {
            let arr = []
            arr.push(cart)
            temp = JSON.stringify(arr);
        }
        else {
            let arr = JSON.parse(sessionStorage.getItem('cart'));

            for (let i = 0; i < arr.length; i++) {
                if (arr[i].id == cart.id) {
                    arr[i] = cart;
                    temp = JSON.stringify(arr);
                    sessionStorage.setItem('cart', temp);
                    console.log(sessionStorage.getItem('cart'));
                    return;
                }
            }

            arr.push(cart);
            temp = JSON.stringify(arr);
        }

        sessionStorage.setItem('cart', temp);
        console.log(sessionStorage.getItem('cart'));
    }

    getProducts() {
        let arr = JSON.parse(sessionStorage('cart'))

    }

}
