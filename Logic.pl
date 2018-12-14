/*
 * SE(X):	X � um s�rie de TV
 * Smallville � uma s�rie de TV
 */

serie(smallville).

/*
 * mocinho(X):	X � mocinho
 * O Mocinho sempre � Clark.
 */
mocinho(clark).

/*
 * macinha(X):	X � mocinha
 * Jun��o das seguintes afirma��es:
 * - O Bandido � sempre um empres�rio que � apaixonado pela Mocinha [..]
 * - O Mocinho � apaixonado pela Mocinha
 */
mocinha(X) :- mocinho(Y), apaixonado(Y,X), bandido(Z), apaixonado(Z,X).

/*
 * invejosa(X):	X � invejosa
 * Jun��o das seguintes afirma��es:
 * - [..] a Invejosa � apaixonada pelo Mocinho.
 * - A Invejosa chantageia o Bandido.
 */
invejosa(X) :- bandido(Y), chantagear(X,Y), mocinho(Z), apaixonado(X,Z).

/*
 * empresario(X):	X � um empres�rio
 * estudante(X):	X � um estudante
 * lanchonete(X):	X trabalha numa lanchonete
 * Lex � empres�rio, Lana e Chlo� s�o estudantes e Clark trabalha numa lanchonete.
 */
empresario(lex).
estudante(lana).
estudante(chloe).
lanchonete(clark).

/*
 * chantagear(X, Y):	X chantageia Y
 * Chlo� chantagea todos os empres�rios que s�o apaixonados por Lana.
 */
chantagear(chloe, X) :- empresario(X) , apaixonado(X, lana).

/*
 * apaixonado(X, Y):	X � apaixonado por Y
 * Afirma��es:
 * - Harry, Clark e Lex s�o apaixonados por Lana.
 * - Chlo� � apaixonada por Clark.
 */
apaixonado(chloe, clark).
apaixonado(harry, lana).
apaixonado(clark, lana).
apaixonado(lex, lana).

/*
 * irmaoperdido(X, Y):	X � um irm�o perdido de Y
 * Todos os apaixonados por Lana, com exce��o de Clark, s�o irm�os perdidos de Clark.
 */
irmaoperdido(X, clark) :- apaixonado(X, lana), not(X=clark).

/*
 * bandido(X):	X � bandido
 * Jun��o das seguintes afirma��es:
 * - O Bandido � o irm�o perdido na inf�ncia do Mocinho.
 * - O Bandido � sempre um empres�rio que � apaixonado pela Mocinha.
 */
bandido(X) :- empresario(X), mocinho(Y), irmaoperdido(X,Y).

/*
 * personagem(X, Y):	X � um personagem da s�rie de TV Y
 * Um bandido, uma mocinha, um mocinho ou uma invejosa, que for um
 * empres�rio, estudante ou trabalhador de uma lanchonete, � um
 * personagem da s�rie Smallville.
 */
personagem(X, smallville) :- (empresario(X) ; estudante(X) ; lanchonete(X)), (bandido(X);mocinha(X);invejosa(X);mocinho(X)).
