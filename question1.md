---
output: 
  html_document:
    mathjax: local
    self_contained: false
---
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
table {
  width: 30%;
  height: 50px;
}

table, td, th {
  border: 1px solid black;
  text-align: center;
}


.w3-teal,.w3-hover-teal:hover{color:#fff!important;background-color:#007688!important}

.w3-teal{
  padding:  10px;
}  

.header{
  background: #1abc9c;
}

label{
  width: 250px;
  display: inline-block;
}

.button{text-align: center;}

.buttonbg {
  background-color: white;
  color: blue;
  border: 2px solid blue;
}

.buttonbg:hover {
  background-color: blue;
  color: white;
}

.button1{
  padding: 0; 
  border: none; 
  background: none; 
  color: blue;
}

.button1:hover {
  color: black;
}

br {
  display: block; /* makes it have a width */
  content: ""; /* clears default height */
  margin-top: 8px; /* change this to whatever height you want it */
}

.w3-button{border:none;display:inline-block;padding:8px 16px;vertical-align:middle;overflow:hidden;text-decoration:none;text-align:center;cursor:pointer;white-space:nowrap}

.w3-modal{
  z-index:3;
  display:none;
  padding-top:100px;
  padding-right: 200px;
  padding-left: 200px;
  position:fixed;
  left:0;
  top:0;
  width:100%;
  height:100%;
  overflow:auto;
  background-color:rgb(0,0,0);
  background-color:rgba(0,0,0,0.4)
}

.w3-modal-content{
margin:auto;
background-color:#fff;
position:relative;
padding:1px;
outline:0;
width:90%}

.w3-bar{width:100%;overflow:hidden}.w3-center .w3-bar{display:inline-block;width:auto}
.w3-bar .w3-bar-item{padding:8px 16px;float:left;width:auto;border:none;display:block;outline:0}
.w3-bar .w3-dropdown-hover,.w3-bar .w3-dropdown-click{position:static;float:left}
.w3-bar .w3-button{white-space:normal}
.w3-bar-block .w3-bar-item{width:100%;display:block;padding:8px 16px;text-align:left;border:none;white-space:normal;float:none;outline:0}
.w3-bar-block.w3-center .w3-bar-item{text-align:center}.w3-block{display:block;width:100%}
.w3-responsive{display:block;overflow-x:auto}
.w3-container:after,.w3-container:before,.w3-panel:after,.w3-panel:before,.w3-row:after,.w3-row:before,.w3-row-padding:after,.w3-row-padding:before,
.w3-cell-row:before,.w3-cell-row:after,.w3-clear:after,.w3-clear:before,.w3-bar:before,.w3-bar:after{content:"";display:table;clear:both}
.w3-col,.w3-half,.w3-third,.w3-twothird,.w3-threequarter,.w3-quarter{float:left;width:100%}
.w3-col.s1{width:8.33333%}.w3-col.s2{width:16.66666%}.w3-col.s3{width:24.99999%}.w3-col.s4{width:33.33333%}
.w3-col.s5{width:41.66666%}.w3-col.s6{width:49.99999%}.w3-col.s7{width:58.33333%}.w3-col.s8{width:66.66666%}
.w3-col.s9{width:74.99999%}.w3-col.s10{width:83.33333%}.w3-col.s11{width:91.66666%}.w3-col.s12{width:99.99999%}

.boxed {
  border: 2px solid green ;
  background-color: white;
}

</style>



<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>



<script>


function showSampleMean(){

  document.getElementById('sampleMean').style.display='inline'
  document.getElementById('sampleMeanButton').style.display='none'

}





function showSampleSD(){

  document.getElementById('sampleSD').style.display='inline'
  document.getElementById('sampleSDButton').style.display='none'

}


function showSampleMean2(){

  document.getElementById('sampleMean2').style.display='inline'
  document.getElementById('sampleMeanButton2').style.display='none'

}





function showSampleSD2(){

  document.getElementById('sampleSD2').style.display='inline'
  document.getElementById('sampleSDButton2').style.display='none'

}





function checkTest(){
var inputTest = document.getElementById("inputTest");
var outputTest = document.getElementById("outputTest");

inputTest.readOnly = true;

var TextTval = document.getElementById("WText");
var TextTvalChecked = document.getElementById("WTextChecked");

TextTval.style.display='none';
TextTvalChecked.style.display='inline';

document.getElementById('Wpp').style.display='none';

if(0 >= 0){

if(inputTest.value >= 0.95*0 && inputTest.value <= 1.05*0){
  inputTest.style.backgroundColor='LimeGreen';
  inputTest.style.color='white';
}else if(inputTest.value >= 0.9*0 && inputTest.value < 0.95*0){ 
  inputTest.style.backgroundColor='orange';
  inputTest.style.color='white';
}else if(inputTest.value > 1.05*0 && inputTest.value <= 1.1*0){ 
  inputTest.style.backgroundColor='orange';
  inputTest.style.color='white';
}else{
  inputTest.style.backgroundColor='#ff8080';
  inputTest.style.color='white';
  outputTest.style.display='inline';
  inputTest.style.width='272px';
  outputTest.style.width='271px';
}

}else{

if(inputTest.value <= 0.95*0 && inputTest.value >= 1.05*0){
  inputTest.style.backgroundColor='LimeGreen';
  inputTest.style.color='white';
}else if(inputTest.value <= 0.9*0 && inputTest.value > 0.95*0){ 
  inputTest.style.backgroundColor='orange';
  inputTest.style.color='white';
}else if(inputTest.value < 1.05*0 && inputTest.value >= 1.1*0){ 
  inputTest.style.backgroundColor='orange';
  inputTest.style.color='white';
}else{
  inputTest.style.backgroundColor='#ff8080';
  inputTest.style.color='white';
  outputTest.style.display='inline';
  inputTest.style.width='272px';
  outputTest.style.width='271px';
}

}
  
}



function checkPvalNum(){

var inputPvalNum = document.getElementById("inputPvalNum");
var outputPvalNum = document.getElementById("outputPvalNum");

inputPvalNum.readOnly = true;

var TextPval = document.getElementById("PvalText");
var TextPvalNumChecked = document.getElementById("TextPvalNumChecked");

TextPval.style.display='none';
TextPvalNumChecked.style.display='inline';

closeModals()

if(inputPvalNum.value >= 0.95*0.005 && inputPvalNum.value <= 1.05*0.005){
  inputPvalNum.style.backgroundColor='LimeGreen';
  inputPvalNum.style.color='white';
}else if(inputPvalNum.value >= 0.9*0.005 && inputPvalNum.value < 0.95*0.005){ 
  inputPvalNum.style.backgroundColor='orange';
  inputPvalNum.style.color='white';
}else if(inputPvalNum.value > 1.05*0.005 && inputPvalNum.value <= 1.1*0.005){ 
  inputPvalNum.style.backgroundColor='orange';
  inputPvalNum.style.color='white';
}else{
  inputPvalNum.style.backgroundColor='#ff8080';
  inputPvalNum.style.color='white';
  outputPvalNum.style.display='inline';
  inputPvalNum.style.width='272px';
  outputPvalNum.style.width='271px';
}

}


function checkPvalpp(){

closeModals()

PvalSoft()

var inputPvalNum = document.getElementById("inputPvalNum");
var outputPvalNum = document.getElementById("outputPvalNum");

inputPvalNum.readOnly = true;

var TextPval = document.getElementById("PvalText");
var TextPvalNumChecked = document.getElementById("TextPvalNumChecked");
TextPval.style.display='none';
TextPvalNumChecked.style.display='inline';


if(inputPvalNum.value >= 0.95*0.005 && inputPvalNum.value <= 1.05*0.005){
  inputPvalNum.style.backgroundColor='LimeGreen';
  inputPvalNum.style.color='white';
}else if(inputPvalNum.value >= 0.9*0.005 && inputPvalNum.value < 0.95*0.005){ 
  inputPvalNum.style.backgroundColor='orange';
  inputPvalNum.style.color='white';
}else if(inputPvalNum.value > 1.05*0.005 && inputPvalNum.value <= 1.1*0.005){ 
  inputPvalNum.style.backgroundColor='orange';
  inputPvalNum.style.color='white';
}else{
  inputPvalNum.style.backgroundColor='#ff8080';
  inputPvalNum.style.color='white';
  outputPvalNum.style.display='inline';
  inputPvalNum.style.width='272px';
  outputPvalNum.style.width='271px';
}

}

function checkPval(){

var butPval1 = document.getElementById("pval1");
var butPval2 = document.getElementById("pval2");
var butPval3 = document.getElementById("pval3");
var butPval4 = document.getElementById("pval4");

var labelPval1 = document.getElementById("labelpval1");
var labelPval2 = document.getElementById("labelpval2");
var labelPval3 = document.getElementById("labelpval3");
var labelPval4 = document.getElementById("labelpval4");


document.getElementById('pvalue').style.display='none';


if(butPval1.checked == true){
  if(butPval1.value == "3"){
    labelPval1.style.background='green';
    butPval2.disabled=true;
    butPval3.disabled=true;
    butPval4.disabled=true;
    TextPvalFunc1()
  }else{
    butPval1.checked=false;
    butPval1.disabled=true;
    labelPval1.style.background='#ff8080';
    if(butPval2.value == "3"){
      butPval2.checked=true;
      butPval3.disabled=true;
      butPval4.disabled=true;
      TextPvalFunc2()
    }else if(butPval3.value == "3"){
      butPval3.checked=true;
      butPval2.disabled=true;
      butPval4.disabled=true;
      TextPvalFunc3()
    }else if(butPval4.value == "3"){
      butPval4.checked=true;
      butPval2.disabled=true;
      butPval3.disabled=true;
      TextPvalFunc4()
    }
  }
}else if(butPval2.checked == true){
  if(butPval2.value == "3"){
    labelPval2.style.background='green';
    butPval1.disabled=true;
    butPval3.disabled=true;
    butPval4.disabled=true;
    TextPvalFunc2()
  }else{
    butPval2.checked=false;
    butPval2.disabled=true;
    labelPval2.style.background='#ff8080';
    if(butPval1.value == "3"){
      butPval1.checked=true;
      butPval3.disabled=true;
      butPval4.disabled=true;
      TextPvalFunc1()
    }else if(butPval3.value == "3"){
      butPval3.checked=true;
      butPval1.disabled=true;
      butPval4.disabled=true;
      TextPvalFunc3()
    }else if(butPval4.value == "3"){
      butPval4.checked=true;
      butPval1.disabled=true;
      butPval3.disabled=true;
      TextPvalFunc4()
    }
  }

}else if(butPval3.checked == true){
  if(butPval3.value == "3"){
    labelPval3.style.background='green';
    butPval1.disabled=true;
    butPval2.disabled=true;
    butPval4.disabled=true;
    TextPvalFunc3()
  }else{
    butPval3.checked=false;
    butPval3.disabled=true;
    labelPval3.style.background='#ff8080';
    if(butPval1.value == "3"){
      butPval1.checked=true;
      butPval2.disabled=true;
      butPval4.disabled=true;
      TextPvalFunc1()
    }else if(butPval2.value == "3"){
      butPval2.checked=true;
      butPval1.disabled=true;
      butPval4.disabled=true;
      TextPvalFunc2()
    }else if(butPval4.value == "3"){
      butPval4.checked=true;
      butPval1.disabled=true;
      butPval2.disabled=true;
      TextPvalFunc4()
    }
  }

}else if(butPval4.checked == true){
  if(butPval4.value == "3"){
    labelPval4.style.background='green';
    butPval1.disabled=true;
    butPval2.disabled=true;
    butPval3.disabled=true;
    TextPvalFunc4()
  }else{
    butPval4.checked=false;
    butPval4.disabled=true;
    labelPval4.style.background='#ff8080';
    if(butPval1.value == "3"){
      butPval1.checked=true;
      butPval2.disabled=true;
      butPval3.disabled=true;
      TextPvalFunc1()
    }else if(butPval2.value == "3"){
      butPval2.checked=true;
      butPval1.disabled=true;
      butPval3.disabled=true;
      TextPvalFunc2()
    }else if(butPval3.value == "3"){
      butPval3.checked=true;
      butPval1.disabled=true;
      butPval2.disabled=true;
      TextPvalFunc3()
    }
  }

}else{
  if(butPval1.value == "3"){
    butPval1.checked=true;
    butPval2.disabled=true;
    butPval3.disabled=true;
    butPval4.disabled=true;
    labelPval2.style.background='#ff8080';
    labelPval3.style.background='#ff8080';
    labelPval4.style.background='#ff8080';
    TextPvalFunc1()
  }else if(butPval2.value == "3"){
    butPval2.checked=true;
    butPval1.disabled=true;
    butPval3.disabled=true;
    butPval4.disabled=true;
    labelPval1.style.background='#ff8080';
    labelPval3.style.background='#ff8080';
    labelPval4.style.background='#ff8080';
    TextPvalFunc2()
  }else if(butPval3.value == "3"){
    butPval3.checked=true;
    butPval1.disabled=true;
    butPval2.disabled=true;
    butPval4.disabled=true;
    labelPval1.style.background='#ff8080';
    labelPval2.style.background='#ff8080';
    labelPval4.style.background='#ff8080';
    TextPvalFunc3()
  }else if(butPval4.value == "3"){
    butPval4.checked=true;
    butPval1.disabled=true;
    butPval2.disabled=true;
    butPval3.disabled=true;
    labelPval1.style.background='#ff8080';
    labelPval2.style.background='#ff8080';
    labelPval3.style.background='#ff8080';
    TextPvalFunc4()
  }
}

}





function checkDecision(){

var buth0_1 = document.getElementById("h0");

var buth1_1 = document.getElementById("h1");


document.getElementById('decision').style.display='none';

if(buth0_1.checked == true){
  if(buth0_1.value == "2"){
    document.getElementById("labelh0").style.background='green';
    buth1_1.disabled=true;
    TextDecisionFunc1()
  }else{
    buth0_1.checked=false;
    buth0_1.disabled=true;
    document.getElementById("labelh0").style.background='#ff8080';
    buth1_1.checked=true;
    TextDecisionFunc2()
  }
}else if(buth1_1.checked == true){
  if(buth1_1.value == "2"){
    document.getElementById("labelh1").style.background='green';
    buth0_1.disabled=true;
    TextDecisionFunc2()
  }else{
    buth1_1.checked=false;
    buth1_1.disabled=true;
    document.getElementById("labelh1").style.background='#ff8080';
    buth0_1.checked=true;
    TextDecisionFunc1()
  }

}else{
  if(buth0_1.value == "2"){
    buth0_1.checked=true;
    buth1_1.disabled=true;
    document.getElementById("labelh1").style.background='#ff8080';
    TextDecisionFunc1()
  }else{
    buth1_1.checked=true;
    buth0_1.disabled=true;
    document.getElementById("labelh0").style.background='#ff8080';
    TextDecisionFunc2()
  }

}

}


function checkAll(){
  checkTest()
  checkPval()
  checkPvalNum()
  checkDecision()
}







function TextTval(){

  var tValue = document.getElementById("inputTest").value;
  document.getElementById("WText").innerHTML = tValue;


}


function TextPvalNum(){
  var PvalNumValue = document.getElementById("inputPvalNum").value;
  document.getElementById("PvalText").innerHTML = PvalNumValue;
}



function TextPvalFunc1(){

  if ("0.01"== 0.05){
    document.getElementById("PvalText").innerHTML = "> 0.05";
  } else {
    document.getElementById("PvalText").innerHTML = "> 0.01";
  }
  document.getElementById("PvalText").style.background='none';
}

function TextPvalFunc2(){

  if ("0.01"== 0.05){
    document.getElementById("PvalText").innerHTML = "between 0.05 and 0.025";
  } else {
    document.getElementById("PvalText").innerHTML = "between 0.01 and 0.005";
  }
  document.getElementById("PvalText").style.background='none';
}

function TextPvalFunc3(){

  if ("0.01"== 0.05){
    document.getElementById("PvalText").innerHTML = "between 0.025 and 0.01";
  } else {
    document.getElementById("PvalText").innerHTML = "between 0.005 and 0.001";
  }
  document.getElementById("PvalText").style.background='none';
}

function TextPvalFunc4(){

  if ("0.01"== 0.05){
    document.getElementById("PvalText").innerHTML = "< 0.01";
  } else {
    document.getElementById("PvalText").innerHTML = "< 0.001";
  }
  document.getElementById("PvalText").style.background='none';
}




function TextEffectSize(){

  var EffectSizeValue = document.getElementById("inputEffectSize").value;
  document.getElementById("EffectSizeText").innerHTML = EffectSizeValue;

}



function TextDecisionFunc1() {

  document.getElementById("TextDecision2").style.display='none';
  document.getElementById("TextDecision").innerHTML = '';
  document.getElementById("TextDecision").style.display='inline';
  document.getElementById("TextDecision").style.background='none';
}

function TextDecisionFunc2() {
  
  document.getElementById("TextDecision").style.display='none';
  document.getElementById("TextDecision2").innerHTML = 'not';
  document.getElementById("TextDecision2").style.display='inline';
  document.getElementById("TextDecision2").style.background='none';
}













function closeModals(){


  var W = document.getElementById("Wpp");
  var pval = document.getElementById("pvalue");
  var deci = document.getElementById("decision");
  

  var WH = document.getElementById("WHand");
  var pvalH = document.getElementById("pvalHand");
  var deciH = document.getElementById("decisionHand");
  

  var WR = document.getElementById("WWithR");
  var pvalR = document.getElementById("pvalWithR");
  var deciR = document.getElementById("decisionWithR");

  


  W.style.display='none';
  pval.style.display='none';
  deci.style.display='none';


  WH.style.display='none';
  pvalH.style.display='none';
  deciH.style.display='none';
  

  WR.style.display='none';
  pvalR.style.display='none';
  deciR.style.display='none';
  
}



function OpenW(){
closeModals()

var W = document.getElementById("Wpp");
W.style.display='block';
}


function OpenWHand(){
closeModals()

var WH = document.getElementById("WHand");
WH.style.display='block';
}

function OpenWR(){
closeModals()

var WR = document.getElementById("WWithR");
WR.style.display='block';
}

function OpenWSPSS(){
closeModals()

var WSPSS = document.getElementById("WWithSPSS");
WSPSS.style.display='block';
}

function OpenWExcel(){
closeModals()

var WExcel = document.getElementById("WWithExcel");
WExcel.style.display='block';
}



function Openpval(){
closeModals()

var pval = document.getElementById("pvalue");
pval.style.display='block';
}

function OpenpvalHand(){
closeModals()

var pvalH = document.getElementById("pvalHand");
pvalH.style.display='block';
}

function OpenpvalR(){
closeModals()

var pvalR = document.getElementById("pvalWithR");
pvalR.style.display='block';
}

function OpenpvalSPSS(){
closeModals()

var pvalSPSS = document.getElementById("pvalWithSPSS");
pvalSPSS.style.display='block';
}

function OpenpvalExcel(){
closeModals()

var pvalExcel = document.getElementById("pvalWithExcel");
pvalExcel.style.display='block';
}



function Opendecision(){
closeModals()

var deci = document.getElementById("decision");
deci.style.display='block';
}

function OpendecisionHand(){
closeModals()

var deciH = document.getElementById("decisionHand");
deciH.style.display='block';
}

function OpendecisionR(){
closeModals()

var deciR = document.getElementById("decisionWithR");
deciR.style.display='block';
}

function OpendecisionSPSS(){
closeModals()

var deciSPSS = document.getElementById("decisionWithSPSS");
deciSPSS.style.display='block';
}

function OpendecisionExcel(){
closeModals()

var deciExcel = document.getElementById("decisionWithExcel");
deciExcel.style.display='block';
}


function PvalHand(){
  selPval = document.getElementById("selectPval");
  PvalR = document.getElementById("PvalRadio");
  
  selPval.style.display='none';
  PvalR.style.display='inline';
  
  pval1Function()
  pval2Function()
  pval3Function()
  pval4Function()
  
  
}




function PvalSoft(){

  selPval = document.getElementById("selectPval");
  PvalN = document.getElementById("PvalNum");

  selPval.style.display='none';
  PvalN.style.display='inline';
  
}



function pval1Function(){

  if ("0.01"== 0.01){
    document.getElementById("labelpval1").innerHTML = "p > 0.01";
  } 


}



function pval2Function(){

  if ("0.01"== 0.01){
    document.getElementById("labelpval2").innerHTML = "0.01 &ge; p &ge; 0.005";
  } 


}


function pval3Function(){

  if ("0.01"== 0.01){
    document.getElementById("labelpval3").innerHTML = "0.005 > p &ge; 0.001";
  } 


}


function pval4Function(){

  if ("0.01"== 0.01){
    document.getElementById("labelpval4").innerHTML = "p < 0.001";
  } 


}


</script>




<div class="boxed" style="padding:10px;">
<font size="5">

We are studying the effect of a new treatment to reduce the cholesterol level. We have obtained two <button id="sample" onclick="document.getElementById('samplePU').style.display='block'" class="button button1">samples</button>, one that has received the treatment and a control group . The first sample contains 6 <button id="subjects" onclick="document.getElementById('subjectsPU').style.display='block'" class="button button1">subjects</button> and the second sample contains 6 subjects. 
<br>

We want to test whether the median of the first group is different from the mean of the second group. Use a <button id="alpha" onclick="document.getElementById('alphaPU').style.display='block'" class="button button1">level of significance</button> of = 0.01.

<br>
The measures in the samples are: 


<center>
<table id="obs1" cellpadding="1px" style="display: inline-table; border: 1px solid black; width: auto !important; margin-left: auto; margin-right: auto;" class="table table-striped">
<caption>Sample 1</caption>
<tbody>
  <tr>
   <td style="text-align:center;width: 2em; font-weight: bold;background-color: aquamarine !important;border-right:1px solid;font-weight: bold;background-color: aquamarine !important;"> Id </td>
   <td style="text-align:center;width: 5em; background-color: yellow !important;font-weight: bold;background-color: aquamarine !important;"> 1 </td>
   <td style="text-align:center;width: 5em; background-color: yellow !important;font-weight: bold;background-color: aquamarine !important;"> 2 </td>
   <td style="text-align:center;width: 5em; background-color: yellow !important;font-weight: bold;background-color: aquamarine !important;"> 3 </td>
   <td style="text-align:center;width: 5em; background-color: yellow !important;font-weight: bold;background-color: aquamarine !important;"> 4 </td>
   <td style="text-align:center;width: 5em; background-color: yellow !important;font-weight: bold;background-color: aquamarine !important;"> 5 </td>
   <td style="text-align:center;width: 5em; background-color: yellow !important;font-weight: bold;background-color: aquamarine !important;"> 6 </td>
  </tr>
  <tr>
   <td style="text-align:center;width: 2em; font-weight: bold;background-color: aquamarine !important;border-right:1px solid;"> Measure </td>
   <td style="text-align:center;width: 5em; background-color: yellow !important;"> 172 </td>
   <td style="text-align:center;width: 5em; background-color: yellow !important;"> 179 </td>
   <td style="text-align:center;width: 5em; background-color: yellow !important;"> 175 </td>
   <td style="text-align:center;width: 5em; background-color: yellow !important;"> 176 </td>
   <td style="text-align:center;width: 5em; background-color: yellow !important;"> 178 </td>
   <td style="text-align:center;width: 5em; background-color: yellow !important;"> 178 </td>
  </tr>
</tbody>
</table>

<!-- <table style="display: inline-table; width: 250px; height: 100px;"> -->
<!--   <tr style="background: aquamarine;"> -->
<!--     <th>Mean</th> -->
<!--     <th>Std. dev.</th> -->
<!--   </tr> -->
<!--   <tr style="background: yellow;"> -->
<!--     <td><input type="text" id="sampleMean" value="176.333" style="display: none; width:100px;" readonly> <button id="sampleMeanButton" style="width:100px; height: 40px;" onclick="showSampleMean()">Cheat</button></td> -->
<!--     <td><input type="text" id="sampleSD" value="2.582" style="display: none; width:100px;" readonly> <button id="sampleSDButton" style="width:100px; height: 40px;" onclick="showSampleSD()">Cheat</button></td> -->
<!--   </tr> -->
<!-- </table> -->

<!-- <br> -->
<br>

<table id="obs2" cellpadding="1px" style="display: inline-table; border: 1px solid black; width: auto !important; margin-left: auto; margin-right: auto;" class="table table-striped">
<caption>Sample 2</caption>
<tbody>
  <tr>
   <td style="text-align:center;width: 2em; font-weight: bold;background-color: aquamarine !important;border-right:1px solid;font-weight: bold;background-color: aquamarine !important;"> Id </td>
   <td style="text-align:center;width: 5em; background-color: yellow !important;font-weight: bold;background-color: aquamarine !important;"> 1 </td>
   <td style="text-align:center;width: 5em; background-color: yellow !important;font-weight: bold;background-color: aquamarine !important;"> 2 </td>
   <td style="text-align:center;width: 5em; background-color: yellow !important;font-weight: bold;background-color: aquamarine !important;"> 3 </td>
   <td style="text-align:center;width: 5em; background-color: yellow !important;font-weight: bold;background-color: aquamarine !important;"> 4 </td>
   <td style="text-align:center;width: 5em; background-color: yellow !important;font-weight: bold;background-color: aquamarine !important;"> 5 </td>
   <td style="text-align:center;width: 5em; background-color: yellow !important;font-weight: bold;background-color: aquamarine !important;"> 6 </td>
  </tr>
  <tr>
   <td style="text-align:center;width: 2em; font-weight: bold;background-color: aquamarine !important;border-right:1px solid;"> Measure </td>
   <td style="text-align:center;width: 5em; background-color: yellow !important;"> 227 </td>
   <td style="text-align:center;width: 5em; background-color: yellow !important;"> 230 </td>
   <td style="text-align:center;width: 5em; background-color: yellow !important;"> 229 </td>
   <td style="text-align:center;width: 5em; background-color: yellow !important;"> 230 </td>
   <td style="text-align:center;width: 5em; background-color: yellow !important;"> 228 </td>
   <td style="text-align:center;width: 5em; background-color: yellow !important;"> 231 </td>
  </tr>
</tbody>
</table>



<br>
<br>

<center>  <button onclick="OpenW()" class="button buttonbg" style="display:inline-block;">W value</button>
          <button onclick="Openpval()" class="button buttonbg" style="display:inline-block;">P-value</button>
          <button onclick="Opendecision()" class="button buttonbg" style="display:inline-block;">Statistical decision</button>

</center>

</div>

<br>


<div class="boxed" style="padding:10px;">

<iframe width='100%' height='300' src='https://rdrr.io/snippets/embed/?code=%23Write%20here%20your%20R%20code' frameborder='0'></iframe>

</div>

<br>

<div class="boxed" style="padding:10px;">
<font size=5>The value of the <i>W</i> statistic is <p id="WText" style="display: inline; background-color: #ffff00;">?.???</p> <div id="WTextChecked" style="display: none;">0</div>, corresponding to a p-value <p id="PvalText" style="display: inline; background-color: #ffff00;">?.???</p><div id="TextPvalNumChecked" style="display: none;">0.005</div><div id="PvalTextChecked" style="display: none;">0.005</div> . Thus, we can conclude that the medians of the cholesterol levels of the participants is <p id="TextDecision" style="display: inline; background-color: #ffff00;">??</p><p id="TextDecision2" style="display: inline; background-color: #ffff00;">??</p> equal between the subjects that received the treatment and the control group.</font>  <br>

</div>
<br>



<div class="boxed" style="padding:10px;">
<font size=5><label for="inputTest">Test Statistic = </label> <input id="inputTest" value="0" oninput="TextTval()" type="number" style="width:548px;"> <input type="text" id="outputTest" value="" style="display: none; width:200px;" readonly> <button id="check1" onclick="checkTest()">Check</button> </font> <br>
<div id="selectPval"><font size=5><label>p-value: </label></font> <button id="pvalHandButton" style="width:315px;" onclick="PvalHand()">By hand</button> <button id="pvalSoftButton" style="width:315px;" onclick="PvalSoft()">Using R, SPSS</button> <br></div>
<div id="PvalRadio" style="display: none;"><font size=5><label>p-value: </label></font> <font size=4><input type="radio" onchange="TextPvalFunc1()" id="pval1" name="pval" value="1" style="width:20px;"> <label for="pval1" id="labelpval1" onload="pval1Function()" style="width:80px;">p > 0.05</label> <input type="radio" onchange="TextPvalFunc2()" id="pval2" name="pval" value="2" style="width:20px;"> <label for="pval2" id="labelpval2" style="width:138px;">0.05 &ge; p &ge; 0.025</label> <input type="radio" onchange="TextPvalFunc3()" id="pval3" name="pval" value="3" style="width:20px;"> <label for="pval3" id="labelpval3" style="width:149px;">0.025 > p &ge; 0.01</label> <input type="radio" onchange="TextPvalFunc4()" id="pval4" name="pval" value="4" style="width:20px;"> <label for="pval4" id="labelpval4" style="width:80px;">p < 0.01</label> </font> <font size=5> <button id="check1" onclick="checkPval()">Check</button> </font> <br></div>
<div id="PvalNum" style="display: none;"><font size=5><label>p-value = </label> <input id="inputPvalNum" value="0" oninput="TextPvalNum()" type="number" style="width:548px;"> <input type="text" id="outputPvalNum" value="0.005" style="display: none; width:200px;" readonly> <button id="checkPvalNum" onclick="checkPvalNum()">Check</button> </font> <br></div>
<font size=5><label for="h0">Decision: </label> <input type="radio" id="h0" onchange="TextDecisionFunc1()" name="decision" value="1" style="width:25px;"> <label for="h0" id="labelh0" style="width:242px;">Do not reject H0</label> <input type="radio" id="h1" name="decision" onchange="TextDecisionFunc2()" value="2" style="width:25px;"> <label for="h1" id="labelh1" style="width:241px;">Reject H0</label> <button id="check3" onclick="checkDecision()">Check</button> </font> <br> <br>

</div>








<br>


<div class="w3-container">
  <div id="extra" class="w3-modal">
    <div class="w3-modal-content">
      <header class="w3-container w3-teal">
        <h2> </h2>
      </header>
      <div class="boxed" style="padding:10px;">
       <br>
      <br>
       <br>
      </div>
      <br>
      <footer class="w3-container w3-teal">
      <center>
        </center>
      </footer>
    </div>
  </div>
</div>



<div class="w3-container">
  <div id="samplePU" class="w3-modal">
    <div class="w3-modal-content">
      <header class="w3-container w3-teal"> 
        <h2>Sample <button onclick="document.getElementById('samplePU').style.display='none'" style="display:inline-block; position: absolute; background: #ff8080; color: white; top: 1px; right: 1px; font-size: 50px;">X</button></h2>
      </header>
      <div class="boxed" style="padding:10px;">
      A <b>sample</b> is a set of individuals selected from a population, usually intended to
represent the population in a research study. <br>
  A <b>population</b> is the set of all the individuals of interest in a particular study.<br> <br>
      <br>
      <font size="3"> Gravetter, F. J., & Wallnau, L. B. (2013). <i>Statistics for the behavioral sciences</i>.</font> <br>
      </div>
      <br>
      <footer class="w3-container w3-teal">
      <center>
        <button onclick="document.getElementById('samplePU').style.display='none'" style="display:inline-block; background-color= #ff8080; border: none; color: black;">Close</button>
        </center>
      </footer>
    </div>
  </div>
</div>




<div class="w3-container">
  <div id="subjectsPU" class="w3-modal">
    <div class="w3-modal-content">
      <header class="w3-container w3-teal"> 
        <h2>Subjects <button onclick="document.getElementById('subjectsPU').style.display='none'" style="display:inline-block; position: absolute; background: #ff8080; color: white; top: 1px; right: 1px; font-size: 50px;">X</button></h2>
      </header>
      <div class="boxed" style="padding:10px;">
      A subject is a unit (individuals, entities, etc) that can be selected for a study.
  The subjects have some characteristics that can be measured.<br> <br>
      <br>
       <br>
      </div>
      <br>
      <footer class="w3-container w3-teal">
      <center>
        <button onclick="document.getElementById('subjectsPU').style.display='none'" style="display:inline-block; background-color= #ff8080; border: none; color: black;">Close</button>
        </center>
      </footer>
    </div>
  </div>
</div>



<div class="w3-container">
  <div id="alphaPU" class="w3-modal">
    <div class="w3-modal-content">
      <header class="w3-container w3-teal"> 
        <h2>Alpha <button onclick="document.getElementById('alphaPU').style.display='none'" style="display:inline-block; position: absolute; background: #ff8080; color: white; top: 1px; right: 1px; font-size: 50px;">X</button></h2>
      </header>
      <div class="boxed" style="padding:10px;">
      The <b>alpha level</b>, or the <b>level of significance</b>, is a probability value 
  that is used to define the concept of "very unlikely" in a hypothesis test. 
  By convention, commonly used alpha levels are 0.05 (5%), 0.01 (1%), and 0.001 (0.1%). 
  For example, with alpha = 0.05, we separate the most unlikely 5% of the values 
  (the extreme values) from the most likely 95% of the values. <br>
      <br>
      <font size="3"> Gravetter, F. J., & Wallnau, L. B. (2013). <i>Statistics for the behavioral sciences</i>.</font> <br>
      </div>
      <br>
      <footer class="w3-container w3-teal">
      <center>
        <button onclick="document.getElementById('alphaPU').style.display='none'" style="display:inline-block; background-color= #ff8080; border: none; color: black;">Close</button>
        </center>
      </footer>
    </div>
  </div>
</div>







<div class="w3-container">
  <div id="Wpp" class="w3-modal">
    <div class="w3-modal-content">
      <header class="w3-container w3-teal"> 
        <h2>t statistic <button onclick="document.getElementById('Wpp').style.display='none'" style="display:inline-block; position: absolute; background: #ff8080; color: white; top: 10px; right: 5px;">X</button></h2>
      </header>
      <div class="w3-container">
      <br>
      <div class="boxed" style="padding:10px;">
      A <b>t statistic</b> is the standard distance between the diferences between sample means and an unknown population mean &mu; (which is usually considered to be 0). The standard deviation is given by the estimated standard error of the difference se.<br>
  
  $$ t = \frac{ \bar{x_1} - \bar{x_2} }{ se } $$

  <br>
   <br>
      <br>
       <br>
      </div>
      <br>
        <div class="boxed" style="padding:10px;">
        How to compute the t-value <button id='sample' onclick='OpenWHand()' class='button button1'>by hand</button>, 
  <button id='sample' onclick='OpenWR()' class='button button1'>with R</button>. <button onclick="checkTest()" style="display:inline; background-color= #ff8080; border: none; color: black; float: right;">Cheat</button>
        </div>
      </div>
      <br>
      <div id=solution class="w3-container" style=display:none;>
      <br>
      <br>
      </div>
      <footer class="w3-container w3-teal">
      <center>
        <button onclick="document.getElementById('Wpp').style.display='none'" style="display:inline-block; background-color= #ff8080; border: none; color: black;">Close</button>
        <button onclick="Openpval()" style="display:inline-block; background-color= #ff8080; border: none; color: black;">Next</button>
        </center>
      </footer>
    </div>
  </div>
</div>




<div class="w3-container">
  <div id="pvalue" class="w3-modal">
    <div class="w3-modal-content">
      <header class="w3-container w3-teal"> 
        <h2>P-value <button onclick="document.getElementById('pvalue').style.display='none'" style="display:inline-block; position: absolute; background: #ff8080; color: white; top: 10px; right: 5px;">X</button></h2>
      </header>
      <div class="w3-container">
      <br>
      <div class="boxed" style="padding:10px;">
      The <b>p value</b> or probability value indicates the probability for a mean or a more extreme mean
  in a sampling distribution for the mean with a certain mean &mu; and variability se.  <br>
   <br>
      <br>
       <br>
      </div>
      <br>
        <div class="boxed" style="padding:10px;">
        How to compute the p-value <button id='sample' onclick='OpenpvalHand()' class='button button1'>by hand</button>, 
  <button id='sample' onclick='OpenpvalR()' class='button button1'>with R</button>. <button onclick="checkPvalpp()" style="display:inline; background-color= #ff8080; border: none; color: black; float: right;">Cheat</button>
        </div>
      </div>
      <br>
      <div id=solution class="w3-container" style=display:none;>
      <br>
      <br>
      </div>
      <footer class="w3-container w3-teal">
      <center>
             <button onclick="OpenW()" style="display:inline-block; background-color= #ff8080; border: none; color: black;">Back</button>
        <button onclick="document.getElementById('pvalue').style.display='none'" style="display:inline-block; background-color= #ff8080; border: none; color: black;">Close</button>
        <button onclick="Opendecision()" style="display:inline-block; background-color= #ff8080; border: none; color: black;">Next</button>
        </center>
      </footer>
    </div>
  </div>
</div>






<div class="w3-container">
  <div id="decision" class="w3-modal">
    <div class="w3-modal-content">
      <header class="w3-container w3-teal"> 
        <h2>Statistical decision <button onclick="document.getElementById('decision').style.display='none'" style="display:inline-block; position: absolute; background: #ff8080; color: white; top: 10px; right: 5px;">X</button></h2>
      </header>
      <div class="w3-container">
      <br>
      <div class="boxed" style="padding:10px;">
      The statistical decision is the evaluation result of an hypothesis test.
<br>
  1. Fisher
<br>  
  The p value indicates the strength of the evidence against the null hypothesis.
  The p value is the probability of a statistic or more extreme, given the data under the null hypothesis.
<br>  
  2. Neyman-Pearson
<br>  
  We determine an alternative hypothesis and a limit (the Type-I error probability &alpha;)  in advance:
  When the p value is less than &alpha;), we reject the null hypothesis
