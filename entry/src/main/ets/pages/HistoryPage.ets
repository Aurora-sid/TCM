import router from '@ohos.router';
import {获取历史记录} from '../../api/axios'
import {getName,getAge,getSex,getAnswer,getSymptom} from '../../utils/data'
@Entry
@Component
struct HistoryPage {
  @State message: string = 'Hello World'
  @State data: Array <{id:number,username:string,sex:string,age:number,answers:string,suggestion:string}> = [
    {
      id: 10,
      username: "zhangsan",
      sex: "男",
      age: 25,
      answers: "基本是平和体质，倾向是阴虚体质",
      suggestion: "日常养生应采取中庸之道，吃得不要过饱，也不能过饥，不吃冷也不吃得过热。多吃五谷杂粮、蔬菜、瓜果、少食过于油腻及辛辣之物，运动上，年轻人可选择一些强度大的运动，比如跑步、打球，老年人则适当散步、打太极拳。多吃甘凉滋润的食物，比如瘦猪肉、鸭肉、绿豆、冬瓜等。少食羊肉、狗肉、韭菜、辣椒等性温燥烈的食物。避免熬夜、剧烈运动和在高温酷暑下工作。只适合做中小强度、间断性的身体锻炼，可选择太极拳、太极剑等。锻炼时要控制出汗量，平时宜克制情绪，遇事要冷静，正确对待顺境和逆境。可以用练书法、下棋来怡情悦性，平时多听一些曲调舒缓、轻柔、抒情的音乐，防止恼怒。"
    },
    {
      id: 10,
      username: "zhangsan",
      sex: "男",
      age: 25,
      answers: "基本是平和体质，倾向是阴虚体质",
      suggestion: "日常养生应采取中庸之道，吃得不要过饱，也不能过饥，不吃冷也不吃得过热。多吃五谷杂粮、蔬菜、瓜果、少食过于油腻及辛辣之物，运动上，年轻人可选择一些强度大的运动，比如跑步、打球，老年人则适当散步、打太极拳。多吃甘凉滋润的食物，比如瘦猪肉、鸭肉、绿豆、冬瓜等。少食羊肉、狗肉、韭菜、辣椒等性温燥烈的食物。避免熬夜、剧烈运动和在高温酷暑下工作。只适合做中小强度、间断性的身体锻炼，可选择太极拳、太极剑等。锻炼时要控制出汗量，平时宜克制情绪，遇事要冷静，正确对待顺境和逆境。可以用练书法、下棋来怡情悦性，平时多听一些曲调舒缓、轻柔、抒情的音乐，防止恼怒。"

    }
  ]
  async aboutToAppear(){
    let result = await 获取历史记录(getName())
    // @ts-ignore
    this.data = result.data
    console.log(JSON.stringify(this.data))
  }
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

        Row(){
          Scroll(){
            Column() {
              ForEach(this.data, (item: {
                id: number,
                username: string,
                sex: string,
                age: number,
                answers: string,
                suggestion: string
              }, index) => {
                Row(){
                  Row() {
                    Column(){
                    Text('诊断记录'+ ' '+item.id)
                      .fontSize(18)
                      .margin({
                        left: 15,
                        top: 3,
                        bottom: 5
                      })
                      .width('40%')
                      .height('20%')

                      Row(){
                        Row(){
                          Text('姓名：')
                            .fontSize(20)
                          Text(item.username)
                            .fontSize(20)
                          Text('  性别：')
                            .fontSize(20)
                          Text(item.sex)
                            .fontSize(20)
                        }
                      }
                      .height('20%')
                      Button("详细信息")
                        .width('80%')
                        .fontWeight(15)
                        .onClick(() => {
                          router.pushUrl({
                            url: 'pages/CasePage',
                            params:{
                              data:item
                            }
                          }).catch((error: Error) => {
                            // 错误提示
                          })
                        })
                        .fontColor(Color.Gray)
                        .height('30%')
                         .margin({
                         top:10
                      })
                       .backgroundColor('#FFFF99')
                        .padding(3)
                        .margin({
                          top:15
                        })
                       .borderRadius(0)

                  }
                    .width('100%')
                    .height('100%')
                  }
                }
                .borderColor(Color.Gray)
                .borderRadius(10)
                .borderWidth(5)
                .margin({
                  top:'15vp'
                })
                .width('90%')
                .height('20%')

              })
            }
            .width('100%')
          //  .height('100%')
          }

        }
        .backgroundColor(Color.White)

      }
      .width('100%')
      .backgroundColor(Color.White)
      .height('100%');
    }
    .height('100%')
  }
}