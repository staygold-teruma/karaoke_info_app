document.addEventListener('turbolinks:load', function () {
  $(function () {
    $('#form_fee_guide_shop_id').on('change', function () {
      $('.business_hour_box').hide();
      $('.business_hour_box').hide();
      let selected_num = $(this).val();
      let date_value = $('#datepicker').val();
      let selected_date = new Date(date_value);
      let selected_wday = selected_date.getDay();
      if (selected_num == '1') {
        $('#business_hours_ikuta').show();
      } else {
        $('#business_hours_ekimae').show();
      }

      if (selected_num == '2') {
        if (selected_wday == 0 || selected_wday == 6) {
          $('.start_time_ekimae').hide();
          $('.start_time_ikuta').show();
        } else {
          $('.start_time_ikuta').hide();
          $('.start_time_ekimae').show();
        }
      } else {
        $('.start_time_ekimae').hide();
        $('.start_time_ikuta').show();
      }
    });
  });
});
