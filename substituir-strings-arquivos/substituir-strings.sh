informacao_encontrar="www.portalfiscal.inf.br/nfe"
informacao_nova="www.portalfiscal.inf.br/cte"

scape_find="${informacao_encontrar//\//\\/}"
scape_new="${informacao_nova//\//\\/}"

rm -rf corrigidos;
mkdir corrigidos;

for i in `ls errados/`; do
	
	arquivo="errados/$i"
	
	conteudo=`cat $arquivo`;
	if [[ $conteudo == *"$informacao_encontrar"* ]]; then
		echo "Modificando arquivo $arquivo"
		echo "Arquivo $arquivo contem $informacao_encontrar"
		commandsed="/s/$scape_find/$informacao_nova/g";
		touch "corrigidos/$i";
		sed "s/$scape_find/$scape_new/g" "$arquivo" > "corrigidos/$i"
	else 
		echo echo "Arquivo $arquivo NAO contem $informacao_encontrar. Ignorando"
	fi;
	
done;