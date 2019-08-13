var baseurl = "/typeahead?term=%QUERY"

var qst1 = { item: 'name' } //'name'はカラム名
var qst2 = { item: 'id' } //'name'はカラム名

var url1 = baseurl + "&" + jQuery.param(qst1)
// jQuery.param(params)はオブジェクトqst1をシリアライズ
// url1 =  "/typeahead?term=%QUERY&item=name"

var artistnames = new Bloodhound({

  datumTokenizer: function(d) {return Bloodhound.tokenizers.whitespace([d.name]); }, //d.nameのnameはカラム名
  queryTokenizer: Bloodhound.tokenizers.whitespace,

  remote: {
            url: url1 //上記で定義したurl1を指定
        }
});

// 上記で定義したusernamesの初期化
artistnames.initialize();

  jQuery( document ).ready(function( $ ) {
      $('#artist_name.typeahead').typeahead({ // #user_nameは後ほどViewファイルのフォーム部分に付与するid属性名
      hint: true,
      highlight: true,
      minLength: 1
    },
    {
      name: 'name',       // 'name'はカラム名
      displayKey: 'name', // 'name'はカラム名
      source: artistnames.ttAdapter()
　　}).on("typeahead:selected typeahead:autocomplete", function(e, datum) {
    return $('#artist_name.typeahead').val(datum.name); 
    // #user_nameは後ほどViewファイルのフォーム部分に付与するid属性名
    // datum.nameのnameはカラム名
  });
});
