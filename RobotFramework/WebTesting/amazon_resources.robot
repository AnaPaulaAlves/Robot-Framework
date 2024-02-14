*** Settings ***
Library      SeleniumLibrary


*** Variables ***
${BROWSER}               chrome
${URL}                   http://www.amazon.com.br
${MENU_LIVROS}           //a[@href='/Livros/b/?ie=UTF8&node=6740748011&ref_=nav_cs_books'][contains(.,'Livros')]
${HEADER_LIVROS}          (//span[contains(@class,'nav-a-content')])[5] 
${BTN_ADD_CARRINHO}     //input[@id='add-to-cart-button']
${CONFIRMANDO}          //span[contains(.,'Adicionado ao carrinho')]
${ADICIONADO_NO_CARRINHO}    (//span[@class='a-size-medium a-color-base a-text-normal'])[1]
${CARRINHO}                 nav-cart-count
${EXCLUIR_PRODUTO}           (//input[@class='a-button-input'])[1]
${CARRINHO_VAZIO}            //span[contains(@class,'nav-cart-icon nav-sprite')]
${LIVRO-LARG1}               (//span[contains(@class,'a-size-base-plus a-color-base a-text-normal')])[1] 
${ITEM-EXCLUIR}             //div[@class='a-section ewc-item-remove-msg']

*** Keywords ***
Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser  

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_LIVROS}

Entrar no menu "Livros"
    Click Element    locator=${MENU_LIVROS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains   text=${FRASE}
    Wait Until Element Is Visible     locator=${HEADER_LIVROS}


Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//a[contains(@aria-label,'${NOME_CATEGORIA}')]

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button

Verificar o resultado da pesquisa, se está listando o produto "${PRODUTO}" 
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO}')])[4]

Adicionar o produto "${PRODUTO}" no carrinho   
    Click Element    locator=${LIVRO-LARG1} 
    Wait Until Element Is Visible    locator=${BTN_ADD_CARRINHO} 
    Click Button    locator=${BTN_ADD_CARRINHO} 

Verificar se o produto "${PRODUTO}" foi adicionado com sucesso  
     Wait Until Element Is Visible    locator=${CONFIRMANDO}  

Remover o produto "Uma Lagarta Muito Comilona" do carrinho
    Click Element    locator=${EXCLUIR_PRODUTO} 


Verificar se o carrinho fica vazio  
    Wait Until Element Is Visible    locator=${CARRINHO_VAZIO} 

Verificar valor do carrinho 
    Wait Until Element Is Visible    locator=${ITEM-EXCLUIR}       


    # GHERKIN STEPS
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Livros"
     Entrar no menu "Livros"

Então o título da página deve ficar "Livros | Amazon.com.br" 
     Verificar se o título da página fica "Livros | Amazon.com.br"

E o texto "Livros em Destaque" deve ser exibido na página
    Verificar se aparece a frase "Livros em Oferta"

E a categoria "Mais Vendidos" deve ser exibida na página
    Verificar se aparece a categoria "Mais Vendidos"    

Quando pesquisar pelo produto "Uma Lagarta Muito Comilona" 
     Digitar o nome de produto "Uma Lagarta Muito Comilona" no campo de pesquisa
     Clicar no botão de pesquisa            
     
Então o título da página deve ficar "Amazon.com.br : Uma Lagarta Muito Comilona"
    Verificar se o título da página fica "Amazon.com.br : Uma Lagarta Muito Comilona"

E um produto da linha "Uma Lagarta Muito Comilona" deve ser mostrado na página
    Verificar o resultado da pesquisa, se está listando o produto "Uma Lagarta Muito Comilona" 

Quando adicionar o produto "Uma Lagarta Muito Comilona" no carrinho
     Digitar o nome de produto "Uma Lagarta Muito Comilona" no campo de pesquisa
     Clicar no botão de pesquisa  
     Verificar o resultado da pesquisa, se está listando o produto "Uma Lagarta Muito Comilona"
     Adicionar o produto "Uma Lagarta Muito Comilona" no carrinho

Então o produto "Uma Lagarta Muito Comilona" deve ser mostrado no carrinho
    Verificar se o produto "Uma Lagarta Muito Comilona" foi adicionado com sucesso

E existe o produto "Uma Lagarta Muito Comilona" no carrinho
    Quando adicionar o produto "Uma Lagarta Muito Comilona" no carrinho
    Então o produto "Uma Lagarta Muito Comilona" deve ser mostrado no carrinho

Quando removo o produto "Uma Lagarta Muito Comilona" do carrinho
    Remover o produto "Uma Lagarta Muito Comilona" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio   
              

    
     

     
       
    

    

       
                                         