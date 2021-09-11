document.addEventListener('turbolinks:load', function () {
  $(function () {
    $(document).on('click touched', function (e) {
      if (
        !$(e.target).closest('#modal').length &&
        !$(e.target).closest('#modal_btn, #modal_btn_footer').length &&
        !$(e.target).closest('#open_btn, #side_menu_shop, #side_menu_shop_f').length
      ) {
        $('#modal, #close_btn_footer').removeClass('scale-100');
        $('#app_guide_wrapper').removeClass('hidden');
        $('#open_btn').removeClass('active');
        $('#side_menu_shop, #side_menu_shop_f').removeClass('active');
      } else if ($(e.target).closest('#modal_btn, #modal_btn_footer').length) {
        if ($('#modal').is('.scale-100')) {
          $('#modal, #close_btn_footer').removeClass('scale-100');
          $('#app_guide_wrapper').removeClass('hidden');
        } else {
          $('#modal, #close_btn_footer').addClass('scale-100');
          $('#app_guide_wrapper').addClass('hidden');
          $('#open_btn').removeClass('active');
          $('#side_menu_shop, #side_menu_shop_f').removeClass('active');
        }
      }
    });
    $('#close_btn, #close_btn_footer').on('click touched', function () {
      if ($('#modal').is('.scale-100')) {
        $('#modal, #close_btn_footer').removeClass('scale-100');
        $('#app_guide_wrapper').removeClass('hidden');
      }
    });
  });
});
