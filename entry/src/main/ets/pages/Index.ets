//import router from '@system.router'
import promptAction from '@ohos.promptAction';
// import {提交问卷,上传图片} from '../../api/axios'
import fs from '@ohos.file.fs';
import util from '@ohos.util';
import image from '@ohos.multimedia.image';
import router from '@ohos.router';
import {setAnswer} from '../../utils/data'
@Entry
@Component
struct Index {
   // @State name:string =  router.getParams()['name'] as string
   // @State sex:string = router.getParams()['sex'] as string
   // @State age:number = router.getParams()['age'] as number
  @State message: string = 'Hello World'
  @State isSelect: boolean = false
  @State private option:Array<{label:string,answer:string}> =[
    { label:"没有", answer:"A" },
    { label:"很少", answer:"B" },
    { label:"有时", answer:"C" },
    { label:"经常", answer:"D" },
    { label:"总是", answer:"E" }
  ]
  @State private item:Array<{question:string,answer:string}> =[
    {question: "您容易失眠吗?", answer: "C"},
    {question: "您容易忘事(健忘)吗?", answer: "D"},
    {question: "您容易疲乏吗?", answer: "C"},
    {question: "您感到闷闷不乐、情绪低沉吗?", answer: "B"},
    {question: "您比一般人耐受不了寒冷(冬天的寒冷，夏天的冷空调、电扇等)吗?", answer: "B"},
    {question: "您精力充沛吗?", answer: "E"},
    {question: "您能适应外界自然和社会环境的变化吗?", answer: "E"},
    {question: "您说话声音低弱无力吗?", answer: "A"},
    {question: "您喜欢安静、懒得说话吗?", answer: "D"},
    {question: "您容易头晕或站起时晕眩吗?", answer: "B"},
    {question: "您容易心慌吗?", answer: "B"},
    {question: "您容易气短(呼吸短促，接不上气)吗?", answer: "B"},
    {question: "您比别人容易感冒吗?", answer: "A"},
    {question: "您活动量稍大就容易出虚汗吗?", answer: "A"},
    {question: "您受凉或吃(喝)凉的东西后，容易腹泻(拉肚子)吗?", answer: "D"},
    {question: "您吃(喝)凉的东西会感到不舒服或怕吃(喝)凉的东西吗?", answer: "B"},
    {question: "您感到怕冷、衣服比别人穿得多吗?", answer: "B"},
    {question: "您手脚发凉吗?", answer: "B"},
    {question: "您胃脘部、背部或腰膝部怕冷吗?", answer: "A"},
    {question: "您口唇的颜色比一般人红吗?", answer: "B"},
    {question: "您容易便秘或大便干燥吗?", answer: "C"},
    {question: "您感到口干咽燥、总想喝水吗?", answer: "C"},
    {question: "您感到手脚心发热吗?", answer: "B"},
    {question: "您感到眼睛干涩吗?", answer: "B"},
    {question: "您感觉身体、脸上发热吗?", answer: "B"},
    {question: "您皮肤或口唇干吗?", answer: "C"},
    {question: "您面部两颧潮红或偏红吗?", answer: "A"},
    {question: "您上眼睑比别人肿(上眼睑有轻微隆起的现象)吗?", answer: "A"},
    {question: "您嘴里有黏黏的感觉吗?", answer: "A"},
    {question: "您平时痰多，特别是喉部总感到有痰堵着吗?", answer: "D"},
    {question: "您感到胸闷或腹部胀满吗?", answer: "C"},
    {question: "您感到身体沉重不轻松或不爽快吗?", answer: "A"},
    {question: "您有额部油脂分泌多的现象吗?", answer: "D"},
    {question: "您腹部满松软吗?", answer: "A"},
    {question: "您舌苔厚腻或有舌苔厚厚的感觉吗?", answer: "A"},
    {question: "您大便黏滞不爽、有解不尽的感觉吗?", answer: "C"},
    {question: "您容易生痤疮或疮疖吗?", answer: "A"},
    {question: "您小便时尿道有发热感、尿色浓(深度)吗?", answer: "A"},
    {question: "您感到口苦或嘴有异味吗?", answer: "A"},
    {question: "您的阴囊部位潮湿吗?(限男性回答)", answer: "A"},
    {question: "您面部或鼻部有油腻感或者油亮发光吗?", answer: "C"},
    {question: "您的两颧部有细微血丝吗?", answer: "C"},
    {question: "您口唇颜色偏黯吗?", answer: "C"},
    {question: "您容易有黑眼圈吗?", answer: "A"},
    {question: "您的皮肤在不知不觉中会出现青紫瘀斑(皮下出血)吗?", answer: "A"},
    {question: "您身体上有哪里疼痛吗?", answer: "A"},
    {question: "您面色晦黯或容易出现褐斑吗?", answer: "A"},
    {question: "您咽喉部有异物感，且吐之不出、咽之不下吗?", answer: "C"},
    {question: "您多愁善感、感情脆弱吗?", answer: "C"},
    {question: "您容易感到害怕或受到惊吓吗?", answer: "B"},
    {question: "您容易精神紧张、焦虑不安吗?", answer: "C"},
    {question: "您胁肋部或乳房胀痛吗?", answer: "A"},
    {question: "您无缘无故叹气吗?", answer: "C"},
    {question: "您容易过敏(对药物、食物、气味、花粉或季节交替时、气候变化等)吗?", answer: "A"},
    {question: "您有因季节变化、温度变化或异味等原因而咳喘的现象吗?", answer: "A"},
    {question: "您没有感冒也会打喷嚏吗?", answer: "C"},
    {question: "您没有感冒也会鼻塞、流鼻涕吗?", answer: "D"},
    {question: "您的皮肤一抓就红，并出现抓痕吗?", answer: "C"},
    {question: "您的皮肤因过敏出现过紫癜(紫红色瘀点、瘀斑)吗?", answer: "A"},
    {question: "您的皮肤容易起荨麻疹(风团、风疹块、风疙瘩)吗?", answer: "C"}
  ]