<br>  
  Current practice
<br>  
  Researchers determine a limit (the Type-I error probability &alpha;) in advance.
  Researchers report the exact p value,
  usually along with the decision to reject the null hypothesis or not.
  Researchers consider lower p values as stronger evidence.
   <br>
      <br>
       <br>
      </div>
      <br>
        <div class="boxed" style="padding:10px;">
        How to compute the statistical decision <button id='sample' onclick='OpendecisionHand()' class='button button1'>by hand</button>, 
  <button id='sample' onclick='OpendecisionR()' class='button button1'>with R</button>. <button onclick="checkDecision()" style="display:inline; background-color= #ff8080; border: none; color: black; float: right;">Cheat</button>
        </div>
        <br>
      </div>
      <br>
      <div id=solution class="w3-container" style=display:none;>
      <br>
      </div>
      <footer class="w3-container w3-teal">
      <center>
             <button onclick="Openpval()" style="display:inline-block; background-color= #ff8080; border: none; color: black;">Back</button>
        <button onclick="document.getElementById('decision').style.display='none'" style="display:inline-block; background-color= #ff8080; border: none; color: black;">Close</button>
        </center>
      </footer>
    </div>
  </div>
</div>







<div class="w3-container">

  <div id="WHand" class="w3-modal">
    <div class="w3-modal-content">
      <header class="w3-container w3-teal"> 
        <h2>How to compute the t-statistic by hand <button onclick="document.getElementById('WHand').style.display='none'" style="display:inline-block; position: absolute; background: #ff8080; color: white; top: 10px; right: 5px;">X</button></h2>
      </header>
      <div class="boxed" style="padding:10px;">
      <font size="6">By hand:</font> 
  <br>
  $$ t = \frac{ \bar{x_1} - \bar{x_2} }{ se } $$
  where \(bar{x_1}\) and \(bar{x_1}\) are the means of sample 1 and 2 respectively, and se is the standard error.
  <br>
   <br>
      <br>
       <br>
      </div>
      <br>
      <div class="boxed" style="padding:10px;">
      <a href='https://youtu.be/oJjkjkY6mmA?t=638' target='_blank' rel='noopener noreferrer'>Video</a> <br>
      </div>
      <br>
      <div class="boxed" style="padding:10px;">
      <center>
          <button onclick="OpenW()" style="display:inline-block; background-color= #ff8080; border: none; color: black;">W value</button>
          <button onclick="OpenWR()" style="display:inline-block; background-color= #ff8080; border: none; color: black;">Using R</button>
        </center>
        </div>
      <footer class="w3-container w3-teal">
      <center>
        <button onclick="document.getElementById('WHand').style.display='none'" style="display:inline-block; background-color= #ff8080; border: none; color: black;">Close</button>
        </center>
      </footer>
    </div>
  </div>
