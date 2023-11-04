*** Settings ***
# [Documentation]    essa suíte testa o site da amazon
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***

Caso de teste 01 - Acesso ao menu "Livros"
  [Documentation]   este teste verifica o menu Livros da amazon.com.br
  [Tags]            menu    categorias    
    Acessar a home page do site Amazon.com.br
    Entrar ao menu "Livros" 
    Verificar se aparece a frase "Loja de Livros"
    Verificar se o titulo da pagina fica "Livros | Amazon.com.br" 
    Verificar se aparece a palavra "Livros em Oferta"
   

Caso de teste 02 - Pesquisa de um Produto
  [Documentation]   este teste pesquisa os produtos
  [Tags]            buscar_prudutos   lista_busca
  Acessar a home page do site Amazon.com.br 
  Digitar o nome de produto "Xbox Series S" no campo de pesquisa 
  Clicar no botão de Pesquisa
  Verificar o resultado da pesquisa se esta listando o produto "Console Xbox Series S"

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Acessar a home page do site Amazon.com.br 
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa 
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S" 
    Adicionar o produto "Console Xbox Series S" no carrinho  
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

 
Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Remover o produto "Console Xbox Series S" do carrinho
    Verificar se o carrinho fica vazio 



