/*=======================================================================================================*/

CREATE OR REPLACE FUNCTION operacao_usuario(char,bigint,integer,text,bigint,bigint,text,text,date,text,text,text,integer,integer,integer,integer,integer,integer,date) RETURNS varchar(30) AS'
DECLARE
	cTipo 			alias for $1;
	bCodigo  		alias for $2;
	iTipoUsuario		alias for $3;
	sNome			alias for $4;
	bCPF  			alias for $5;
	bRG			alias for $6;
	sOrgaoEmissor		alias for $7;
	sNaturalidade		alias for $8;
	dDataNascimento		alias for $9;
	sSexo			alias for $10;
	sEmail			alias for $11;
	sSenha			alias for $12;
	iDDD			alias for $13;
	iTelefonePrincipal	alias for $14;
	iRamal			alias for $15;
	iTelefoneOpcional	alias for $16;
	iFax			alias for $17;
	iCelular		alias for $18;
	dDataUltimoAcesso	alias for $19;
	Status 		varchar(30);
BEGIN
	
	IF(cTipo =''I'') THEN 

		IF((SELECT COUNT(*) FROM Usuario WHERE _email = sEmail) > 0) THEN
			Status = ''FRACASSO'';	
			RAISE EXCEPTION ''Usuario já Cadastrado'';
		ELSE
			INSERT INTO Usuario(_codigo, _tipousuario, _nome, _cpf, _rg, _orgaoemissor, _naturalidade, _datanascimento, _sexo, _email, _senha, _ddd, _telefoneprincipal, _ramal, _telefoneopcional, _fax, _celular, _dataultimoacesso)
			VALUES (bCodigo, iTipoUsuario, sNome, bCPF, bRG, sOrgaoEmissor, sNaturalidade, dDataNascimento, sSexo, sEmail, sSenha, iDDD, iTelefonePrincipal, iRamal, iTelefoneOpcional, iFax, iCelular, dDataUltimoAcesso);
			Status = ''SUCESSO'';
		END IF;
	END IF; 

	IF (cTipo =''A'') THEN 	
		IF((SELECT _codigo FROM Usuario WHERE _codigo = bCodigo) = bCodigo) THEN
			UPDATE Usuario SET _tipousuario = iTipoUsuario, _nome = sNome, _cpf = bCPF, _rg = bRG, _orgaoemissor = sOrgaoEmissor, _naturalidade = sNaturalidade, 
				_datanascimento = dDataNascimento, _sexo = sSexo, _email = sEmail,_ddd = iDDD, _telefoneprincipal = iTelefonePrincipal, _ramal = iRamal, 
				_telefoneopcional = iTelefoneOpcional, _fax = iFax, _celular = iCelular, _dataultimoacesso = dDataUltimoAcesso
			WHERE _codigo = bCodigo;
			Status = ''SUCESSO'';
		ELSE
			Status = ''FRACASSO'';
			RAISE EXCEPTION ''Usuario não Encontrado'';
		END IF;
	END IF; 

	IF (cTipo =''E'') THEN		
		IF((SELECT _codigo FROM Usuario WHERE _codigo = bCodigo) = bCodigo) THEN					
			DELETE FROM Usuario WHERE _codigo = bCodigo;
			Status = ''SUCESSO'';
		ELSE
			Status = ''FRACASSO'';
			RAISE EXCEPTION ''Usuario não Encontrado'';
		END IF;
	END IF; 

	RETURN Status;
END;
'
LANGUAGE plpgsql;

/*=======================================================================================================*/