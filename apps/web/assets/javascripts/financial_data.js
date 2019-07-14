const modal = document.getElementById('modal-update')
const trigger_link = document.getElementById('trigger-edit')
const cancel = document.getElementById('cancel')

const open_modal = function() {
  modal.classList.add('is-active');
};

const close_modal = function() {
  modal.classList.remove('is-active');
};

trigger_link.onclick = open_modal
cancel.onclick = close_modal
