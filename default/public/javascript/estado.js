inicio();

function inicio(){
   f=document.formulario1;

   	if ((f.ope.value=="Incluir")&&(f.hecho.value==1)){
		alert("Registro Exitoso");
	}
	
	if ((f.ope.value=="Incluir")&&(f.hecho.value==0)){
		alert("Ya este estado existe");
	}
	
	if ((f.ope.value=="Buscar")&&(f.hecho.value==1)){
		alert("Busqueda exitosa");
	}
	
		if ((f.ope.value=="Modifica")&&(f.hecho.value==1)){
		alert("Registro Modificado");
	}
	
		if ((f.ope.value=="Modifica")&&(f.hecho.value==0)){
		alert("Ya este estado existe");
	}
		
if ((f.hecho.value==1)&&(f.ope.value=="Buscar")){
	f.nombres.disabled=false;
	f.guardar.disabled=true;
	f.nuevo.disabled=true;
	f.buscar.disabled=true;
	f.modificar.disabled=false;
	f.cancelar.disabled=false;	
	}
	else {
	f.nombres.disabled=true;
	f.guardar.disabled=true;
	f.modificar.disabled=true;
	f.eliminar.disabled=true;
	f.cancelar.disabled=true;
	}
}
function nuevos(){
	f=document.formulario1;
	f.nombres.disabled=false;
	f.guardar.disabled=false;
	f.modificar.disabled=true;
	f.cancelar.disabled=false;
	f.nuevo.disabled=true;
	f.buscar.disabled=true;
	f.nombres.focus();
}

function bus(){
	f=document.formulario1;	
	f.nombres.disabled=false;	
	f.nuevo.disabled=true;
	f.cancelar.disabled=false;			
	f.nombres.focus();	
}

//Función que busca
function valida_busca(tipo){ 
	f=document.formulario1;
//valido la descripcion 
	if (f.nombres.value.length==0){ 
	   alert("Tiene que Escribir el nombre ") 
	   document.formulario1.nombres.focus() 
	   return 0; 
	}
		
	
	else{
	   document.formulario1.ope.value=tipo
        //el formulario se envia 
	   document.formulario1.submit(); 
	}
   } 

function recarga(){
location.href="estado.php";

}
//Función  de botones
function valida_envia(tipo){ 
	f=document.formulario1;

	if (f.nombres.value.length==0){ 
	   alert("Tiene que Escribir Los Nombres") 
	   document.formulario1.nombres.focus() 
	   return 0; 
	}
	else{
	   document.formulario1.ope.value=tipo
        //el formulario se envia 
	   document.formulario1.submit(); 
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
