window.addEventListener('load', function () {

  const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", function () {
  const inputValue = priceInput.value;


const addTaxPrice = document.getElementById("add-tax-price");
addTaxPrice.innerHTML = (Math.floor(inputValue * 0.1));


const profitNumber = document.getElementById("profit")
const value_result = inputValue * 0.1
    console.log(value_result)
profitNumber.innerHTML = (Math.floor(inputValue - value_result));
  console.log(profitNumber);
})

});
