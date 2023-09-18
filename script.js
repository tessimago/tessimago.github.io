const openButton = document.getElementById('open-button');
const closeButton = document.getElementById('close-button');
const sidebar = document.getElementById('sidebar');

openButton.addEventListener('click', () => {
    sidebar.classList.add('sidebar-open');
    openButton.style.display = 'none'; // Ocultar o botão "Abrir Menu"
});

closeButton.addEventListener('click', () => {
    sidebar.classList.remove('sidebar-open');
    openButton.style.display = 'block'; // Mostrar o botão "Abrir Menu" ao fechar a aba
});
