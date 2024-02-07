*** Settings ***
Documentation  Essa suite testa o site da Amazon.com.br
Resource       amazon_resources.robot
Test Setup     Abrir o navegador
Test Teardown  Fechar o navegador 

*** test cases ***

 Caso de Teste 01 - Acesso ao menu "Livros"
    [Documentation]  Esse teste verifica o menu livros do site da amazon.com.br
    ...              e verificar a categoria Loja de Livros
    [Tags]           menus  categorias  
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Livros"
    Então o título da página deve ficar "Livros | Amazon.com.br"
    E o texto "Livros em Destaque" deve ser exibido na página
    E a categoria "Mais Vendidos" deve ser exibida na página

Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]  Esse teste verifica a busca de um produto
    [Tags]            busca_produtos  lista_busca
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Uma Lagarta Muito Comilona"
    Então o título da página deve ficar "Amazon.com.br : Uma Lagarta Muito Comilona"
    E um produto da linha "Uma Lagarta Muito Comilona" deve ser mostrado na página

Caso de Teste 03 - Adicionar Produto no Carrinho
      [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
      [Tags]             adicionar_carrinho
      Dado que estou na home page da Amazon.com.br
      Quando adicionar o produto "Uma Lagarta Muito Comilona" no carrinho
      Então o produto "Uma Lagarta Muito Comilona" deve ser mostrado no carrinho

Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras  
    [Tags]             remover_carrinho 
    Dado que estou na home page da Amazon.com.br
    E existe o produto "Uma Lagarta Muito Comilona" no carrinho
    Quando removo o produto "Uma Lagarta Muito Comilona" do carrinho
    Então o carrinho deve ficar vazio




    
  
 

  