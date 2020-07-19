/*=======================================================================================================*/


CREATE OR REPLACE FUNCTION operacao_fornecedor(char,bigint,text,text,bigint,bigint,bigint,bigint,text,text,integer,integer,integer,integer,integer,integer,text) RETURNS varchar(30) AS'
DECLARE
	cTipo 			alias for $1;
	bCodigo  		alias for $2;
	vNomeFantasia  		alias for $3;
	vRazaoSocial		alias for $4;
	bCnpj 			alias for $5;
	bInscrEstadual		alias for $6;
	bCEI			alias for $7;
	bInscrMunicipal		alias for $8;
	vContato		alias for $9;
	vCargo			alias for $10;
	iDDD			alias for $11;
	iTelefonePrincipal	alias for $12;
	iRamal			alias for $13;
	iTelefoneOpcional	alias for $14;
	iFax			alias for $15;
	iCelular		alias for $16;
	vEmail			alias for $17;	
	Status 			varchar(30);
BEGIN
	
	IF(cTipo =''I'') THEN 

		IF((SELECT _codigo FROM Fornecedores WHERE _codigo = bCodigo) = bCodigo) THEN
			Status = ''FRACASSO'';	
			RAISE EXCEPTION ''Fornecedor já Cadastrado'';
		ELSE
			INSERT INTO Fornecedores(_codigo, _nomefantasia, _razaosocial, _cnpj, _inscrestadual, _cei, _inscrmunicipal, _contato, _cargo, _ddd, _telefoneprincipal, _ramal, _telefoneopcional, _fax, _celular, _email)
			VALUES (bCodigo, vNomeFantasia, vRazaoSocial, bCnpj, bInscrEstadual, bCEI, bInscrMunicipal, vContato, vCargo, iDDD, iTelefonePrincipal, iRamal, iTelefoneOpcional, iFax, iCelular, vEmail);
			Status = ''SUCESSO'';
		END IF;
	END IF; 

	IF (cTipo =''A'') THEN 	
		IF((SELECT _codigo FROM Fornecedores WHERE _codigo = bCodigo) = bCodigo) THEN
			UPDATE Fornecedores SET _nomefantasia = vNomeFantasia, _razaosocial = vRazaoSocial, _cnpj = bCnpj, _cei = bCEI, _inscrestadual = bInscrEstadual, 
				_inscrmunicipal = bInscrMunicipal, _contato = vContato, _cargo = vCargo, _ddd = iDDD, _telefoneprincipal = iTelefonePrincipal, _telefoneopcional = iTelefoneOpcional, _fax = iFax, _celular = iCelular, _email = vEmail
			WHERE _codigo = bCodigo;
			Status = ''SUCESSO'';
		ELSE
			Status = ''FRACASSO'';
			RAISE EXCEPTION ''Fornecedor não Encontrado'';
		END IF;
	END IF; 

	IF (cTipo =''E'') THEN		
		IF((SELECT _codigo FROM Fornecedores WHERE _codigo = bCodigo) = bCodigo) THEN					
			DELETE FROM Fornecedores WHERE _codigo = bCodigo;
			Status = ''SUCESSO'';
		ELSE
			Status = ''FRACASSO'';
			RAISE EXCEPTION ''Fornecedor não Encontrado'';
		END IF;
	END IF; 

	RETURN Status;
END;
'
LANGUAGE plpgsql;

/*=======================================================================================================*/