import { get } from "jquery";

if (location.pathname.match("orders/new")){
  document.addEventListener("DOMContentLoaded", () =>  {
    const inputElement = document.getElementById("order_ship_address_name");
    inputElement.addEventListener("keyup", () => {
      const keyword = document.getElementById("order_ship_address_name").value;
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `items_search/?keyword=${keyword}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        const searchResult = document.getElementById("search-result");
        searchResult.innerHTML = "";
        if (XHR.response) {
          const itemName = XHR.response.keyword;
          itemName.forEach((item) => {
            const childElement = document.createElement("div");
            childElement.setAttribute("class","child");
            childElement.setAttribute("id", item.id);
            childElement.innerHTML = item.name;
            searchResult.appendChild(childElement);
            const clickElement = document.getElementById(item.id);
            clickElement.addEventListener("click", () => {
              document.getElementById("order_ship_address_name").value = clickElement.textContent;
              clickElement.remove();
            });  
          });
        };
      };
    });
  });
};
