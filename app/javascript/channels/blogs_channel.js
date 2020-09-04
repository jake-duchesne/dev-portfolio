import consumer from "./consumer"
import { Callbacks } from "jquery";

console.log("whatever");

function connectChannel(blog_id) {
  let comments = $('#comments');

  consumer.subscriptions.create({
    channel: "BlogsChannel",
    blog_id: blog_id,
    

    connected() {
      console.log("Connected to the room!");
    },
    disconnected() {
      console.log("Disconnected from the room!");
    },
    received(data) {
      console.log('data received', data)
      return comments.append(data(['comment']));
    },
    send_comment(comment, blog_id) {
      return this.perform('send_comment', {
        comment: comment,
        blog_id: blog_id
      })
    },
  });
}

console.log("hello")

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
