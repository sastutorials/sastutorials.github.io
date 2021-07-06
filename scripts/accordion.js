function myFunction(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show")== -1) {
      x.className += " w3-show";
    } else { 
      x.className = x.className.replace("w3-show", "");
    }
  }

  document.querySelector("#pulsante-da-premere").onclick = function() {
    // selezione del contenuto
    document.querySelector("#testo-da-copiare").select();
    // copia negli appunti
    document.execCommand('copy');
    };