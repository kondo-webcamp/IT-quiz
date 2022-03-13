/*global $*/
$(document).ready(function () {
  $('.faq-title').click(function(){
    $(this).next('.faq-answer').slideToggle();
    $(this).toggleClass("open");
  });
});

