document.addEventListener('turbolinks:load', function () {
  $(function () {
    $(document).on('click touched', function (e) {
      if (!$(e.target).closest('#modal').length && !$(e.target).closest('#modal_btn, #modal_btn_footer').length) {
        $('#modal,#close_btn').removeClass('scale-100');
        $('#app_guide_wrapper').removeClass('hidden');
        $('#close_btn_footer').addClass('hidden');
      }
    });

    $('#modal_btn').on('click touched', function () {
      if ($('#modal').is('.scale-100')) {
        $('#modal,#close_btn').removeClass('scale-100');
        $('#app_guide_wrapper').removeClass('hidden');
        $('#close_btn_footer').addClass('hidden');
      } else {
        $('#modal,#close_btn').addClass('scale-100');
        $('#app_guide_wrapper').addClass('hidden');
        $('#close_btn_footer').removeClass('hidden');
      }
    });

    $('#modal_btn_footer').on('click touched', function () {
      if ($('#modal').is('.scale-100')) {
        $('#modal,#close_btn').removeClass('scale-100');
        $('#app_guide_wrapper').removeClass('hidden');
        $('#close_btn_footer').addClass('hidden');
      } else {
        $('#modal,#close_btn').addClass('scale-100');
        $('#app_guide_wrapper').addClass('hidden');
        $('#close_btn_footer').removeClass('hidden');
      }
    });

    $('#close_btn').on('click touched', function () {
      $('#modal,#close_btn').removeClass('scale-100');
      $('#app_guide_wrapper').removeClass('hidden');
      $('#close_btn_footer').addClass('hidden');
    });

    $('#close_btn_footer').on('click touched', function () {
      $('#modal,#close_btn').removeClass('scale-100');
      $('#app_guide_wrapper').removeClass('hidden');
      $('#close_btn_footer').addClass('hidden');
    });
  });
});
