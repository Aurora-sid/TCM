import router from '@system.router'
import {上传图片} from '../../api/axios'
import promptAction from '@ohos.promptAction';
@Entry
@Component
struct TonguePage {
  @State message: string = 'Hello World'
  @State 舌色分析: string = ''
  @State 苔色分析: string = ''
  @State 舌裂纹分析: string = ''
  @State 齿痕舌分析: string = ''
  @State 表现: string = ''
  // 创建构造器，与装饰器呼应相连。
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({
      // :{TongueColor:string,TongueIndent:string,TongueCoated:string,TongueCrack:string}

      // 确认按钮回调函数
      confirm: (val) => {
        this.舌色分析 = val.TongueColor
        this.齿痕舌分析 = val.TongueIndent
        this.苔色分析 = val.TongueCoated
        this.舌裂纹分析 = val.TongueCrack
        this.表现 = val.Suggestion
        // this.onAccept(val,val2)
      },
    })
  })
  build() {
    Row() {
      Column() {

        Row() {
          Image($r('app.media.left'))
            .width(25)
            .onClick(()=>{router.back()})
          Text("舌苔结果")
            .fontSize(20)
            .margin({ left: 100 });
        }
        .width('100%')
        .height('9%')
        .backgroundColor(Color.Yellow)
        .padding(10);

        Row(){
          Image($r("app.media.upload"))
            .height(100)

        }
        .width("60%")
        .height(150)
        .backgroundColor(Color.White)
        .justifyContent(FlexAlign.Center)
        .margin({top:10})
        .borderRadius(10)
        .onClick(()=>{
          // 打开自定义弹窗
          this.dialogController.open()
        })

        Row() {
          Text("舌色分析:")
            .fontSize(16)
            .margin({ left: 15 })
            .width('25%')
          TextInput({ placeholder: this.舌色分析 })
            .inputStyle()
            .maxLength(20)
              //  .width('70%')
            .onChange((data) => {
              this.舌色分析 = data;
              console.info('user:' + data);
            });
        }
        .height('10%')
        .backgroundColor('#FFFFE0')
        .padding(3);

        Row() {
          Text("苔色分析:")
            .fontSize(16)
            .margin({ left: 15 })
            .width('25%')
          TextInput({ placeholder: this.苔色分析 })
            .inputStyle()
            .maxLength(20)
              //  .width('70%')
            .onChange((data) => {
              this.舌色分析 = data;
              console.info('user:' + data);
            });
        }
        .height('10%')
        .backgroundColor('#FFFFE0')
        .padding(3);

        Row() {
          Text("舌裂纹分析:")
            .fontSize(16)
            .margin({ left: 15 })
            .width('25%')
          TextInput({ placeholder: this.舌裂纹分析 })
            .inputStyle()
            .maxLength(20)
              //  .width('70%')
            .onChange((data) => {
              this.舌裂纹分析 = data;
              console.info('user:' + data);
            });
        }
        .height('10%')
        .backgroundColor('#FFFFE0')
        .padding(3);

        Row() {
          Text("齿痕舌分析:")
            .fontSize(16)
            .margin({ left: 15 })
            .width('25%')
          TextInput({ placeholder: this.齿痕舌分析 })
            .inputStyle()
            .maxLength(20)
              //  .width('70%')
            .onChange((data) => {
              this.舌裂纹分析 = data;
              console.info('user:' + data);
            });
        }
        .height('10%')
        .backgroundColor('#FFFFE0')
        .padding(3);

        Column(){
          Text("症状")
          Text(this.表现)
        }
      }
      .width('100%')
      .backgroundColor('#FFFFE0')
      .height('100%');
    }
    .height('100%')
  }
}

@Extend(TextInput) function inputStyle(){
  .placeholderColor(0x999999)
  .maxLength(6) // 最大长度
  .width('70%')
  .height('80%')
  .padding('12vp')
  .margin('10vp')
}

// @CustomDialog装饰器用于装饰自定义弹框，此装饰器内进行自定义内容（也就是弹框内容）。
@CustomDialog
struct CustomDialogExample {
  controller: CustomDialogController
confirm: (val) => void
  answer: string = ''
  @State startTime: string = ''
  @State private item:Array<{label:string ,src:Resource,imagePath:string}> = [
    {label:'舌头1',src:$r('app.media.test'),imagePath:'E:\\hongmeng\\workspace\\TCM\\entry\\src\\main\\resources\\base\\media\\test.jpg'},
  {label:'舌头2',src:$r('app.media.T2'),imagePath:'E:/T2.png'},
{label:'舌头3',src:$r('app.media.T3'),imagePath:'E:/T3.png'}
  ]

  async aboutToAppear() {

  }
  build(){
    Row(){
      ForEach(this.item,(item:{label:string ,src:Resource,imagePath:string},index)=>{
        Column(){
          Image(item.src)
            .height(80)
            .width(80)
          Text(item.label)
        }.onClick(async ()=>{
          promptAction.showToast({
            message: '上传成功，等待检测',
            duration: 4000, // 弹窗持续时间
            bottom: '100vp'
          })
         let result = await 上传图片(item.imagePath)
          if(result.data){

            this.confirm(result.data)
            promptAction.showToast({
              message: '检测成功',
              duration: 4000, // 弹窗持续时间
              bottom: '100vp'
            })
            // 关闭弹窗
            this.controller.close()


          }
          console.log(JSON.stringify(result.data))
        })

      })
    }
    .width("100%")
    .height("50%")
    .justifyContent(FlexAlign.SpaceAround)
  }
}
