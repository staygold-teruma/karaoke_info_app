document.addEventListener('turbolinks:load', function () {
  $(function () {
    $('#datepicker').datepicker({
      dateFormat: 'yy-mm-dd',
    });
  });
});
