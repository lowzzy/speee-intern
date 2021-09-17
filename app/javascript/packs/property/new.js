
window.addEventListener('turbolinks:load', function(){
    // // input要素を取得
    var select_state = document.getElementById("property_prefecture",);
    console.log(select_state)

    // // イベント「input」を登録
    select_state.addEventListener("change",async function(){
        if (this.value > 0 && this.value < 10){
            value_string = '0' + String(this.value)
        }else{
            value_string = String(this.value)
        }
        const res = await fetch("https://www.land.mlit.go.jp/webland/api/CitySearch?area=" + value_string);
        const cities = await res.json();
        removeOptions();
        console.log(cities)
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
        selectList.className = "form-select"
        myParent.appendChild(selectList);

        //Create and append the options
        for (var i = 0; i < array.length; i++) {
            var option = document.createElement("option");
            option.text = array[i]['name'];
            option.value = array[i]['id'];
            selectList.appendChild(option);
        }
    }
  });