</div>





<div class="w3-container">

  <div id="WWithR" class="w3-modal">
    <div class="w3-modal-content">
      <header class="w3-container w3-teal"> 
        <h2>How to compute the t-statistic with R <button onclick="document.getElementById('WWithR').style.display='none'" style="display:inline-block; position: absolute; background: #ff8080; color: white; top: 10px; right: 5px;">X</button></h2>
      </header>
      <div class="boxed" style="padding:10px;">
       $$ t = \frac{ \bar{x_1} - \bar{x_2} }{ se } $$
   <br>
      <br>
       <br>
      </div>
      <br>
      <div class="boxed" style="padding:10px;">
      <a href='https://youtu.be/RlhnNbPZC0A' target='_blank' rel='noopener noreferrer'>Video</a> <br>
      </div>
      <br>
      <div class="boxed" style="padding:10px;">
      <center>
          <button onclick="OpenW()" style="display:inline-block; background-color= #ff8080; border: none; color: black;">W value</button>
          <button onclick="OpenWHand()" style="display:inline-block; background-color= #ff8080; border: none; color: black;">By hand</button>
        </center>
        </div>
      <footer class="w3-container w3-teal">
      <center>
        <button onclick="document.getElementById('WWithR').style.display='none'" style="display:inline-block; background-color= #ff8080; border: none; color: black;">Close</button>
        </center>
      </footer>
    </div>
  </div>
