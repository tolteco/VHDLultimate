Multiplicador de 8 bits usando somadores de 16 bits

Usa CLAs (Carry Look-Ahead Adders) de 4bits com um híbrido de CSAs de 8. Um "alto nível" CSA escolhe entre dois
híbridos de 8 e forma um somador 16 bits.



Comportamento do MultiplicadorSomador8:

Escolhe entre o menor (Valor absoluto) entre as entradas e considera-se esse valor como n.
Soma-se o outro valor (x), |n| vezes. Caso n seja negativo, inverte-se o resultado.



Tempos:

CSA8  - 12ns
CSA16 - 12ns - HOW?
Subtrator16 - 20ns
MinAbs8 - 16ns
Reg(16) - 8ns