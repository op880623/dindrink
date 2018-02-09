function display_price() {
  drink = info[$("#drink_id")[0].value];
  $("#price")[0].innerHTML = drink['price'];
}

function display_update_price() {
  drink = info[$("#update_drink_id")[0].value];
  $("#update_price")[0].innerHTML = drink['price'];
}

var info;

function get_drinks_info() {
  $.get(window.location.pathname + '/drinks', function(data) {
    info = data;
    display_price();
  });
}

function update_entry(event, entry_id) {
  $("#cancel").click();
  ul_tag = event.target.parentElement;
  form_tag = $("#drink_id")[0].parentElement.cloneNode(true);
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

  var btn = document.createElement("p");
  btn.innerHTML = '取消';
  btn.id = 'cancel';
  btn.setAttribute('class', 'btn btn-default');
  form_tag.appendChild(btn);

  ul_tag.parentElement.replaceChild(form_tag, ul_tag);
  display_update_price();

  $("#cancel").click(function(event) {
    form_tag.parentElement.replaceChild(ul_tag, form_tag);
  });
}

function get_drink_id_from_name(name) {
  for (var i in info) {
    if (info[i]['name'] == name) {
      return i;
    }
  }
}

$(document).ready(function() {
  get_drinks_info();
  $("#delete_drink_btn")[0].href = "drinks/" + $("#delete_drink_select")[0].value;
  $("#delete_drink_select").change(function() {
    $("#delete_drink_btn")[0].href = "drinks/" + $("#delete_drink_select")[0].value;
  });
});
