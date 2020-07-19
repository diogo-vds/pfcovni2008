CREATE OR REPLACE FUNCTION operacao_endereco(character varying, character varying, bigint, character varying, text, integer, integer, text, text, text, text, text, text, text, integer, bigint)
  RETURNS character varying AS
$BODY$
DECLARE
	cTipo			alias for $1;
	cTpObjeto		alias for $2;
	bCodigo			alias for $3;
	iCep			alias for $4;
	sRua			alias for $5;
	iNumero			alias for $6;
	iCaixaPostal		alias for $7;	
	sComplemento		alias for $8;
	sBairro			alias for $9;
	sMunicipio		alias for $10;
	sEstado			alias for $11;
	sPais			alias for $12;
	sNomeReceptor		alias for $13;
	sReferenciaEntrega	alias for $14;
	iTipoEndereco		alias for $15;
	bCodigoObjeto		alias for $16;
	Status 			varchar(30);
BEGIN	
	IF(cTipo ='I') THEN 
		IF(cTpObjeto ='F') THEN
			IF((SELECT _codigo FROM Endereco WHERE _codigo = bCodigo) = bCodigo) THEN
				Status = 'FRACASSO';	
				RAISE EXCEPTION 'Endereco do Fornecedor já Cadastrado';
			ELSE				
				INSERT INTO Endereco(_cep,_rua,_numero,_caixapostal,_complemento,_bairro,_municipio,_estado,_pais,_nomereceptor,_referenciaentrega,_tipoendereco,_fornecedor)
				VALUES (iCep,sRua,iNumero,iCaixaPostal,sComplemento,sBairro,sMunicipio,sEstado,sPais,sNomeReceptor,sReferenciaEntrega,iTipoEndereco,bCodigoObjeto);
				Status = 'SUCESSO';
			END IF;
		ELSE
			IF((SELECT _codigo FROM Endereco WHERE _codigo = bCodigo) = bCodigo) THEN	
				Status = 'FRACASSO';	
				RAISE EXCEPTION 'Endereco do Usuario já Cadastrado';
			ELSE				
				INSERT INTO Endereco(_cep,_rua,_numero,_caixapostal,_complemento,_bairro,_municipio,_estado,_pais,_nomereceptor,_referenciaentrega,_tipoendereco,_usuario)
				VALUES (iCep,sRua,iNumero,iCaixaPostal,sComplemento,sBairro,sMunicipio,sEstado,sPais,sNomeReceptor,sReferenciaEntrega,iTipoEndereco,bCodigoObjeto);
				Status = 'SUCESSO';
			END IF;
		END IF;
	END IF; 

	IF (cTipo ='A') THEN 	
		IF(cTpObjeto ='F') THEN
			IF((SELECT _codigo FROM Endereco WHERE _codigo = bCodigo) = bCodigo) THEN
				UPDATE Endereco SET _cep = iCep, _rua = sRua, _numero = iNumero, _caixapostal = iCaixaPostal, _complemento = sComplemento, _bairro = sBairro, _municipio = sMunicipio, 
						    _estado = sEstado, _pais = sPais, _nomereceptor = sNomeReceptor, _referenciaentrega = sReferenciaEntrega
				WHERE _codigo = bCodigo;
				Status = 'SUCESSO';
			ELSE
				Status = 'FRACASSO';
				RAISE EXCEPTION 'Endereco do Fornecedor não Encontrado';
			END IF;
		ELSE
			IF((SELECT _codigo FROM Endereco WHERE _codigo = bCodigo) = bCodigo) THEN
				UPDATE Endereco SET _cep = iCep, _rua = sRua, _numero = iNumero, _caixapostal = iCaixaPostal, _complemento = sComplemento, _bairro = sBairro, _municipio = sMunicipio, 
						    _estado = sEstado, _pais = sPais, _nomereceptor = sNomeReceptor, _referenciaentrega = sReferenciaEntrega
				WHERE _codigo = bCodigo;
				Status = 'SUCESSO';
			ELSE
				Status = 'FRACASSO';
				RAISE EXCEPTION 'Endereco do Usuario não Encontrado';
			END IF;
		END IF;
	END IF; 

	IF (cTipo ='E') THEN		
		IF((SELECT _codigo FROM Endereco WHERE _codigo = bCodigo) = bCodigo) THEN					
			DELETE FROM Endereco WHERE _codigo = bCodigo;
			Status = 'SUCESSO';
		ELSE
			Status = 'FRACASSO';
			RAISE EXCEPTION 'Endereco não Encontrado';
		END IF;
	END IF; 

	RETURN Status;
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE;