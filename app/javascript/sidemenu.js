document.addEventListener('turbolinks:load', function () {
  $(function () {
    let flag = false;

    $('#open_btn').on('touchstart click', function (event) {
      if (event.type === 'touchstart') {
        flag = true;
      }

      if (flag) {
        flag = false;
      } else {
        $(this).toggleClass('active');
        $('#side_menu_shop, #side_menu_shop_f, #side_menu_user').toggleClass('active');
        if ($('#modal').is('.scale-100')) {
          $('#modal, #close_btn_footer').removeClass('scale-100');
          $('#app_guide_wrapper').removeClass('hidden');
        }
      }
    });
  });
});
