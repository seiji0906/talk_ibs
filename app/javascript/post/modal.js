$(function(){
  $("#scroll_to_top").click(function() {
    // ページの一番上まで、アニメーション付きでスクロールさせます。
    // アニメーションの時間は300ミリ秒で、一定の速度（linear）で動かします。
    $('body, html').animate({scrollTop: 0}, 500, 'linear');
  });

});
