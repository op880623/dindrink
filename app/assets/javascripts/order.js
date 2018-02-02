function display_info() {
  drink = info[document.getElementById("drink_id").value];
  document.getElementById("price").innerHTML = drink['price'];
  document.getElementById("option").innerHTML = drink['option'];
}

var info;

function get_drinks_info(shop_id) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      info = JSON.parse(this.response);
      display_info();
    }
  };
  xhttp.open('GET', shop_id+'/drinks', true);
  xhttp.send();
}
