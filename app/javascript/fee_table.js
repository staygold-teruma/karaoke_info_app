document.addEventListener('turbolinks:load', function () {
  $(function () {
    $('.fee_table1').show();
  });

  $(function () {
    $('#fee_table_select').on('change', function () {
      let prefix = 'fee_table';
      let select_num = $('#fee_table_select').val();
      let target = $('.' + prefix + select_num);
      $('.fee_table1').hide();
      $('#fee_table').hide();
      target.show();
    });
  });
});
