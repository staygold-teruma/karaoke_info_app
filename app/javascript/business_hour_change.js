document.addEventListener('turbolinks:load', function () {
  $(function () {
    $('#form_fee_guide_shop_id').on('change', function () {
      let selected_num = $(this).val();
      let date_value = $('#datepicker').val();
      let selected_date = new Date(date_value);
      let selected_wday = selected_date.getDay();
      $('#select-shop-business_hour').val(selected_num);
      $('#select-wday').val(selected_wday);
      $('#business_hour_change_btn').click();
    });
  });
});
