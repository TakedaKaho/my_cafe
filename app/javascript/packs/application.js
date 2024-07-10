// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "@popperjs/core";
import "bootstrap";
import "../stylesheets/application"; 

Rails.start()
Turbolinks.start()
ActiveStorage.start()

window.$ = window.jQuery = require('jquery');

import Raty from "raty.js"
window.raty = function(elem,opt) {
  let raty =  new Raty(elem,opt)
  raty.init();
  return raty;
}


  document.addEventListener('turbolinks:load', function() {
    const swiper = new Swiper('.swiper', {
      loop: true, // ループする
      autoplay: {
        delay: 1, // スライド間の待機時間（ミリ秒）
        disableOnInteraction: false, // ユーザー操作後も自動再生を続ける
      },
      speed: 10000, // スライドの速度（ミリ秒）
      pagination: {
        
        clickable: true, // クリック可能にする
      },
      
      effect: "coverflow",
      grabCursor: true,
      centeredSlides: true,
      slidesPerView: "3",

      coverflowEffect: {
        rotate: 50,
        stretch: 0,
        depth: 70, //奥行き
        modifier: 1,
        slideShadows: true //影あり
      },

    });
  });
