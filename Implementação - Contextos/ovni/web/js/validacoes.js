//Função para retornar somente números
function SomenteNumeroComZero(e){
    var tecla=(window.event)?event.keyCode:e.which;
    if((tecla > 47 && tecla < 58)) return true;
    else{
    if (tecla != 8) return false;
    else return true;
    }
}

//Função para retornar somente números
function SomenteNumeroSemZero(e){
    var tecla=(window.event)?event.keyCode:e.which;
    if((tecla > 48 && tecla < 58)) return true;
    else{
    if (tecla != 8) return false;
    else return true;
    }
}

//Função para Validar Email
function ValidarEmail(txtEmail)
{
	email = txtEmail.value;
	
	
 	var er = new RegExp(/^[A-Za-z0-9_\-\.]+@[A-Za-z0-9_\-\.]{2,}\.[A-Za-z0-9]{2,}(\.[A-Za-z0-9])?/);
    if(er.test(email) || email == ""){ 
    	return true; 
    }else{
        alert('Email invalido');
		txtEmail.focus();
    }
}

//Função para Validar RG
function ValidarRG(e)
{

}

//Função para Validar cpf
function ValidarCPF(txtCPF)
{
	
	numcpf = txtCPF.value;
	
	x = 0;
	soma = 0;
	dig1 = 0;
	dig2 = 0;
	texto = "";
	numcpf1="";
	len = numcpf.length; x = len -1;
	// var numcpf = "12345678909";
	for (var i=0; i <= len - 3; i++) {
		y = numcpf.substring(i,i+1);
		soma = soma + ( y * x);
		x = x - 1;
		texto = texto + y;
	}
	dig1 = 11 - (soma % 11);
	if (dig1 == 10) dig1=0 ;
	if (dig1 == 11) dig1=0 ;
	numcpf1 = numcpf.substring(0,len - 2) + dig1 ;
	x = 11; soma=0;
	for (var i=0; i <= len - 2; i++) {
		soma = soma + (numcpf1.substring(i,i+1) * x);
		x = x - 1;
	}
	dig2= 11 - (soma % 11);
	if (dig2 == 10) dig2=0;
	if (dig2 == 11) dig2=0;
	//alert ("Digito Verificador : " + dig1 + "" + dig2);
	if ((dig1 + "" + dig2) == numcpf.substring(len,len-2)) {
		return true;
	}
	alert ("Numero do CPF invalido !!!");
	txtCPF.focus();
	return false;

}



//Verifica se o campo é requerido
function Requerido(txtCampo)
{
	//Verifica se existe value
	if(txtCampo.value == "")
	{
		//Mostra msg de erro
		alert(txtCampo.getAttribute('name') + ' é requerido(a).');
		return false;
	}
	else
	{
		return true;
	}
}

//Validaçção de cnpj
function ValidarCNPJ(txtCNPJ) {
                CNPJ = txtCNPJ.value;
                 erro = new String;
                 if (CNPJ.length != 14){ 
                 	erro += "É necessario preencher corretamente o número do CNPJ! \n\n";
                 	alert(erro);
                       return false;
                       txtCNPJ.focus();
                 }
                //substituir os caracteres que não são números
               if(document.layers && parseInt(navigator.appVersion) == 4){
                       x = CNPJ.substring(0,2);
                       x += CNPJ. substring (3,6);
                       x += CNPJ. substring (7,10);
                       x += CNPJ. substring (11,15);
                       x += CNPJ. substring (16,18);
                       CNPJ = x; 
               } else {
                       CNPJ = CNPJ. replace (".","");
                       CNPJ = CNPJ. replace (".","");
                       CNPJ = CNPJ. replace ("-","");
                       CNPJ = CNPJ. replace ("/","");
               }
               var nonNumbers = /\D/;
               if (nonNumbers.test(CNPJ)) erro += "A verificação de CNPJ suporta apenas números! \n\n"; 
               var a = [];
               var b = new Number;
               var c = [6,5,4,3,2,9,8,7,6,5,4,3,2];
               for (i=0; i<12; i++){
                       a[i] = CNPJ.charAt(i);
                       b += a[i] * c[i+1];
 			    }
               if ((x = b % 11) < 2) { a[12] = 0 } else { a[12] = 11-x }
               b = 0;
               for (y=0; y<13; y++) {
                       b += (a[y] * c[y]); 
               }
               if ((x = b % 11) < 2) { a[13] = 0; } else { a[13] = 11-x; }
               if ((CNPJ.charAt(12) != a[12]) || (CNPJ.charAt(13) != a[13])){
                       erro +="Dígito verificador com problema!";
               }
               if (erro.length > 0){
                       alert(erro);
                       return false;
                       txtCNPJ.focus();
               }
               return true;
       }





