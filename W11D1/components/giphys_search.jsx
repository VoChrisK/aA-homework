import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            searchTerm: ""
        }
    }

    handleChange(event) {
        this.setState({ searchTerm: event.target.value });
    }

    handleSubmit(event) {
        event.preventDefault();
        this.props.fetchSearchGiphys(this.state.searchTerm);
        this.setState({ searchTerm: "" });
    }

    render() {
        return (
            <form className="giphys-search-form" onSubmit={ this.handleSubmit.bind(this) }>
                <input type="text" className="giphys-text" onChange={ this.handleChange.bind(this) } value={ this.state.searchTerm }/>
                <input type="submit" value="Search Giphy!"/>
                <GiphysIndex giphys={this.props.giphys} />
            </form>
        );
    }
}

export default GiphysSearch;