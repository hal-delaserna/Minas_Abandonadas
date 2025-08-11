# Minas_Abandonadas

Este exercício é dedicado à apuração de minas que foram abandonadas por seus titulares. Fazê-lo por visitas *in loco* nem sempre é possível ou ideal, dado o consumo de recursos e o custo de oportunidade. A inspeção presencial também é ela própria sucetível à falhas, pois a demarcação entre o que é uma longa paralização e um abandono, não é óbvia. 

O expediente a que recorremos é assumir que uma área de lavra foi abandonada quando o processo minerário relacionado a ela também o foi.

Para esse fim, recorremos aos dados abertos de CNPJs da Receita Federal e a sua situação cadastral. Processos minerários ativos e vinculados a CNPJs que não existem mais (isto é, extintos pela Receita Federal) são processos sem titularidade identificável. Podemos assumi-los como abandonados e deste fato inferimos o abandono da área.
