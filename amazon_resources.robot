
*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}                  https://www.amazon.com.br/
${PRODUTO}                //span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'Console Xbox Series S')]
${CARRINHO}                //span[@aria-hidden='true'][contains(.,'Carrinho')]
${imagem}                 //img[contains(@alt,'Console Xbox Series S')]
${excluir}               //input[contains(@title,'Excluir')]
${MENU_LIVROS}        //a[@href='/Livros/b/?ie=UTF8&node=6740748011&ref_=nav_cs_books'][contains(.,'Livros')]
${HEADER_LIVROS}     //h2[contains(.,'Loja de Livros')]
${TEXTO_HEADER_LIVROS}    Loja de Livros
${categoria}      //img[@src='https://m.media-amazon.com/images/G/32/br-books/2021/November/NewPage_BooksStore/Botoes_Menu/Pequeno/Botoes_19._CB650809174_.jpg']
${titulo}         Livros | Amazon.com.br

*** Keywords ***
 Abrir o navegador
  Open Browser    browser=chrome
  Maximize Browser Window
  
Fechar o navegador 
    Close Browser


                    #Caso de teste 01 - Acesso ao menu "Livros"



Acessar a home page do site Amazon.com.br
    Go To                            url=${URL}
    Wait Until Element Is Visible    locator=${MENU_LIVROS}

Entrar ao menu "Livros"
   Click Element    locator=${MENU_LIVROS}

Verificar se aparece a frase "Loja de Livros"
   Wait Until Page Contains    text=${TEXTO_HEADER_LIVROS}
   Wait Until Element Is Visible    locator=${HEADER_LIVROS}

Verificar se o titulo da pagina fica "Livros | Amazon.com.br"
   Title Should Be    title=${titulo}
    
Verificar se aparece a palavra "Livros em Oferta"
    Element Should Be Visible    locator=${categoria}



                    #Caso de teste 02 - Pesquisa de um Produto



Acessar a home page do site Amazon.com.br 
   Go To    url=${URL}

Digitar o nome de produto "${produto}" no campo de pesquisa
   Input Text    locator=twotabsearchtextbox    text=${produto}

Clicar no botão de Pesquisa
   Click Element    locator=nav-search-submit-button
   
Verificar o resultado da pesquisa se esta listando o produto "${Produto}" 
   Wait Until Element Is Visible    locator=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${Produto}')]

   

                 #ESSE CÓDIGO É A RESOLUÇÃO DO GHERKIN Caso de teste 02 - Pesquisa de um Produto



Dado que estou na home page da Amazon.com.br    
    Acessar a home page do site Amazon.com.br 

Quando pesquisar pelo produto "Xbox Series S"
  Digitar o nome de produto "Xbox Series S" no campo de pesquisa 
  Clicar no botão de Pesquisa 

E um produto da linha "Xbox Series S" deve ser mostrado na página
  Verificar o resultado da pesquisa se esta listando o produto "Console Xbox Series S"

             

                #Caso de Teste 03 - Adicionar Produto no Carrinho


               
Acessar a home page do site Amazon.com.br
    Go To    url=${URL} 

Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=Xbox Series S

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button

Adicionar o produto "Console Xbox Series S" no carrinho
    Click Image    locator=${imagem}
    Click Element    locator=add-to-cart-button
 
Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Wait Until Element Is Visible    locator=${CARRINHO}

                

                #Caso de Teste 04 - Remover Produto do Carrinho



Acessar a home page do site Amazon.com.br
    Go To    url=${URL} 

Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=Xbox Series S

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button

Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Wait Until Element Is Visible    locator=${PRODUTO} 

Adicionar o produto "Console Xbox Series S" no carrinho
    Click Image    locator=${imagem}
    Click Element    locator=add-to-cart-button
 
Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Wait Until Element Is Visible    locator=${CARRINHO}

Remover o produto "Console Xbox Series S" do carrinho
    Click Element    locator=${excluir}

Verificar se o carrinho fica vazio
  Wait Until Element Is Visible    locator=${CARRINHO}  



                #ESSE CÓDIGO É A RESOLUÇÃO DO GHERKIN Caso de Teste 04 - Remover Produto do Carrinho 



Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho

E existe o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

Quando remover o produto "Console Xbox Series S" do carrinho
    Remover o produto "Console Xbox Series S" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio





