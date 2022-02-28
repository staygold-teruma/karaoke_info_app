document.addEventListener('turbolinks:load', function () {
  $(function () {
    $('#form_fee_guide_shop_id').on('change', function () {
      let selected_num = $(this).val();
      $('#select-shop-business_hour').val(selected_num);
      $('#business_hour_change_btn').click();
    });
  });
});
