document.addEventListener('turbo:click', (event) => {
  const element = event.target
  if (element.classList.contains('nav-link')) {
    const tabs = document.querySelectorAll('.nav-link');
    tabs.forEach(tab => tab.classList.remove('active'));
    element.classList.add('active');
  }
});

document.addEventListener('turbo:load', () => {
  const tabs = document.querySelectorAll('.nav-link');
  tabs.forEach(tab => {
    const url = new URL(tab.href);
    if (url.pathname === location.pathname) {
      tab.classList.add('active');
    } else {
      tab.classList.remove('active');
    }
  });
});
