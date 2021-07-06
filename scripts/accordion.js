function myFunction(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show")== -1) {
      x.className += " w3-show";
    } else { 
      x.className = x.className.replace("w3-show", "");
    }
  }

  function copia(testo) {
    var input = document.createElement('input');
    var area = document.getElementById(testo).value;
    input.setAttribute('value', area);
    document.body.appendChild(input);
    input.select();
    var risultato = document.execCommand('copy');
    document.body.removeChild(input);
    alert('testo copiato: '+ area);
    return risultato;
 }