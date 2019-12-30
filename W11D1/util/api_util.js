export const fetchSearchGiphys = searchTerm => {
    return $.ajax({
        method: "GET",
        url: `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=${"1GEoLgdOqklHpayczQuNE8toXqU1FBmJ"}&limit=2`
    });
};