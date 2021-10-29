document.addEventListener('turbolinks:load', function () {
  $(function () {
    $('#table').hide();
    $('.fee_table1').show();
    $('#fee_table_select').on('change', function () {
      let selected_shop = $('#fee_table_select').val();
      if (selected_shop == 'ikuta') {
        $('.fee_table2').hide();
        $('.fee_table1').show();
      } else {
        $('.fee_table1').hide();
        $('.fee_table2').show();
      }
    });
  });
});
