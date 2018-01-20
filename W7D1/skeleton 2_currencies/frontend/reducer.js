const initialState = {
  baseCurrency: "Please select",
  rates: {}
};

const reducer = (state = initialState, action) => {
  Object.freeze(state);
  switch(action.type) {
    case 'SWITCH_CURRENCY':
      const newCurrency = { 
    			baseCurrency: action.baseCurrency,
    			rates: action.rates
			 };
      return newCurrency;
    default:
      return state;
  }
};
window.reducer = reducer;

export default reducer;
