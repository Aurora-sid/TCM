import router from '@ohos.router';
import {getName,getAge,getSex,getAnswer,getSymptom} from '../../utils/data'
import{提交问卷}from'../../api/axios'
@Entry
@Component
struct CasePage {
  @State message: string = 'Hello World'
  @State data: {
    id: number,
    username: string,
    sex: string,
    age: number,
    answers: string,
    suggestion: string
  } =  router.getParams()['data'] as {
    id: number,
    username: string,
    sex: string,
    age: number,
    answers: string,
    suggestion: string
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
            .fontSize(18)
            .margin({
              left: 15,
              top : 10
            })
            .width('20%')
          Row() {
            Text(this.data.username)
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
            .fontSize(18)
            .margin({
              left: 15,
              top : 10
            })
            .width('20%')
          Row() {
            Text(this.data.sex)
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
            .fontSize(18)
            .margin({
              left: 15,
              top : 10
            })
            .width('20%')
          Row() {
            Text(this.data.age.toString())
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
          Text("体质:")
            .fontSize(18)
            .margin({
              left: 15,
              top : 10
            })
            .width('20%')
          Row() {
            // Text(getAge())
            Text(this.data.answers)
              .fontSize(20)
              .margin({
                left: 15,
                top : 10
              })
          }
          .width('70%')

        }
        .height('10%')
        .backgroundColor('#FFFFE0')
        .padding(3);

        Row() {
          Text("建议:")
            .fontSize(18)
            .margin({
              left: 15,
              top : 10
            })
            .width('20%')

          Scroll() {
            Text(this.data.suggestion)
              .fontSize(20)
              .margin({
                left: 1,
                top: 10
              })
          }.width('70%')
          .height('60%')
        }
        .height('30%')
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