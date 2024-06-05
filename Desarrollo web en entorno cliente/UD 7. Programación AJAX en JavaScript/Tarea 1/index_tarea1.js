document.addEventListener("DOMContentLoaded", function() {
    const episodeDetails = document.getElementById("episode-details");

    fetch('https://rickandmortyapi.com/api/episode/28')
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            const episodeTitle = data.name;
            const episodeNumber = data.episode;
            const airDate = data.air_date;
            const characters = data.characters;

            const episodeInfo = `
                <h2>${episodeTitle}</h2>
                <p>Episodio numero: ${episodeNumber}</p>
                <p>Fecha de emision: ${airDate}</p>
                <h3>Personajes</h3>
                <ul>
                    ${characters.map(character => `<li><a href="${character}">${character}</a></li>`).join('')}
                </ul>
            `;
            episodeDetails.innerHTML = episodeInfo;
        })
        .catch(error => {
            console.error('There was a problem with the fetch operation:', error);
            episodeDetails.innerHTML = '<p>Failed to fetch episode details. Please try again later.</p>';
        });
});
