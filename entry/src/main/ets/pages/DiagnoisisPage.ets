import router from '@ohos.router';
import {getName,getAge,getSex,getAnswer,getSymptom} from '../../utils/data'
import{提交问卷}from'../../api/axios'
@Entry
@Component
struct DiagnoisisPage {
  @State message: string = 'Hello World'
  @State data: { result:string,suggestion:string } =  router.getParams()['data'] as { result:string,suggestion:string }
  async aboutToAppear(){
    await 提交问卷(getName(),getSex(),parseInt(getAge()),this.data.result,this.data.suggestion)
  }
  build() {
    Row() {
      Column() {
        Row() {
          Image($r('app.media.left'))
            .width(25)
            .onClick(()=>{
              router.back()
            })
          Text("诊断报告")
            .fontSize(26)
            .margin({ left: 100 })
        }
        .width('100%')
        .height('10%')
        .backgroundColor(Color.Brown)
        .borderRadius(10)
        .justifyContent(FlexAlign.Start)
        .padding(10)

        Row() {
          Text("姓名:")
            .fontSize(16)
            .margin({
              left: 15,
              top : 10
            })
            .width('20%')
          Row() {
            Text(getName())
              .fontSize(20)
              .margin({
                left: 15,
                top : 10
              })
          }
          .width('70%')

        }
        .height('9%')
        .backgroundColor('#FFFFE0')
        .padding(3);

        Row() {
          Text("性别:")
            .fontSize(16)
            .margin({
              left: 15,
              top : 10
            })
            .width('20%')
          Row() {
            Text(getSex())
              .fontSize(20)
              .margin({
                left: 15,
                top : 10
              })
          }
          .width('70%')

        }
        .height('9%')
        .backgroundColor('#FFFFE0')
        .padding(3);

        Row() {
          Text("年龄:")
            .fontSize(16)
            .margin({
              left: 15,
              top : 10
            })
            .width('20%')
          Row() {
            Text(getAge())
              .fontSize(20)
              .margin({
                left: 15,
                top : 10
              })
          }
          .width('70%')

        }
        .height('9%')
        .backgroundColor('#FFFFE0')
        .padding(3);

        Row() {
          Text("健康状况:")
            .fontSize(16)
            .margin({
              left: 15,
              top : 10
            })
            .width('20%')
          Column() {
            Text(this.data.result)
            Text(this.data.suggestion)
              .fontSize(20)
              .margin({
                left: 15,
                top : 10
              })
          }


        }
        .height('20%')
        .backgroundColor('#FFFFE0')
        .padding(3);

        Row() {
          Text("舌头诊断:")
            .fontSize(16)
            .margin({
              left: 15,
              top : 10
            })
            .width('20%')
          Row() {
            Text(getSymptom())
              .fontSize(20)
              .margin({
                left: 15,
                top : 10
              })
          }
          .width('70%')

        }
        .height('20%')
        .backgroundColor('#FFFFE0')
        .padding(3);

      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}
@Extend(TextInput) function inputStyle(){
  .placeholderColor(0x999999)
  .maxLength(6) // 最大长度
  .width('70%')
  .padding('12vp')
  .margin('10vp')
}