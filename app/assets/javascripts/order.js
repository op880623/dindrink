function display_info() {
  drink = info[document.getElementById("drink_id").value];
  document.getElementById("price").innerHTML = drink['price'];

  td_tag = document.getElementById("option");
  while (td_tag.childNodes.length > 0) {
    td_tag.removeChild(td_tag.childNodes[0]);
  }

  option_content = JSON.parse(drink['option']);
  for (key in option_content) {
    select_tag = document.createElement("select");
    td_tag.appendChild(select_tag);
    type = option_content[key];
    for (option in type) {
      option_tag = document.createElement("option");
      option_tag.setAttribute("value", type[option])
      option_tag.innerHTML = type[option];
      select_tag.appendChild(option_tag);
    }
  }
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
