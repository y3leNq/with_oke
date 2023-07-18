import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="itunes-search"
export default class extends Controller {

  submit() {
    clearTimeout(this.timeout)

    this.timeout = setTimeout(() => {
      this.element.requestSubmit()
    }, 1000)
  }
}

    // const itunesSearch = async () => {
    //   const response = await fetch(`https://itunes.apple.com/search?term=${this.inputTarget.value}&media=music&country=jp&limit=3`);
    //   const json = await response.json();
    //   const songs = json.results.map(track => track.trackName);
    //   this.resultsTarget.innerHTML = '';
    //   for(let song of songs) {
    //     const songDiv = document.createElement('div');
    //     songDiv.innerText = song;
    //     this.resultsTarget.appendChild(songDiv);
    //   }
    // };
    

    // itunesSearch();
