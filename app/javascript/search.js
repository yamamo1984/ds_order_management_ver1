import { get } from "jquery";
// 指定のページでスクリプトが動く記述
if (location.pathname.match("orders/new") || location.pathname.match("add_orders/new")){
  // 検索フォームに入力されたらキーワードをHTTPで飛ばして情報を拾う
  document.addEventListener("DOMContentLoaded", () =>  {
    const inputElement = document.getElementById("parent-div-");
    inputElement.addEventListener("keyup", () => {
      const keyword = document.getElementById("item-name").value;
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `items_search/?keyword=${keyword}`, true);
      XHR.responseType = "json";
      XHR.send();   

      // itemElementNumを定義しフォームの数をカウントして追加のフォームが何個目か識別する
      let itemElementNum = document.querySelectorAll(".parent-item").length +1;
      // すべてが読み込まれたタイミングで新たに検索結果をプルダウンで生成する
      XHR.onload = () => {
        const searchResult = document.getElementById("search-result-");
        searchResult.innerHTML = "";
        if (XHR.response) {
          const itemName = XHR.response.keyword;
          itemName.forEach((item) => {
            const childElement = document.createElement("div");
            childElement.setAttribute("class","dropdown-item");
            childElement.setAttribute("id", item.id);
            childElement.innerHTML = item.name;
            searchResult.appendChild(childElement);
            const clickElement = document.getElementById(item.id);

            // リストから選択したものをフォームのValueに入れる（hiddenタイプのitem-idの方に入力）
            clickElement.addEventListener("click", () => {
              
              document.getElementById("item-name").value = clickElement.textContent;
              document.getElementById("item-id").value = item.id;

              // 選択が終わったらそれをリストから取り除く
              
              clickElement.remove();
              searchResult.innerHTML = "";

              

              
              


              // 価格や番号などを取り出しHTMLを書き換えて表示させる
              const itemNum = document.getElementById("item-num-");
              const itemPrice = document.getElementById("item-price-");           
              
              let addItem = `
              <div class="parent-item" id="parent-item-${itemElementNum}">
                <div class="row" >
                  <div class="col-md-3" id = "item-num-${itemElementNum}">${item.code}</div>
                  <div class="col-md-3 ">${item.name}<input name="item_ids[]", type = "hidden", id= "item-name-${itemElementNum}", value = "${item.id}"> </div>
                  <div class="col-md-3" id = "item-price-${itemElementNum}">${item.price}</div>
                  <div class="col-md-2" ><input name="purchase_nums[]", type = "text", style="width: 100px;", required = "true", id = "purchase-num-${itemElementNum}" ></div>
                  <div class="col-md-1" ><input type = "button", class="delete_btn", id="delete-item-${itemElementNum}", value="削除"></div>
                </div> 
              </div> `;
              order_items.insertAdjacentHTML("afterend", addItem);

              // １個以上のアイテムが追加れたら、検索フォームのhiddenを無効にして送信対象にしない
              if (itemElementNum >= 1 && itemElementNum <=1 ) {  
                document.getElementById("item-id").disabled = true;
              }
              // ボタンクリックで削除
              // querySelectorで生成された親要素のクラスを指定してIDを取得
              const objId = document.querySelector(".parent-item").id;
              // querySelectorでボタンのクラスを取得して、それに対してイベントを付与する
              document.querySelector(".delete_btn").addEventListener("click", function () {
                // 取得した親要素のIDで該当の要素を取得
                const deleteObj = document.getElementById(objId);
                // 取得した要素をremove()で削除
                deleteObj.remove();
                
              });            
            });  
          });
        };
      };  
    });
  });
};


