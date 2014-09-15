inicio();

function inicio(){
   f=document.formulario1;

   	if ((f.ope.value=="Incluir")&&(f.hecho.value==1)){
		alert("Registro Exitoso");
	}
		if ((f.ope.value=="Modifica")&&(f.hecho.value==1)){
		alert("Registro Modificado");
	}
		
if ((f.hecho.value==1)&&(f.ope.value=="Buscar")){
	f.nombres.disabled=false;
	f.apellidos.disabled=false;
	document.getElementById('sex1').disabled = false;
	document.getElementById('sex2').disabled = false;
	f.fec_ing.disabled=false;
	f.tel_cel.disabled=false;
	f.tel_fij.disabled=false;
	f.correo.disabled=false;
	f.direccion.disabled=false;
	f.nuevo.disabled=true;
	f.buscar.disabled=true;
	f.modificar.disabled=false;
	f.cancelar.disabled=false;
	}
	else {
	f.nombres.disabled=true;
	f.apellidos.disabled=true;
	document.getElementById('sex1').disabled = true;
	document.getElementById('sex2').disabled = true;
	f.fec_ing.disabled=true;
	f.tel_cel.disabled=true;
	f.tel_fij.disabled=true;
	f.correo.disabled=true;
	f.direccion.disabled=true;
	f.guardar.disabled=true;
	f.modificar.disabled=true;
	f.eliminar.disabled=true;
	f.cancelar.disabled=true;
	}
}
function nuevos(){
	f=document.formulario1;
	
	f.nombres.disabled=false;
	f.apellidos.disabled=false;
	document.getElementById('sex1').disabled = false;
	document.getElementById('sex2').disabled = false;
	f.fec_ing.disabled=false;
	f.tel_cel.disabled=false;
	f.tel_fij.disabled=false;
	f.correo.disabled=false;
	f.direccion.disabled=false;
	f.modificar.disabled=true;
	f.cancelar.disabled=false;
	f.nuevo.disabled=true;
	f.buscar.disabled=true;

	f.ci.focus();
}

function bus(){
   f=document.formulario1;
		
	f.guardar.disabled=false;
	
	
}

//Función que busca
function valida_busca(tipo){ 
	f=document.formulario1;
//valido la descripcion 
	if (f.ci.value.length==0){ 
	   alert("Tiene que Escribir la Cedula ") 
	   document.formulario1.ci.focus() 
	   return 0; 
	}
		
	
	else{
	   document.formulario1.ope.value=tipo
        //el formulario se envia 
	   document.formulario1.submit(); 
	}
   } 

function recarga(){
location.href="personal.php";

}
//Función  de botones
function valida_envia(tipo){ 
	f=document.formulario1;


// funcion para validar la fecha de increso 
	var hoy = new Date();
	dia = hoy.getDate(); 
	mes = hoy.getMonth();
	anio= hoy.getFullYear();
	fecha_actual = String(dia+"/"+mes+"/"+anio);

	if (f.ci.value.length==0){ 
	   alert("Tiene que Escribir la Cedula") 
	   document.formulario1.ci.focus() 
	   return 0; 

	}
	if (f.nombres.value.length==0){ 
	   alert("Tiene que Escribir Los Nombres") 
	   document.formulario1.nombres.focus() 
	   return 0; 
	}
	if (f.apellidos.value.length==0){ 
	   alert("Tiene que Escribir Los Apellidos") 
	   document.formulario1.apellidos.focus() 
	   return 0; 
	}
	if (f.direccion.value.length==0){ 
	   alert("Tiene que Escribir La Direccion") 
	   document.formulario1.direccion.focus() 
	   return 0; 
	}
	if (f.tel_cel.value.length==0){ 
	   alert("Tiene que Escribir El Celular") 
	   document.formulario1.tel_cel.focus() 
	   return 0; 
	}
	if (f.tel_fij.value.length==0){ 
	   alert("Tiene que Escribir El Telefono Local") 
	   document.formulario1.tel_fij.focus() 
	   return 0; 
	}
	 if (f.correo.value.length==0){ 
	   alert("Tiene que Escribir el correo") 
	   document.formulario1.correo.focus() 
	   return 0; 
	}
	else{
	   document.formulario1.ope.value=tipo
        //el formulario se envia 
	   document.formulario1.submit(); 
	}
   } 

//Función que permite solo Números
function ValidaSoloNumeros() {
 if ((event.keyCode < 48) || (event.keyCode > 57)) 
  event.returnValue = false;
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
