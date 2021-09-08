import 'slick-carousel';
import 'slick-carousel/slick/slick.scss';
import 'slick-carousel/slick/slick-theme.scss';

document.addEventListener('turbolinks:load', function () {
  $(function () {
    $('.regular').slick({
      autoplay: true,
      autoplaySpeed: 5000,
      arrows: false,
      dots: true,
      speed: 500,
    });
  });
});
