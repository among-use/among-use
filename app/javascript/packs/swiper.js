const swiper = new Swiper(".swiper-container", {
  direction: "vertical",
  loop: true,
  speed: 4000,
  autoplay: {
    delay: 2500,
    disableOnInteraction: false,
  },
  pagination: {
    el: ".swiper-pagination",
    clickable: true,
  },
  effect: 'fade',
  fadeEffect: {
    crossFade: true
  },
});
