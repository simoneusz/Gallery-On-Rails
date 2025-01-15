import "@hotwired/turbo-rails";
import "controllers";

import * as bootstrap from "bootstrap";
import "imagesloaded"
import "masonry-layout";
import "channels"

function init_masonry() {
  let masonryContainer = document.querySelector("#masonry-gallery");
  if (masonryContainer) {
    imagesLoaded(masonryContainer, function () {
      new window.Masonry(masonryContainer, {
        itemSelector: ".masonry",
        percentPosition: true,
        gutter: 0,
      });
    });
  }
}

document.addEventListener("turbo:load", init_masonry);
document.addEventListener("DOMContentLoaded", init_masonry);
