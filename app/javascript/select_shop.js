document.addEventListener('turbolinks:load', function () {
  $(function () {
    $('#form_fee_guide_shop_id').on('change', function () {
      $('.business_hour_box').hide();
      let selected_num = $(this).val();
      if (selected_num == '1') {
        $('#business_hours1').show();
      } else {
        $('#business_hours2').show();
      }
    });
  });
});
