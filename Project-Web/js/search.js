function searchTable() {
  var input, filter, table, tr, td, i, j, txtValue;
  input = document.getElementById("search-input");
  filter = input.value.toUpperCase();
  table = document.getElementById("games-table");
  tr = table.getElementsByTagName("tr");


  for (i = 0; i < tr.length; i++) {

    for (j = 0; j < tr[i].cells.length; j++) {
      td = tr[i].cells[j];
      if (td) {
        txtValue = td.textContent || td.innerText;

        txtValue = txtValue.replace(/"/g, "&quot;");
        txtValue = txtValue.replace(/'/g, "&#039;");
        txtValue = txtValue.replace(/</g, "&lt;");
        txtValue = txtValue.replace(/>/g, "&gt;");
        if (txtValue.toUpperCase().indexOf(filter) > -1) {

          txtValue = txtValue.replace(new RegExp(filter, 'gi'), '<span class="highlighted-text">$&</span>');
          td.innerHTML = txtValue;
        } else {

          td.innerHTML = txtValue;
        }
      }
    }
  }
}
