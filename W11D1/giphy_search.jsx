import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import configureStore from './store/store';
// import { fetchSearchGiphys, receiveSearchGiphys } from './actions/giphy_actions';


document.addEventListener('DOMContentLoaded', () => {
    // window.store = store;
    // window.fetchSearchGiphys = fetchSearchGiphys;
    // window.receiveSearchGiphys = receiveSearchGiphys;
    
    const store = configureStore();
    const root = document.getElementById("root");
    ReactDOM.render(<Root store={ store } /> , root);
});
