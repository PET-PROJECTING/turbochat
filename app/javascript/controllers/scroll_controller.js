import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    const messagesContainer = document.getElementById("messages");
    messagesContainer.addEventListener('DOMNodeInserted', this.scrollToElement);
    this.scrollToElement();
  }

  scrollToElement() {
    const lastMessage = document.querySelector('#messages > div:last-child')
    lastMessage.scrollIntoView(false);
  }
}