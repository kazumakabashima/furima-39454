window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = parseInt(priceInput.value, 10);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    const profit = document.getElementById("profit");
    profit.innerHTML = Math.floor(inputValue - (Math.floor(inputValue * 0.1)));
  });
});
