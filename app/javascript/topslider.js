import 'slick-carousel';
import 'slick-carousel/slick/slick.scss';
import 'slick-carousel/slick/slick-theme.scss';

document.addEventListener('turbolinks:load', function () {
  $(function () {
    $('.slick01').slick({
      dots: true,
      speed: 500,
    });
  });
});
