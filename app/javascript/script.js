/*global $*/
$(document).ready(function () {
  $('.faq-title').click(function(){
    $(this).next('.faq-answer').slideToggle();
    $(this).toggleClass("open");
  });

  $('.answer-explanation-hidden').click(function(){
    $('.answer-explanation-show').slideToggle();
    $('.answer-explanation-show').toggleClass("open");
  });
});

