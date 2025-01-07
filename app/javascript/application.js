// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import * as bootstrap from "bootstrap"
import "./channels"

import subscribeToCategory from "./category_subscription_channel";

document.addEventListener("DOMContentLoaded", () => {
    console.log("eawe")
    const categoryId = document.getElementById("category").dataset.categoryId;

    subscribeToCategory(categoryId, (data) => {
        alert(data.message);
    });
});