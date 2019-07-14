const modal = document.getElementById('modal-rating')
const rating_button = document.getElementById('trigger-rating')
const cancel = document.getElementById('cancel')

const open_modal = function() {
  modal.classList.add('is-active');
};

const close_modal = function() {
  modal.classList.remove('is-active');
};

rating_button.onclick = open_modal
cancel.onclick = close_modal
