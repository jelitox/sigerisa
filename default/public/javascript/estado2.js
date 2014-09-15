function valida_envia(auxe){
	if(auxe=="Guardar"){
		f=document.formulario1;
		if (f.nombres.value.length==0){ 
		   alert("Tiene que Escribir Los Nombres") 
		   document.formulario1.nombres.focus() ;
		}else{
			f.ope.value=auxe;
			f.submit();
		}
	}if(auxe=="Buscar"){		
		window.open('../../plantilla/bus_avan.php', this.target,'left=250, top=150, height= 320, width= 900,resizable=yes,toolbar=no,menubar=no,scrollbars =no');
	}else{
		
	}
}

function soloLetras(e){
       key = e.keyCode || e.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
       especiales = [8,37,39,46];

       tecla_especial = false
       for(var i in especiales){
            if(key == especiales[i]){
                tecla_especial = true;
                break;
            }
        }

        if(letras.indexOf(tecla)==-1 && !tecla_especial){
            return false;
        }
    }

function recarga(){
location.href="estado.php";
}
