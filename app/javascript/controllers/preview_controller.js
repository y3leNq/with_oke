import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="preview"
export default class extends Controller {
  static targets = ["audio", "icon"];
  connect() {
  }

  play() {
    const audio = this.audioTarget;
    const icon = this.iconTarget;
    if (audio.paused) {
      audio.play();
      icon.classList.replace('fa-circle-play', 'fa-circle-pause');
    } else {
      audio.pause();
      icon.classList.replace('fa-circle-pause', 'fa-circle-play');
    }
  }
}