</div>




<div class="w3-container">

  <div id="pvalHand" class="w3-modal">
    <div class="w3-modal-content">
      <header class="w3-container w3-teal"> 
        <h2>How to compute the p-value by hand <button onclick="document.getElementById('pvalHand').style.display='none'" style="display:inline-block; position: absolute; background: #ff8080; color: white; top: 10px; right: 5px;">X</button></h2>
      </header>
      <div class="boxed" style="padding:10px;">
      Use a t-distribution table.
   <br>
      <br>
       <br>
      </div>
      <br>
      <div class="boxed" style="padding:10px;">
      <a href='https://youtu.be/oJjkjkY6mmA?t=638' target='_blank' rel='noopener noreferrer'>Video</a> <br>
      </div>
      <br>
      <div class="boxed" style="padding:10px;">
      <center>
          <button onclick="Openpval()" style="display:inline-block; background-color= #ff8080; border: none; color: black;">P-value</button>
          <button onclick="OpenpvalR()" style="display:inline-block; background-color= #ff8080; border: none; color: black;">Using R</button>
        </center>
        </div>
      <footer class="w3-container w3-teal">
      <center>
        <button onclick="document.getElementById('pvalHand').style.display='none'" style="display:inline-block; background-color= #ff8080; border: none; color: black;">Close</button>
        </center>
      </footer>
    </div>
  </div>
