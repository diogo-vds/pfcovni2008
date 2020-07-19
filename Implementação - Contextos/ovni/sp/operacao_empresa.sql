-- -------------------------------------------------------
-- Procedure Utilizada para atualizar os dados da empresa
-- feita em 18/10 , última alteração em 18/10 por Léo

-- ex: select operacao_empresa(1,'Ovni.NET - Compras','Ovni Serviços OnLine S.A.',02352988000123,12212,2324,011,2629220,0111,1121231,'08775320','Rua Amélia','539','','Centro','Mogi das Cruzes','SP','Brasil');
-- -------------------------------------------------------

CREATE OR REPLACE FUNCTION operacao_empresa(bigint,varchar(100),varchar(100),bigint,bigint,bigint,integer,integer,integer,integer,varchar(8),varchar(130),varchar(10),varchar(40),varchar(100),varchar(100),varchar(2),varchar(25) ) RETURNS varchar(30) AS'
DECLARE
	  codigo 		alias for $1;
	  nomefantasia 		alias for $2;
	  razaosocial 		alias for $3;
	  cnpj  		alias for $4;
	  inscrestadual 	alias for $5;
	  inscrmunicipal 	alias for $6;
	  ddd			alias for $7;
	  telefoneprincipal  	alias for $8;
	  dddfax		alias for $9;
	  fax		  	alias for $10;
	  cep 			alias for $11;
	  endereco 		alias for $12;
	  numero 		alias for $13;
	  complemento 		alias for $14;
	  bairro 		alias for $15;
	  municipio 		alias for $16;
	  estado 		alias for $17;
	  pais 			alias for $18;
	  
          Status 		varchar(30);
BEGIN
	
		IF((SELECT COUNT(*) FROM DADOSEMPRESA) = 0) THEN

			INSERT INTO dadosempresa(
				    _codigo, _nomefantasia, _razaosocial, _cnpj, _inscrestadual, 
				    _inscrmunicipal, _ddd,_telefoneprincipal, _cep, _endereco, _numero, 
				    _complemento, _bairro, _municipio, _estado, _pais,_dddfax,_fax)

			    VALUES (codigo, nomefantasia, razaosocial, cnpj, inscrestadual, 
				    inscrmunicipal, ddd,telefoneprincipal, cep, endereco, numero, 
				    complemento, bairro, municipio, estado, pais,dddfax,fax);

			    Status = ''SUCESSO'';
		ELSE
			UPDATE dadosempresa
			   SET  _nomefantasia= nomefantasia, _razaosocial=razaosocial, _cnpj=cnpj, _inscrestadual=inscrestadual, 
			       _inscrmunicipal=inscrmunicipal, _telefoneprincipal=telefoneprincipal, _cep=cep, _endereco=endereco, 
			       _numero=numero, _complemento=complemento, _bairro=bairro, _municipio=municipio, _estado=estado, 
			       _pais=pais,_ddd=ddd,_dddfax=dddfax,_fax=fax
			 WHERE _codigo = codigo;

			Status = ''SUCESSO'';

		END IF;

			

	RETURN Status;
END;
'
LANGUAGE plpgsql;

/*=======================================================================================================*/