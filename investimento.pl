quantia_poupada(20000).
ganhos(25000, estavel).
dependentes(3).
num_investimentos(5).

poupanca_min(K, Y):- K is Y * 5000.
conta_poupanca(adequada):- quantia_poupada(X), dependentes(Y), poupanca_min(K,Y), X > K.
conta_poupanca(inadequada):- quantia_poupada(X), dependentes(Y), poupanca_min(K,Y), X < K.

renda_min(K, Y) :- K is 15000 + (4000 * Y).
renda(adequada) :- ganhos(X, estavel), dependentes(Y), renda_min(K, Y), X > K.
renda(inadequada) :- ganhos(X, estavel), dependentes(Y), renda_min(K, Y), X < K.

experiencia(aprendiz):- (num_investimentos(I), I < 5).
experiencia(experiente):- (num_investimentos(I), I > 4).

tipo_investidor(conservador):- conta_poupanca(inadequada); conta_poupanca(adequada), renda(inadequada).
tipo_investidor(moderado):- conta_poupanca(adequada) , renda(inadequada).
tipo_investidor(agresivo):- conta_poupanca(adequada), renda(adequada).

investimentos(poupanca):- conta_poupanca(inadequada).
investimentos(acoes):- conta_poupanca(adequada), renda(adequada), tipo_investidor(moderado).
investimentos(tesouro_direto):- conta_poupanca(adequada), renda(inadequada) ; tipo_investidor(conservador), experiencia(aprendiz).
investimentos(letras_de_credito):- conta_poupanca(adequada), experiencia(aprendiz); experiencia(experiente), tipo_investidor(conservador).
investimentos(fundo_imobiliario):- conta_poupanca(adequada), experiencia(aprendiz); experiencia(experiente), tipo_investidor(moderado).
investimentos(bitcoins):- conta_poupanca(adequada), experiencia(experiente), tipo_investidor(agresivo).
