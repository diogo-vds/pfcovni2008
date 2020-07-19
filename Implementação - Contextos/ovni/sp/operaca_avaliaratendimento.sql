/*=======================================================================================================*/

CREATE or REPLACE FUNCTION operacao_avaliaratendimento(char,bigint,text,bigint) RETURNS varchar(30) AS'
DECLARE
	cTipo			alias for $1;
	bCodigo			alias for $2;
	sAvaliacao		alias for $3;
	lUsuario		alias for $4;
	Status 			varchar(30);
BEGIN	
	IF(cTipo =''I'') THEN 

		IF((SELECT _codigo FROM AvaliarAtendimento WHERE _codigo = bCodigo) = bCodigo) THEN
			Status = ''FRACASSO'';	
			RAISE EXCEPTION ''Atendimento já Cadastrado'';
		ELSE
			INSERT INTO AvaliarAtendimento(_avaliacao,_usuario,_dataavaliacao)
			VALUES (sAvaliacao,lUsuario,(select current_date));
			Status = ''SUCESSO'';
		END IF;
	END IF; 

	RETURN Status;
END;
'
LANGUAGE plpgsql;


/*=======================================================================================================*/
