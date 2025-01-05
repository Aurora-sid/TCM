const data={
  username:'',
  Name:'',
  sex:'',
  age:'',
  personalInfo:'',
  Answer:'',
  Symptom:'',
  teacherMoney:'',
  bool:false
}
export function setUserName(username){
  data.username = username
}
export function getUserName(){
  return data.username;
}
export function setTeacherMoney(money){
  data.teacherMoney = money;
}
export function getTeacherMoney(){
  return data.teacherMoney;
}
export function setName(name){
  data.Name = name;
}
export function getName(){
  return data.Name;
}
export function setSex(sex){
  data.sex = sex;
}
export function getSex(){
  return data.sex;
}
export function setAge(age){
  data.age = age;
}
export function getAge(){
  return data.age;
}
export function setAnswer(answer){
  data.Answer = answer;
}
export function getAnswer(){
  return data.Answer;
}
export function setSymptom(symptom){
  data.Symptom = symptom;
}
export function getSymptom(){
  return data.Symptom;
}
export function setPersonalInfo(personalInfo){
  data.personalInfo = personalInfo;
}
export function getPersonalInfo(){
  return data.personalInfo;
}

