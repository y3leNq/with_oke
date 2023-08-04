document.addEventListener('turbo:load', () => {
  document.body.addEventListener('click', function(event) {
    const playIcon = event.target.closest('.play-icon');
    if (!playIcon) return;

    const audioId = 'audio-' + playIcon.dataset.id;
    const audioPlayer = document.getElementById(audioId);

    if (audioPlayer.paused) {
      audioPlayer.play();
      playIcon.classList.remove('fa-circle-play');
      playIcon.classList.add('fa-circle-pause');
    } else {
      audioPlayer.pause();
      playIcon.classList.remove('fa-circle-pause');
      playIcon.classList.add('fa-circle-play');
    }
  });
});
