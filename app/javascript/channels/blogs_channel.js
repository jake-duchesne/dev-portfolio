import consumer from "./consumer"

let comments;
comments = $('#comments');

consumer.subscriptions.create("BlogsChannel", {

  connected() {
    console.log("Connected to the room!");
  },

  disconnected() {
    console.log("Disconnected from the room!");
  },

  received(data) {
    return comments.append(data(['comment']));
  },

  send_comment(comment, blog_id) {
    return this.perform('send_comment', {
      comment: comment,
      blog_id: blog_id
    })
  }

});

// Clear textarea
let submit_messages;

$(document).on('turbolinks:load', function () {
  submit_messages()
})

submit_messages = function () {
  $('#new_comment').on('keydown', function (event) {
    if (event.keyCode == 13) {
      $('input').click()
      event.target.value = ''
      event.preventDefault()
    }
  })
}
