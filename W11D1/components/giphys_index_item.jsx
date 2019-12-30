import React from 'react';

const GiphysIndexItem = ({ giphy }) => {
    return (
        <img src={giphy.images.fixed_height.url} className="gif" />
    );
};

export default GiphysIndexItem;