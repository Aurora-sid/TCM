// api.ts
import http from '../utils/request';

// import { Result } from '../utils/request';
interface LoginResponse {
  success?: boolean;
  message?: string;
  token?: string;
  code?:number;
}

// 新增
export const testApi = () => {
  return http.get("test/userList")
}

// 注册接口
export const register = (item:{username:"string",password:"string"}) => {
 return http.post('user/register', item)
}
// 调用demo
// let a =   await register({username:"zx2",password:"123"})
// console.log(JSON.stringify(a))

// 登录接口
export const getPassword = (username:string) => {
  return http.get('user/login',{username:username})
}
//调用demo
// let result =   await getPassword(this.user)
// console.log(result.data.password)


// 建议接口
export const getSuggest = (item:{
  subject: string,
  suggestion: string,
  theme: string,
  username: string
}) => {
  return http.post('suggestion/giveSuggestion', item)
}

// 获取老师列表
export const getTeacherList=()=>{
        return http.get('teacher/getTeacherList')
}

// 预约老师
export const setTeacherState=(name:string,startTime:string,endTime:string,state:string)=>{
  return http.post('teacher/setTeacherState',{name:name,starttime:startTime,endtime:endTime,state})
}

// 设置用户老师
export const setUserTeacher=(username:string,userTeacher:string)=>{
  return http.post('user/setUserTeacher',{username,userteacher:userTeacher})
}

// 根据用户名查询预约的老师老师
export const getUserTeacher=(username:string)=>{
  return http.get('user/getUserTeacher',{username})
}

// 根据用户名查取不同用户提的建议
export const getSuggestion=(username:string)=>{
  return http.get('suggestion/getSuggestion',{username})
}

export const registerCoupon=(item:{username:string,value:number,min:number})=>{
  return http.post('coupon/register',item)
}

export const getUserCoupon=(username:string)=>{
  return http.get('coupon/getUserCoupon',{username})
}

export const deleteUserCoupon=(id:number)=>{
  return http.get('coupon/deleteUserCoupon',{id})
}
export const registerUserCount = (item:{count:number,username:string})=>{
  return http.post('wallet/register',item)
}

export const getUserCount=(username:string)=>{
  return http.get('wallet/getUserCount',{username})
}

export const setUserCount=(item:{count:number,username:string})=>{
  return http.post('wallet/setUserCount',item)
}


// 发放优惠券
export const setDiscount=(min:number,value: number)=>{
  return http.post('coupon/register',{min,value})
}
// 获取优惠券
export const getCoupon=(username:string)=>{
  return http.get('coupon/getUserCoupon',{username})
}


export const 提交问卷=(username:string,sex:string,age:number,answers: string,suggestion:string)=>{
  return http.post('judge/writeQuestionnaire',{username,sex,age,answers,suggestion})
}

export const 上传图片=(image:string)=>{
  return http.get('judge/upload',{image})
}

export const 诊断=(username:string,sex:string,age:number,answers: string)=>{
  return http.post('judge/judge',{username,sex,age,answers})
}
export const 获取历史记录=(username:string)=>{
  return http.get('/judge/getQuestionnaireAnswers',{username})
}



