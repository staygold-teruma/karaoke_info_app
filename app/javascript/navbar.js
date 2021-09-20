document.addEventListener('turbolinks:load', function () {
  $(function () {
    $('.dd_menu li').children('.dd_menu_sub').removeClass('open');
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
  });
});
