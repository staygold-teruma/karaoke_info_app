document.addEventListener('turbolinks:load', function () {
  $(function () {
    $('#datepicker').on('change', function () {
      let selected_num = $('#form_fee_guide_shop_id').val();
      let date_value = $('#datepicker').val();
      let selected_date = new Date(date_value);
      let selected_wday = selected_date.getDay();
      if (selected_num == '2') {
        if (selected_wday == 0 || selected_wday == 6) {
          $('.start_time2').hide();
          $('.start_time1').show();
        } else {
          $('.start_time1').hide();
          $('.start_time2').show();
        }
      } else {
        $('.start_time2').hide();
        $('.start_time1').show();
      }
    });
  });
});
