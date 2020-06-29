require("chartkick")
require("chart.js")
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// External imports
import "bootstrap";

// Internal imports

document.addEventListener('turbolinks:load', () => {
  document.querySelector('form').addEventListener('change', (e) => {
    document.querySelector('form').submit()
  })
});
