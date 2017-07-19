// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener('DOMContentLoaded', function() {
  var form = document.querySelector('.new_picture');

  form.addEventListener('submit', function(event) {

    var cardList = document.querySelector('.card');
    var newCard = document.createElement('div');
    cardList.appendChild(newCard);
  });


  var addToDeck = document.querySelectorAll('.active-state-trigger');

  addToDeck.forEach(function (button) {
    button.addEventListener('click', function(event) {
      event.preventDefault();
      var card = button.parentElement;
      card.classList.add('active');
    });
  });
});
