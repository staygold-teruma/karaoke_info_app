document.addEventListener('turbolinks:load', function () {
  $(function () {
    $('#datepicker').datepicker({
      dateFormat: 'yy年mm月dd日',
    });
  });
});
