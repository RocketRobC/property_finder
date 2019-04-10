var modal = document.getElementById('modal-rating')
var rating_button = document.getElementById('trigger-rating')
var cancel = document.getElementById('cancel')

var open_modal = function() {
  modal.classList.add('is-active');
};

var close_modal = function() {
  modal.classList.remove('is-active');
};

rating_button.onclick = open_modal
cancel.onclick = close_modal
