function myFunction(id) {
    var x = document.getElementById(id);
    if (!x.className.contains("w3-show")) {
      x.className += " w3-show";
    } else { 
      x.className = x.className.replace("w3-show", "");
    }
  }
