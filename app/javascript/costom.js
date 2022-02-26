document.addEventListener('turbolinks:load', function () {
  $(function () {
    $('#select-drop').on('change', function () {
      $('#fee_change_btn').click();
    });
  });
});
