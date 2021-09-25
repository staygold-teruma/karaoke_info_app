document.addEventListener('turbolinks:load', function () {
  $(function () {
    $('#fee_guide_usage_time').on('change', function () {
      $('#fee_guide_drink_plan').val('one_hour');
      let selected_time = $(this).val();
      if (selected_time == 'half_hour' || selected_time == 'one_hour') {
        $("#fee_guide_drink_plan option[value='lite_plan']").hide();
        $("#fee_guide_drink_plan option[value='variety_plan']").hide();
        $("#fee_guide_drink_plan option[value='deluxe_plan']").hide();
      } else {
        if ($("#fee_guide_drink_plan option[value='lite_plan']").css('display') == 'block') {
          return;
        } else {
          $("#fee_guide_drink_plan option[value='lite_plan']").show();
          $("#fee_guide_drink_plan option[value='variety_plan']").show();
          $("#fee_guide_drink_plan option[value='deluxe_plan']").show();
        }
      }
    });
  });
});
