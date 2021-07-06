function myFunction(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show")== -1) {
      x.className += " w3-show";
    } else { 
      x.className = x.className.replace("w3-show", "");
    }
  }

  function copyFunction() {
    const copyText = document.getElementById("myInput").textContent;
    const textArea = document.createElement('textarea');
    textArea.textContent = copyText;
    document.body.append(textArea);
    textArea.select();
    document.execCommand("copy");
  }
  
  document.getElementById('button').addEventListener('click', copyFunction);