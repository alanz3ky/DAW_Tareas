document.addEventListener("DOMContentLoaded", function() {
    const gridContainer = document.getElementById("grid-container");

    fetch('https://rickandmortyapi.com/api/character')
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            const characters = data.results;

            const characterGrid = characters.map(character => {
                return `
                    <div class="character">
                        <img src="${character.image}" alt="${character.name}">
                        <p>${character.name}</p>
                    </div>
                `;
            }).join('');

            gridContainer.innerHTML = characterGrid;
        })
        .catch(error => {
            console.error('There was a problem with the fetch operation:', error);
            gridContainer.innerHTML = '<p>Failed to fetch character details. Please try again later.</p>';
        });
});
