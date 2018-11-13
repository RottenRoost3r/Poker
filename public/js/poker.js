function bigReveal() {
    var x = document.getElementById("winner");
    var y = document.getElementById("showbutton");
    var m = document.getElementById("audio1");
    var z = document.getElementById("audio2");
    m.play(); 
    if (x.style.display === "none") {
        x.style.display = "block";
        y.style.display = "none";
        z.play(); 
    }else{
        x.style.display = "none"
        y.style.display = "block"
    }   
} 



function playAudio() { 
    var m = document.getElementById("audio2");
    m.play(); 
}