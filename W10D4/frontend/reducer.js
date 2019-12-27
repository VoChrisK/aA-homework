const initialState = {
  city: "Please Select", 
  jobs: []
};

const reducer = (state = initialState, action) => {
  Object.freeze(state);
  switch(action.type) {
    case "SWTICH_LOCATION":
      let nextState = Object.assign({}, state);
      nextState["city"] = action.city;
      nextState["jobs"] = action.jobs;
      return nextState;
    default:
      return state;
  }
};

export default reducer;