</div>





<div class="w3-container">

  <div id="pvalWithR" class="w3-modal">
    <div class="w3-modal-content">
      <header class="w3-container w3-teal"> 
        <h2>How to compute the p-value using R <button onclick="document.getElementById('pvalWithR').style.display='none'" style="display:inline-block; position: absolute; background: #ff8080; color: white; top: 10px; right: 5px;">X</button></h2>
      </header>
      <div class="boxed" style="padding:10px;">
      Use qt(). For a detailed description of this function type ?qt.
   <br>
      <br>
       <br>
      </div>
      <br>
      <div class="boxed" style="padding:10px;">
      <a href='https://youtu.be/RlhnNbPZC0A' target='_blank' rel='noopener noreferrer'>Video</a> <br>
      </div>
      <br>
      <div class="boxed" style="padding:10px;">
      <center>
          <button onclick="Openpval()" style="display:inline-block; background-color= #ff8080; border: none; color: black;">P-value</button>
          <button onclick="OpenpvalHand()" style="display:inline-block; background-color= #ff8080; border: none; color: black;">By hand</button>
        </center>
        </div>
      <footer class="w3-container w3-teal">
      <center>
        <button onclick="document.getElementById('pvalWithR').style.display='none'" style="display:inline-block; background-color= #ff8080; border: none; color: black;">Close</button>
        </center>
      </footer>
    </div>
  </div>
