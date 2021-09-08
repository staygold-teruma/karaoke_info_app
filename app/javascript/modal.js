document.addEventListener('turbolinks:load', function () {
  $(function () {
    $(document).on('click touched', function (e) {
      if (!$(e.target).closest('#modal').length && !$(e.target).closest('#modal_btn, #modal_btn_footer').length) {
        $('#modal, #close_btn_footer').removeClass('scale-100');
        $('#app_guide_wrapper, #coupon_wrapper, #coupon_guide').removeClass('hidden');
      } else if ($(e.target).closest('#modal_btn, #modal_btn_footer').length) {
        if ($('#modal').is('.scale-100')) {
          $('#modal, #close_btn_footer').removeClass('scale-100');
          $('#app_guide_wrapper, #coupon_wrapper, #coupon_guide').removeClass('hidden');
        } else {
          $('#modal, #close_btn_footer').addClass('scale-100');
          $('#app_guide_wrapper, #coupon_wrapper, #coupon_guide').addClass('hidden');
        }
      }
    });
    $('#close_btn, #close_btn_footer').on('click touched', function () {
      if ($('#modal').is('.scale-100')) {
        $('#modal').removeClass('scale-100');
        $('#app_guide_wrapper, #coupon_wrapper, #coupon_guide').removeClass('hidden');
      }
    });
  });
});
