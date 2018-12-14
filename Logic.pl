/*
 * SE(X):	X é um série de TV
 * Smallville é uma série de TV
 */

serie(smallville).

/*
 * mocinho(X):	X é mocinho
 * O Mocinho sempre é Clark.
 */
mocinho(clark).

/*
 * macinha(X):	X é mocinha
 * Junção das seguintes afirmações:
 * - O Bandido é sempre um empresário que é apaixonado pela Mocinha [..]
 * - O Mocinho é apaixonado pela Mocinha
 */
mocinha(X) :- mocinho(Y), apaixonado(Y,X), bandido(Z), apaixonado(Z,X).

/*
 * invejosa(X):	X é invejosa
 * Junção das seguintes afirmações:
 * - [..] a Invejosa é apaixonada pelo Mocinho.
 * - A Invejosa chantageia o Bandido.
 */
invejosa(X) :- bandido(Y), chantagear(X,Y), mocinho(Z), apaixonado(X,Z).

/*
 * empresario(X):	X é um empresário
 * estudante(X):	X é um estudante
 * lanchonete(X):	X trabalha numa lanchonete
 * Lex é empresário, Lana e Chloé são estudantes e Clark trabalha numa lanchonete.
 */
empresario(lex).
estudante(lana).
estudante(chloe).
lanchonete(clark).

/*
 * chantagear(X, Y):	X chantageia Y
 * Chloé chantagea todos os empresários que são apaixonados por Lana.
 */
chantagear(chloe, X) :- empresario(X) , apaixonado(X, lana).

/*
 * apaixonado(X, Y):	X é apaixonado por Y
 * Afirmações:
 * - Harry, Clark e Lex são apaixonados por Lana.
 * - Chloé é apaixonada por Clark.
 */
apaixonado(chloe, clark).
apaixonado(harry, lana).
apaixonado(clark, lana).
apaixonado(lex, lana).

/*
 * irmaoperdido(X, Y):	X é um irmão perdido de Y
 * Todos os apaixonados por Lana, com exceção de Clark, são irmãos perdidos de Clark.
 */
irmaoperdido(X, clark) :- apaixonado(X, lana), not(X=clark).

/*
 * bandido(X):	X é bandido
 * Junção das seguintes afirmações:
 * - O Bandido é o irmão perdido na infância do Mocinho.
 * - O Bandido é sempre um empresário que é apaixonado pela Mocinha.
 */
bandido(X) :- empresario(X), mocinho(Y), irmaoperdido(X,Y).

/*
 * personagem(X, Y):	X é um personagem da série de TV Y
 * Um bandido, uma mocinha, um mocinho ou uma invejosa, que for um
 * empresário, estudante ou trabalhador de uma lanchonete, é um
 * personagem da série Smallville.
 */
personagem(X, smallville) :- (empresario(X) ; estudante(X) ; lanchonete(X)), (bandido(X);mocinha(X);invejosa(X);mocinho(X)).
