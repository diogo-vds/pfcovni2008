/*=======================================================================================================*/


CREATE or REPLACE FUNCTION operacao_conteudo(char,bigint,bigint,integer,text) RETURNS varchar(30) AS'
DECLARE
	cTipo			alias for $1;
	bCodigo			alias for $2;
	bProduto		alias for $3;
	iCaracteristica		alias for $4;
	sDescricao		alias for $5;
	Status 			varchar(30);
BEGIN	
	IF(Tipo =''I'') THEN 

		IF((SELECT _codigo FROM ConteudoProduto WHERE _codigo = bCodigo) = bCodigo) THEN
			Status = ''FRACASSO'';	
			RAISE EXCEPTION ''Caracteristica já Cadastrado'';
		ELSE
			INSERT INTO ConteudoProduto(_produto,_caracttipoproduto,_descricao)
			VALUES (bProduto,iCaracteristica,sDescricao);
			Status = ''SUCESSO'';
		END IF;
	END IF; 

	IF (Tipo =''A'') THEN 	
		IF((SELECT _codigo FROM ConteudoProduto WHERE _codigo = bCodigo) = bCodigo) THEN
			UPDATE ConteudoProduto SET _produto = bProduto, _caracteristica = iCaracteristica, _descricao = sDescricao
			WHERE _codigo = bCodigo;
			Status = ''SUCESSO'';
		ELSE
			Status = ''FRACASSO'';
			RAISE EXCEPTION ''Produto não Encontrado'';
		END IF;
	END IF; 

	IF (Tipo =''E'') THEN		
		IF((SELECT _codigo FROM ConteudoProduto WHERE _codigo = bCodigo) = bCodigo) THEN					
			DELETE FROM ConteudoProduto WHERE _codigo = bCodigo;
			Status = ''SUCESSO'';
		ELSE
			Status = ''FRACASSO'';
			RAISE EXCEPTION ''Produto não Encontrado'';
		END IF;
	END IF; 

	RETURN Status;
END;
'
LANGUAGE plpgsql;

/*=======================================================================================================*/