  build() {
    Column() {
      Row() {
         Image($r('app.media.left'))
           .width(25)
           .onClick(()=>{
             router.back()
           })

        Text("调查问卷")
          .fontSize(20)
          .margin({ left: 110 })
      }
      .width('100%')
      .height('10%')
      .backgroundColor(Color.Pink)
      .borderRadius(10)
      .justifyContent(FlexAlign.Start)
      .padding(10)

      Scroll() {
        Column() {
          ForEach(this.item, (item: {
            question: string,
            answer: string
          }, index: Number) => {
            Column() {
              Row() {
                Text((index.valueOf() + 1).toString() + "、" + item.question)
                  .fontSize(18)
                  .fontColor(Color.Red)
              }
              .justifyContent(FlexAlign.Start)
              .width("100%")

              Row() {
                ForEach(this.option,(item2:{label:string,answer:string},index2:Number)=>{

                  Row(){
                    Radio({ value: item2.answer, group: item.question })
                      .checked((item.answer !== '')&&((item.answer.codePointAt(0) - 'A'.codePointAt(0))==index2.valueOf())?true:false)
                      .onChange((isChecked: boolean) => {
                        if(isChecked) {
                          //需要执行的操作
                          this.item[index.valueOf()].answer = item2.answer
                          console.log(this.item[index.valueOf()].answer)
                        }
                      })
                    Text(item2.label)
                      .fontColor(Color.Blue)
                  }

                })

              }
              // .backgroundColor(Color.Green)
            }
            .backgroundColor(Color.White)
            .padding(5)
            .margin(5)
            .height('10%')
            .width('90%')
          })
          Button("提交")
            .onClick(()=>{
              let answersString = this.item.map(item => item.answer).join('');
              setAnswer(answersString)
              console.info(answersString)

              router.back()

            })
            .margin({top:20,bottom:100})


        }
        .width('100%')
      }
    }
    .width('100%')
    .backgroundColor("#f1f3f4")
  }
}