</div>




<div class="w3-container">

  <div id="decisionHand" class="w3-modal">
    <div class="w3-modal-content">
      <header class="w3-container w3-teal"> 
        <h2>How to determine the statistical decision by hand <button onclick="document.getElementById('decisionHand').style.display='none'" style="display:inline-block; position: absolute; background: #ff8080; color: white; top: 10px; right: 5px;">X</button></h2>
      </header>
      <div class="boxed" style="padding:10px;">
      <font size="6">By hand:</font> 
  <br> If &alpha; < P-value, we do NOT reject the null hypothesis. <br>
  If &alpha; > P-value, we do reject the null hypothesis. <br>
   <br>
      <br>
       <br>
      </div>
      <br>
      <div class="boxed" style="padding:10px;">
      <a href='https://youtu.be/oJjkjkY6mmA?t=638' target='_blank' rel='noopener noreferrer'>Video</a> <br>
      </div>
      <br>
      <div class="boxed" style="padding:10px;">
      <center>
          <button onclick="Opendecision()" style="display:inline-block; background-color= #ff8080; border: none; color: black;">Statistical decision</button>
          <button onclick="OpendecisionR()" style="display:inline-block; background-color= #ff8080; border: none; color: black;">Using R</button>
        </center>
        </div>
      <footer class="w3-container w3-teal">
      <center>
        <button onclick="document.getElementById('decisionHand').style.display='none'" style="display:inline-block; background-color= #ff8080; border: none; color: black;">Close</button>
        </center>
      </footer>
    </div>
  </div>
