import prompt from '@ohos.prompt';
import router from '@ohos.router';
import{诊断,提交问卷}from'../../api/axios'
import {setName,setAge,setSex,setPersonalInfo,getPersonalInfo,getAnswer,getSymptom} from '../../utils/data'
@Entry
@Component
struct MainPage {
  @State message: string = 'Hello World';
  @State 姓名: string = '';
  @State 性別: string = '';
  @State 年齡: string = '';
  @State errorMessage: string = ''; // 用于存储错误信息

  build() {
    Row() {
      Column() {
        Row() {
          Text("智能中医体质识别")
            .fontSize(20)
            .margin({ left: 100 });
        }
        .width('100%')
        .height('9%')
        .backgroundColor(Color.Yellow)
        .padding(10);

        Row() {
          Text("姓名:")
            .fontSize(16)
            .margin({ left: 15 })
            .width('20%')
          TextInput({ placeholder: '请输入用户名' })
            .inputStyle()
            .maxLength(20)
              //  .width('70%')
            .onChange((data) => {
              this.姓名 = data;
              setName(data);
              console.info('user:' + data);
            });
        }
        .height('9%')
        .backgroundColor('#FFFFE0')
        .padding(3);

        // 性别选择行
        Row() {
          Text("性别:")
            .fontSize(16)
            .margin({ left: 15 })
            .width('20%');
          Row() {
            Radio({ value: '男', group: '性别' })
              .onChange((isChecked) => {
                if (isChecked) {
                  this.性別 = '男';
                  setSex(this.性別);
                  console.info('选择的性别是: 男');
                }
              })
              .width('18%')
              .padding('12vp')
              .margin('10vp');
            Text('男')
              .fontSize(14)
              .margin({ left: 10 });
            Radio({ value: '女', group: '性别' })
              .onChange((isChecked) => {
                if (isChecked) {
                  this.性別 = '女';
                  setSex(this.性別);
                  console.info('选择的性别是: 女');
                }
              })
              .width('18%')
              .padding('12vp')
              .margin('10vp');
            Text('女')
              .fontSize(14)
              .margin({ left: 10 });
          }
          .width('80%')
        }
        .height('9%')
        .backgroundColor('#FFFFE0')
        .padding(3);

        Row() {
          Text("年龄:")
            .fontSize(16)
            .margin({ left: 15 })
            .width('20%')
          TextInput({ placeholder: '请输入年龄' })
            // .type(InputType.Password) // 输入框类型
            .inputStyle()
            .onChange((data) => {
              this.年齡 = data;
              setAge(data);
              console.info('age:' + data);
              this.validateAge();
            });
          if (this.errorMessage) {
            Text(this.errorMessage)
              .fontColor(Color.Red);
          }
        }
        .height('9%')
        .backgroundColor('#FFFFE0')
        .padding(3);

        // 问卷和舌苔检测按钮
        Row() {
          Column() {
            Button() {
              Text('健康问卷')
                .fontSize(20)
                .margin({ left: 15 })
                .width('100%')
                .height('100%')
            }
            .width('80%')
            .height('50%')
            .backgroundColor('#FFFF99')
            .padding(3)
            .borderRadius(0)
            .onClick(() => {
              router.pushUrl({
                url: 'pages/Index',
                // params: {
                //   sex:this.性別,
                //   age:this.年齡,
                //   name:this.姓名
                // }
              }).catch((error: Error) => {
                // 错误提示
              })
            })
          }
          .width('40%')

          Column() {}
          .width('15%')

          Column() {
          Button() {
            Text('舌苔检测')
              .fontSize(20)
              .margin({ left: 15 })
              .width('100%')
          }
          .width('80%')
          .height('50%')
          .backgroundColor('#FFFF99')
          .padding(3)
          .onClick(() => {

            router.pushUrl({
              url: 'pages/TonguePage',
            }).catch((error: Error) => {
              // 错误提示
            })

          });
        }
          .width('40%')
        }
        .height('20%')
        .width('100%')
        .backgroundColor('#FFFFE0')
        .padding(3);

         Row() {
           Button() {
             Text('历史记录')
               .fontSize(20)
               .margin({ left: 90 })
               .width('100%')
           }
           .width('80%')
           .height('50%')
           .margin({
             left: 50,
           })
           .backgroundColor(Color.White)
           .padding(3)
           .onClick(() => {
             router.pushUrl({
               url: 'pages/HistoryPage'
             }).catch((error: Error) => {
               // 错误提示
             })
           })

         }
        .height('10%')
        .width('100%')
        .backgroundColor('#FFFF99')
        .padding(3);

        Row() {
          Row() {

        }
          .width('100%')
          .backgroundColor(Color.White)
        }
        .height('15%')
        .width('100%')
        .backgroundColor('#FFFFE0')
        .padding(3);

        Row() {
          Button() {
            Text('提交检测')
              .fontSize(20)
              .margin({ left: 90 })
              .width('100%')
          }
          .width('80%')
          .height('50%')
          .margin({
            left: 50,
          })
          .backgroundColor(Color.White)
          .padding(3)
          .onClick(async () => {
           // getAnswer();
            setPersonalInfo(this.姓名+' '+this.性別+' '+this.年齡);
            console.info(getPersonalInfo() +' '+ getAnswer()+' ' + getSymptom());
           let result =  await 诊断(this.姓名,this.性別,parseInt(this.年齡),getAnswer())
              router.pushUrl({
              url: 'pages/DiagnoisisPage',
              params:{
                data:result.data
              }
            }).catch((error: Error) => {
              // 错误提示
            })
          })

        }
        .height('10%')
        .width('100%')
        .backgroundColor('#FFFF99')
        .padding(3);


      }
      .width('100%')
      .backgroundColor('#FFFFE0')
      .height('100%');
    }
    .backgroundColor('#FFFFE0')
    .height('100%');
  }

  validateAge() {
    const num = parseFloat(this.年齡);
    if (isNaN(num)) {
      this.errorMessage = '请输入有效的数字';
    } else {
      this.errorMessage = '';
    }
  }
}

@Extend(TextInput) function inputStyle(){
  .placeholderColor(0x999999)
  .maxLength(6) // 最大长度
  .width('70%')
  .padding('12vp')
  .margin('10vp')
}