document.addEventListener('turbolinks:load', function () {
  $(function () {
    //タブをクリックしたら発動
    $('.tab_menu1').on('click', function () {
      $('.tab_menu2').removeClass('current');
      $('.tab_menu3').removeClass('current');
      $('.tab_menu1').addClass('current');
      $('.tab_item2').addClass('hidden');
      $('.tab_item3').addClass('hidden');
      $('.tab_item1').removeClass('hidden');
    });
    $('.tab_menu2').on('click', function () {
      $('.tab_menu1').removeClass('current');
      $('.tab_menu3').removeClass('current');
      $('.tab_menu2').addClass('current');
      $('.tab_item1').addClass('hidden');
      $('.tab_item3').addClass('hidden');
      $('.tab_item2').removeClass('hidden');
    });
    $('.tab_menu3').on('click', function () {
      $('.tab_menu1').removeClass('current');
      $('.tab_menu2').removeClass('current');
      $('.tab_menu3').addClass('current');
      $('.tab_item1').addClass('hidden');
      $('.tab_item2').addClass('hidden');
      $('.tab_item3').removeClass('hidden');
    });
  });
});
