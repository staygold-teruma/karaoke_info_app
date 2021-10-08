document.addEventListener('turbolinks:load', function () {
  $(function () {
    $('#form_fee_guide_usage_time').on('change', function () {
      $('#form_fee_guide_drink_plan option').attr('selected', false);
      $('#form_fee_guide_drink_plan').val('one_drink');
      let selected_time = $(this).val();
      if (selected_time == 'half_hour' || selected_time == 'one_hour') {
        $("#form_fee_guide_drink_plan option[value='lite_plan']").hide();
        $("#form_fee_guide_drink_plan option[value='variety_plan']").hide();
        $("#form_fee_guide_drink_plan option[value='deluxe_plan']").hide();
      } else {
        if ($("#form_fee_guide_drink_plan option[value='lite_plan']").css('display') == 'block') {
          return;
        } else {
          $("#form_fee_guide_drink_plan option[value='lite_plan']").show();
          $("#form_fee_guide_drink_plan option[value='variety_plan']").show();
          $("#form_fee_guide_drink_plan option[value='deluxe_plan']").show();
        }
      }
    });
  });
});
