function valida_envia(vaen){
	if(vaen=="Ingresar"){
		if(document.formu.usuario.value!="" && document.formu.clave.value!=""){
			document.formu.submit();
		}else{
			alert("El usuario y/o contraseña estan invalida");
		}
	}
}
