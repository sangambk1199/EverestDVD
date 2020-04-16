window.addEventListener('load', () => {
    console.log('loaded');
    const searchBox = document.querySelector('.search_box');

    if (searchBox) {
        console.log('found');
        searchBox.addEventListener('keyup', () => {
            if (searchBox.value !== "") {
                console.log(searchBox.value);
            } else {
                console.log("Empty");
            }
            
        });
    }
});
