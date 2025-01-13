# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "@rails/actioncable", to: "actioncable.esm.js"

pin "masonry-layout", to: "https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js", preload: true
pin "app/javascript/channels/index.js"
pin_all_from "app/javascript/channels", under: "channels"
