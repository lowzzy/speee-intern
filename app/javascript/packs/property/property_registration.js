
window.addEventListener('DOMContentLoaded', function(){
    // // input要素を取得
    var select_state = document.getElementById("property_prefecture");
    
    // // イベント「input」を登録
    select_state.addEventListener("change",async function(){
        const res = await fetch("http://localhost:13000/api/v1/cities?prefecture_id=" + this.value);
        const cities = await res.json();
        removeOptions();
        appendOptions(cities.data);
    });
    function removeOptions(){
        var selectobject = document.getElementById("property_city");
        for (var i=0; i<selectobject.length; i++) {
            selectobject.remove(i);
        }
        selectobject.remove();
    }
    function appendOptions(array){
        var myParent = document.getElementById("city_select");

        // //Create and append select list
        var selectList = document.createElement("select");
        selectList.id = "property_city";
        selectList.name = "property[city]";
        myParent.appendChild(selectList);

        //Create and append the options
        for (var i = 0; i < array.length; i++) {
            var option = document.createElement("option");
            option.text = array[i][0];
            option.value = array[i][1];
            selectList.appendChild(option);
        }
    }
  });