document.addEventListener('turbolinks:load', function () {
  $(function () {
    $('#datepicker').on('change', function () {
      let selected_num = $('#form_fee_guide_shop_id').val();
      let date_value = $('#datepicker').val();
      let selected_date = new Date(date_value);
      let selected_wday = selected_date.getDay();
      if (selected_num == '2') {
        if (selected_wday == 0 || selected_wday == 6) {
          $('#form_fee_guide_start_time_hour').prepend($('<option>').html('10').val('10'));
          $('#form_fee_guide_start_time_hour option[value=10]').prop('selected', true);
        } else {
          $('#form_fee_guide_start_time_hour option[value=10]').remove();
        }
      } else {
        $('#form_fee_guide_start_time_hour option[value=10]').remove();
      }
    });
  });
});
