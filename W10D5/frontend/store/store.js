import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';

const addLoggingToDispatch = store => next => action => {
  console.log(store.getState()); //old state
  console.log(action);
  next(action);
  console.log(store.getState()); //new state
};

function loggingNextMiddleware(store) {
  return function(next) {
    console.log(next);
    return function(action) {
      console.log(next);
      console.log(action);
      next(action);
    };
  };
};

const configureStore = (preloadedState = {}) => {
  const store = createStore(rootReducer, preloadedState, applyMiddleware(loggingNextMiddleware));
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
}

export default configureStore;
