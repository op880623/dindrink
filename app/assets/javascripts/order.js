function display_price() {
  drink = info[document.getElementById("drink_id").value];
  document.getElementById("price").innerHTML = drink['price'];
}

function display_update_price() {
  drink = info[document.getElementById("update_drink_id").value];
  document.getElementById("update_price").innerHTML = drink['price'];
}

var info;

function get_drinks_info(shop_id) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      info = JSON.parse(this.response);
      display_price();
    }
  };
  xhttp.open('GET', shop_id+'/drinks', true);
  xhttp.send();
}

function update_entry(event, entry_id) {
  ul_tag = event.currentTarget.parentElement;
  form_tag = document.getElementById("drink_id").parentElement.cloneNode(true);
  form_tag.action = 'entries/' + entry_id + '/update';

  form_tag.children[2].value = ul_tag.children[0].innerHTML;
  form_tag.children[3].value = get_drink_id_from_name(ul_tag.children[1].innerHTML);
  form_tag.children[3].setAttribute('onchange', 'display_update_price()');
  form_tag.children[3].id = 'update_drink_id';
  form_tag.children[4].id = 'update_price';
  form_tag.children[5].value = ul_tag.children[3].innerHTML;
  form_tag.children[6].value = ul_tag.children[4].innerHTML;
  form_tag.children[7].value = ul_tag.children[5].innerHTML;
  form_tag.children[8].value = '確定';

  ul_tag.parentElement.replaceChild(form_tag, ul_tag);
  display_update_price();
}

function get_drink_id_from_name(name) {
  for (var i in info) {
    if (info[i]['name'] == name) {
      return i;
    }
  }
}
