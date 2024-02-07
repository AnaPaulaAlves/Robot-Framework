*** Settings ***
Documentation   Exemplo de tipos de variáveis: SIMPLES, LISTAS e DICIONÁRIOS
*** Variable ***
#Simples
${SIMPLES}   Vamos ver os tipos de variáveis no robot!

#Tipo Lista (arrays) - separar itens com espaço duplo
@{FRUTAS}    morango   banana   maça   uva   abacaxi

#Tipo Dicionário (chave=valor) - separar cada chave=valor com espaço duplo
&{PESSOA}    nome=May Ana Paula   email=anapaula.isa@hotmail.com   idade=38   sexo=feminino

*** Test Cases ***
Caso de teste de exemplo 01
    Uma keyword qualquer 01

*** Keywords ***
Uma keyword qualquer 01
    # Lendo um valor Simples
    Log    ${SIMPLES}

    # Lendo um item de uma Lista
    Log    Essa tem que ser maça: ${FRUTAS[2]} e essa tem que ser morango: ${FRUTAS[0]}

    # Lendo chaves de um Dicionário
    Log    Nome: ${PESSOA.nome} e email: ${PESSOA.email}


*** Variables ***
@{MESES_DO_ANO}   Jeneiro  Fevereiro  Março  Abril  Maio  Junho  Julho  Agosto  Setembro  Outubro  Novembro  Dezembro

*** Test Cases ***
Imprimir os meses do ano
    Log To Console     Mês 01: ${MESES_DO_ANO[0]}
    Log To Console     Mês 02: ${MESES_DO_ANO[1]}
    Log To Console     Mês 03: ${MESES_DO_ANO[2]}
    Log To Console     Mês 04: ${MESES_DO_ANO[3]}
    Log To Console     Mês 05: ${MESES_DO_ANO[4]}
    Log To Console     Mês 06: ${MESES_DO_ANO[5]}
    Log To Console     Mês 07: ${MESES_DO_ANO[6]}
    Log To Console     Mês 08: ${MESES_DO_ANO[7]}
    Log To Console     Mês 09: ${MESES_DO_ANO[8]}
    Log To Console     Mês 10: ${MESES_DO_ANO[9]}
    Log To Console     Mês 11: ${MESES_DO_ANO[10]}
    Log To Console     Mês 12: ${MESES_DO_ANO[11]}