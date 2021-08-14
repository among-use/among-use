console.log('カレンダーの読み込み')
//インストールしたファイルたちを呼び出します。
import { Calendar} from '@fullcalendar/core';
import interactionPlugin from '@fullcalendar/interaction';
import monthGridPlugin from '@fullcalendar/daygrid'
import googleCalendarApi from '@fullcalendar/google-calendar'

//<div id='calendar'></div>のidからオブジェクトを定義してカレンダーを作っていきます。
var calendarEl = document.getElementById('calendar');

//カレンダーの中身を設定(月表示とか、クリックアクション起こしたいとか、googleCalendar使うととか)
var calendar = new Calendar(calendarEl, {
    plugins: [ monthGridPlugin, interactionPlugin, googleCalendarApi ],


    //細かな表示設定
    locale: 'ja',
    timeZone: 'Asia/Tokyo',
    firstDay: 1,
    headerToolbar: {
      start: '',
      center: 'title',
      end: 'today prev,next'
    },
    expandRows: true,
    navLinks: true,
    stickyHeaderDates: true,
    buttonText: {
        today: '今日'
    },
    allDayText: '終日',
    height: "auto",

    events: '/events.json',

    dateClick: function(info){
        //日付をクリックしたときのイベント(詳しくは次回の記事へ)
    },
    eventClick: function(info){
        var event_id = info.event.id;
        console.log(event_id);
        $.ajax({
          // type: 'post',
          url: "/events/"+ event_id,
          data: {
            event_id: event_id
            },
          success: function(data) {
            console.log("イベントが登録されていません" + " ID:" + event_id);
          },
          error: function() {
            console.log("イベントが登録されていません" + " ID:" + event_id);
          }
        });
      // $('.event-max-crews').html('MAX CREWS : '+ info.event.extendedProps.crews);
      // $('.event-title').html('RULE : '+ info.event.title);
      // $('.event-message').html('MESSAGE : '+ info.event.extendedProps.message);
      // $('#overlay, .modal-window1').fadeIn();
        //参考書籍: https://qiita.com/imp555sti/items/ee9809768f6dc9439ab5
    },
    eventClassNames: function(arg){
        //表示されたイベントにclassをcss用に追加する(詳しくは次回の記事へ)
    },

});
//カレンダー表示
calendar.render();

//イベント作成のsubmitが押された0.1秒後に発火。カレンダーの再レンダリング
$(".clender-reload").on('click',function(){
  console.log('作成後再レンダリング1')
  setTimeout(function(){
    console.log('作成後再レンダリング2')
    calendar.refetchEvents();
  },500);

  // $("#calendar").fullCalendar('removeEvents');
  // $("#calendar").fullCalendar('refetchEvents');
});


// $(".clender-reload-edit").on('click',function(){
//   setTimeout(function(){
//     console.log('更新後再レンダリング')
//     calendar.refetchEvents();
//   },2000);
// });



