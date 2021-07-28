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
      eventClick: function(calEvent, jsEvent, view){
          //表示されたイベントをクリックしたときのイベント(詳しくは次回の記事へ)
        console.log(calEvent.id);
        $('#overlay, .modal-window2').fadeIn();
      },
      eventClassNames: function(arg){
          //表示されたイベントにclassをcss用に追加する(詳しくは次回の記事へ)
      },

  });
  //カレンダー表示
  calendar.render();

  //イベント作成のsubmitが押された0.1秒後に発火。カレンダーの再レンダリング
  $(".clender-reload").on('click',function(){
    setTimeout(function(){
        calendar.refetchEvents();
    },100);
  });


