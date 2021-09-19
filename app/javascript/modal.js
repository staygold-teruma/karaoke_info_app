document.addEventListener('turbolinks:load', function () {
  $(function () {
    $(document).on('click touchend', function (e) {
      if (!$(e.target).closest('#modal').length && !$(e.target).closest('#modal_btn, #modal_btn_footer').length) {
        $('#modal').removeClass('scale-100');
        $('#app_guide_wrapper').removeClass('hidden');
        $('#close_btn').addClass('hidden');
      }
    });

    $('#modal_btn').on('click touched', function () {
      if ($('#modal').is('.scale-100')) {
        $('#modal').removeClass('scale-100');
        $('#app_guide_wrapper').removeClass('hidden');
        $('#close_btn').addClass('hidden');
      } else {
        $('#modal').addClass('scale-100');
        $('#app_guide_wrapper').addClass('hidden');
        $('#close_btn').removeClass('hidden');
      }
    });

    $('#modal_btn_footer').on('click touched', function () {
      if ($('#modal').is('.scale-100')) {
        $('#modal').removeClass('scale-100');
        $('#app_guide_wrapper').removeClass('hidden');
        $('#close_btn').addClass('hidden');
      } else {
        $('#modal').addClass('scale-100');
        $('#app_guide_wrapper').addClass('hidden');
        $('#close_btn').removeClass('hidden');
      }
      if ($('#side_menu_shop_f').is('.active')) {
        $('#open_btn').toggleClass('active');
        $('#side_menu_shop_f').toggleClass('active');
      }
      if ($('#side_menu_user').is('.active')) {
        $('#open_btn').toggleClass('active');
        $('#side_menu_user').toggleClass('active');
      }
    });

    $('#close_btn').on('click touched', function () {
      $('#modal').removeClass('scale-100');
      $('#app_guide_wrapper').removeClass('hidden');
      $('#close_btn').addClass('hidden');
    });
  });
});
