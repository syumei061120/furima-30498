function check(){
  function culTax(value){
    value = value * 0.1;
    return value;
  }
  function culProfit(value){
    value = value - culTax(value)
    return value;
  }

  const price = document.getElementById("item-price")
    value = price.value;

    var culAddTaxPriceForm = document.getElementById("add-tax-price");
    culAddTaxPriceForm.innerHTML = Math.floor(culTax(value));
    
    var profitForm = document.getElementById("profit");
    profitForm.innerHTML = Math.floor(culProfit(value));
}
setInterval(check, 1000);