import router from '@system.router'
@Entry
@Component
struct TonguePage {
  @State message: string = 'Hello World'
  @State 舌色分析: string = ''
  @State 苔色分析: string = ''
  @State 舌裂纹分析: string = ''
  @State 齿痕舌分析: string = ''

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

        Row() {
          Text("舌色分析:")
            .fontSize(16)
            .margin({ left: 15 })
            .width('25%')
          TextInput({ placeholder: '' })
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
          TextInput({ placeholder: '' })
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
          TextInput({ placeholder: '' })
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
          TextInput({ placeholder: '' })
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