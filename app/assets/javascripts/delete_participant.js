//participant_deleteクラスを持ったリンクからのAjax通信完了を検知して実行開始
//渡されたオブジェクトからdelete_participantタグを持った値を取り出し、文字列を作る
//participant_(id)属性を持った要素をフェードアウトする.

(function() {
    $(function() {
        $(document).on('ajax:complete', '.participant_delete', function(event, ajax, status) {
            var response;
            response = $.parseJSON(ajax.responseText);
            $('#participant_'+response.delete_participant).fadeOut();
        });
    });
}).call(this);