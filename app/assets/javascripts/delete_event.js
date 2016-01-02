//event_deleteクラスを持ったリンクからのAjax通信完了を検知して実行開始
//渡されたオブジェクトからdelete_eventタグを持った値を取り出し、文字列を作る
//event_(id)属性を持った要素をフェードアウトする.

(function() {
    $(function() {
        $(document).on('ajax:complete', '.event_delete', function(event, ajax, status) {
            var response;
            response = $.parseJSON(ajax.responseText);
            $('#event_'+response.delete_event).fadeOut();
        });
    });
}).call(this);