import router from '@ohos.router';
@Entry
@Component
struct HistoryPage {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Row() {
          Image($r('app.media.left'))
            .width(25)
            .onClick(()=>{router.back()})
          Text("历史记录")
            .fontSize(20)
            .margin({ left: 100 });
        }
        .width('100%')
        .height('9%')
        .backgroundColor(Color.Gray)
        .padding(10);
      }
      .width('100%')
      .backgroundColor(Color.White)
      .height('100%');
    }
    .height('100%')
  }
}