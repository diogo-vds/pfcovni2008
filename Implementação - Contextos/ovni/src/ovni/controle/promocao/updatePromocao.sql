--Este arquivo deve ser colocado na pasta bin do postgres
UPDATE promocao SET _valorpromocao = 0.0 WHERE _datatermino = current_date;