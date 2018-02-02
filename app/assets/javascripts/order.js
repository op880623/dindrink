var price;

function get_drinks_prices(shop_id) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      price = JSON.parse(this.response);
      change_price();
    }
  };
  xhttp.open('GET', shop_id+'/drinks', true);
  xhttp.send();
};
