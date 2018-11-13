function bigReveal() {
    var x = document.getElementById("winner");
    var y = document.getElementById("showbutton");
    var m = document.getElementById("audio1");
    var z = document.getElementById("audio2");
   
    x.style.display = "block";
    y.style.display = "none";
    m.play(); 
     
} 



function playAudio() { 
    var m = document.getElementById("audio2");
    m.play(); 
}