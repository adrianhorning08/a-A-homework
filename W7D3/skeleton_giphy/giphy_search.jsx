import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import {fetchSearchGiphys}  from './util/api_util';
import {receiveSearchGiphys} from './actions/giphy_actions';

window.fetchSearchGiphys = fetchSearchGiphys;
window.receiveSearchGiphys = receiveSearchGiphys;
window.store = configureStore();

document.addEventListener('DOMContentLoader', () => {
    const store = configureStore();
    const root = document.getElementById('id');
    ReactDOM.render(<Root/>, root);
});
