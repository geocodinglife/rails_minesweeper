// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "@hotwired/turbo-rails"

document.addEventListener("DOMContentLoaded", function(event) {

  const modalToggleTriggers = document.querySelectorAll('.modal-toggle')
  console.log(modalToggleTriggers)
  modalToggleTriggers.forEach(element => {
    element
      .addEventListener('click', (e) => {
        e.preventDefault()
        const newBoardModal = document.querySelector('#board-form-modal')
        const currentStatus = newBoardModal.getAttribute('open')
        console.log('currentStatus', currentStatus)
        const newStatus = currentStatus === 'true' ? 'false' : 'true'
        newBoardModal.setAttribute('open', newStatus)
        console.log('trigger')
      })

  })
});
