document.addEventListener('turbolinks:load', function () {
  $(function () {
    $('#dd_menu1').on('click touchend', function () {
      $(this).next().slideToggle(200);
    });
    $('#dd_menu2').on('click touchend', function () {
      $(this).next().slideToggle(200);
    });
    $('#dd_menu3').on('click touchend', function () {
      $(this).next().slideToggle(200);
    });

    //別の場所をクリックすると閉じる処理
    $(document).on('click touchend', function (event) {
      if (!$(event.target).closest('body').length) {
        $('#dd_list1,#dd_list2,#dd_list3').hide();
      }
    });

    $('#open_btn').on('click', function () {
      $(this).toggleClass('active');
      // $('#gnav_contents').toggleClass('active');
      $('#side_menu').toggleClass('active');
    });
  });
});
