document.addEventListener('turbolinks:load', function () {
  $(function () {
    // ドロップダウンメニュー
    //.dropdown-menuを一旦隠す
    $('.menu').find('.dropdown-menu').hide();
    //.menuをhoverした場合
    $('.menu').hover(
      function () {
        //.dropdown-menuをslideDown
        $('.dropdown-menu:not(:animated)', this).slideDown();
        //hoverが外れた場合
      },
      function () {
        //.dropdown-menuをslideUp
        $('.dropdown-menu', this).slideUp();
      }
    );
  });
});