</div>





<div class="w3-container">

  <div id="decisionWithR" class="w3-modal">
    <div class="w3-modal-content">
      <header class="w3-container w3-teal"> 
        <h2>How to determine the statistical decision with R <button onclick="document.getElementById('decisionWithR').style.display='none'" style="display:inline-block; position: absolute; background: #ff8080; color: white; top: 10px; right: 5px;">X</button></h2>
      </header>
      <div class="boxed" style="padding:10px;">
       If &alpha; < P-value, we do NOT reject the null hypothesis. <br>
  If &alpha; > P-value, we do reject the null hypothesis. <br>
   <br>
      <br>
       <br>
      </div>
      <br>
      <div class="boxed" style="padding:10px;">
      <a href='https://youtu.be/RlhnNbPZC0A' target='_blank' rel='noopener noreferrer'>Video</a> <br>
      </div>
      <br>
      <div class="boxed" style="padding:10px;">
      <center>
          <button onclick="Opendecision()" style="display:inline-block; background-color= #ff8080; border: none; color: black;">Statistical decision</button>
          <button onclick="OpendecisionHand()" style="display:inline-block; background-color= #ff8080; border: none; color: black;">By hand</button>
        </center>
        </div>
      <footer class="w3-container w3-teal">
      <center>
        <button onclick="document.getElementById('decisionWithR').style.display='none'" style="display:inline-block; background-color= #ff8080; border: none; color: black;">Close</button>
        </center>
      </footer>
    </div>
  </div>
</div>






