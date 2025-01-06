document.addEventListener("DOMContentLoaded", () => {
  const images = document.querySelector(".images");
  const slides = document.querySelectorAll(".btm-slides span");
  const leftArrow = document.querySelector(".sliders.left");
  const rightArrow = document.querySelector(".sliders.right");
  let index = 0;
  const totalSlides = slides.length;

  function updateSlide() {
    images.style.transform = `translateX(-${index * 100}%)`;
    slides.forEach((slide, idx) => {
      slide.classList.toggle("active", idx === index);
    });
  }

  let startX = 0;
  let isDragging = false;

  images.addEventListener("touchstart", (e) => {
    startX = e.touches[0].clientX;
    isDragging = true;
  });

  images.addEventListener("touchmove", (e) => {
    if (!isDragging) return;
    const touchX = e.touches[0].clientX;
    const deltaX = startX - touchX;

    if (Math.abs(deltaX) > 50) {
      isDragging = false;
      if (deltaX > 0) {
        index = (index + 1) % totalSlides;
      } else {
        index = (index - 1 + totalSlides) % totalSlides;
      }
      updateSlide();
    }
  });

  images.addEventListener("touchend", () => {
    isDragging = false;
  });

  function nextSlide() {
    index = (index + 1) % totalSlides;
    updateSlide();
  }

  function prevSlide() {
    index = (index - 1 + totalSlides) % totalSlides;
    updateSlide();
  }

  slides.forEach((slide, idx) => {
    slide.addEventListener("click", () => {
      index = idx;
      updateSlide();
    });
  });

  leftArrow.addEventListener("click", prevSlide);
  rightArrow.addEventListener("click", nextSlide);

  updateSlide();
});
