/*=======================================================================================================*/

CREATE or REPLACE FUNCTION operacao_produtos(char,bigint,text,float(5),float(5),text,integer,integer,integer,text,text,integer,text,text,integer,integer,integer,bigint,text,integer,integer) RETURNS varchar(30) AS'
DECLARE
	cTipo 		alias for $1;
	bCodigo  	alias for $2;
	sTitulo  	alias for $3;
	fPesoKG		alias for $4;
	fValor		alias for $5;
	sUnidade 	alias for $6;
	iIpi		alias for $7;
	iIcms		alias for $8;
	iClassFiscal	alias for $9;
	sProcedencia	alias for $10;
	sPaisOrigem	alias for $11;
	iAnoLancamento	alias for $12;
	sAutorArtista	alias for $13;
	sIdioma		alias for $14;
	iTipoProduto	alias for $15;
	iGenero		alias for $16;
	iCategoria	alias for $17;
	bFornecedor	alias for $18;
	sResumo		alias for $19;
	iVendas		alias for $20;
	iVisitas	alias for $21;
	Status 		varchar(30);
BEGIN
	
	IF(Tipo =''I'') THEN 

		IF((SELECT _codigo FROM Produtos WHERE _codigo = bCodigo) = bCodigo) THEN
			Status = ''FRACASSO'';	
			RAISE EXCEPTION ''Produto já Cadastrado'';
		ELSE
			INSERT INTO Produtos(_titulo, _pesokg, _valor, _unidade, _ipi, _icms, _classfiscal, _procedencia, _paisorigem, _anolancamento, _autorartista, _idioma, _tipoproduto, _genero, _categoria, _fornecedor, _resumo, _vendas, _visitas)
			VALUES (sTitulo, fPesoKG, fValor, sUnidade, iIpi, iIcms, iClassFiscal, sProcedencia, sPaisOrigem, iAnoLancamento, sAutorArtista, sIdioma, iTipoProduto, iGenero, iCategoria, bFornecedor, sResumo, iVendas, iVisitas);
			Status = ''SUCESSO'';
		END IF;
	END IF; 

	IF (Tipo =''A'') THEN 	
		IF((SELECT _codigo FROM Produtos WHERE _codigo = bCodigo) = bCodigo) THEN
			UPDATE Produtos SET _titulo = sTitulo, _pesokg = fPesoKG, _valor = fValor, _unidade = sUnidade, _ipi = iIpi, _icms = iIcms, _classfiscal = iClassFiscal, _procedencia = sProcedencia, _paisorigem = sPaisOrigem, _anolancamento = iAnoLancamento,
				_autorartista = sAutorArtista, _idioma = sIdioma, _tipoproduto = iTipoProduto, _genero = iGenero, _categoria = iCategoria, _fornecedor = bFornecedor, _resumo = sResumo, _vendas = iVendas, _visitas = iVisitas
			WHERE _codigo = bCodigo;
			Status = ''SUCESSO'';
		ELSE
			Status = ''FRACASSO'';
			RAISE EXCEPTION ''Produto não Encontrado'';
		END IF;
	END IF; 

	IF (Tipo =''E'') THEN		
		IF((SELECT _codigo FROM Produtos WHERE _codigo = bCodigo) = bCodigo) THEN					
			DELETE FROM Produtos WHERE _codigo = bCodigo;
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