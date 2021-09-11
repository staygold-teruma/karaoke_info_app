document.addEventListener('turbolinks:load', function () {
  $(function () {
    $('.dd_menu li').hover(
      function () {
        //クラス名「open」を付与する
        $(this).children('.dd_menu_sub').addClass('open');
        //hoverが外れた場合
      },
      function () {
        //クラス名「open」を取り除く
        $(this).children('.dd_menu_sub').removeClass('open');
      }
    );

    $('#open_btn').on('click', function () {
      if ($('#modal').is('.scale-100')) {
        $('#modal, #close_btn_footer').removeClass('scale-100');
        $('#app_guide_wrapper, #coupon_wrapper, #coupon_guide').removeClass('hidden');
      }
      $(this).toggleClass('active');
      $('#side_menu_shop').toggleClass('active');
      $('#side_menu_shop_f').toggleClass('active');
    });
  });
});
