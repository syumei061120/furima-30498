if (document.URL.match( /new/ ) || document.URL.match( /edit/ )){
  function check(){
    const price = document.getElementById("item-price")

    price.addEventListener('input', function() {
      function culTax(value){
        value = value * 0.1;
        return value;
      }
      function culProfit(value){
        value = value - Math.floor(culTax(value))
        return value;
      }
      value = price.value;

      let culAddTaxPriceForm = document.getElementById("add-tax-price");
      culAddTaxPriceForm.innerHTML = Math.floor(culTax(value));

      let profitForm = document.getElementById("profit");
      profitForm.innerHTML = Math.floor(culProfit(value));
    })
  }
  window.addEventListener('load', check)
}