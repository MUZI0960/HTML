/**
 * 
 */

proc1 = function(){
   vinput = prompt("입력하세요.");
   
   //div를 검색
   vdiv = document.getElementsByTagName('div')[0];
   
   vdiv.innerText = vinput;
   vdiv.innerHTML = vinput;
   
   //1번방식
   var str;
   str = "<h1>" + vinput + "</h1>";
   
   //2번방식
   var str = "<h1>" + vinput + "</h1>";
   
   //3번방식
   str = "<h1>" + vinput + "</h1>";
   vdiv.innerHTML = str;
   vdiv.innerText = str;
   
};
//function proc1(){
//   
//}
//proc1 = () => {
//   
//}