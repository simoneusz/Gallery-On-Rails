// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

import * as bootstrap from "bootstrap";
import "masonry-layout";
import "./channels"

document.addEventListener("turbo:load", function () {
  let masonryContainer = document.querySelector("#masonry-gallery");
  if (masonryContainer) {
    new window.Masonry(masonryContainer, {
      itemSelector: ".masonry",
      percentPosition: true,
      gutter: 0,
    });
  }
});
