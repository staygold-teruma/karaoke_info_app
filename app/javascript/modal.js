document.addEventListener('turbolinks:load', function () {
  $(function () {
    $(document).on('click touched', function (e) {
      if (!$(e.target).closest('#modal').length && !$(e.target).closest('#modal_btn').length) {
        $('#modal').removeClass('scale-100');
        $('#app_guide_wrapper').removeClass('hidden');
      } else if ($(e.target).closest('#modal_btn').length) {
        if ($('#modal').is('.scale-100')) {
          $('#modal').removeClass('scale-100');
          $('#app_guide_wrapper').removeClass('hidden');
        } else {
          $('#modal').addClass('scale-100');
          $('#app_guide_wrapper').addClass('hidden');
        }
      }
    });
    $('#close_btn').on('click touched', function () {
      if ($('#modal').is('.scale-100')) {
        $('#modal').removeClass('scale-100');
        $('#app_guide_wrapper').removeClass('hidden');
      }
    });
  });
});
