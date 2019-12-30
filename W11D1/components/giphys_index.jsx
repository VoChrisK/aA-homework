import React from 'react';

import GiphysIndexItem from './giphys_index_item';

const GiphysIndex = ({ giphys }) => {
    return (
        <div className="gifs">
            {
                giphys.map((giphy, idx) => <GiphysIndexItem giphy={giphy} key={idx} />)
            }
        </div>
    );
};

export default GiphysIndex;