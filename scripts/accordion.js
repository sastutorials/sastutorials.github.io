function myFunction(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show")== -1) {
      x.className += " w3-show";
    } else { 
      x.className = x.className.replace("w3-show", "");
    }
  }

  function myFunction() {
    var copyText = document.getElementById("myInput");
    copyText.select();
    document.execCommand("Copy");
    alert("Copied the text: " + copyText.value);
  }