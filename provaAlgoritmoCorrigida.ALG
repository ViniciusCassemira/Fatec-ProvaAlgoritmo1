Algoritmo "provaAlgoritmoCorrigida"
//Feito por Vinicius Cruz Cassemira
//Correções feitas

Var //declaração das variáveis

   //vetores referentes as informções dos produtos
   itemCodigo: vetor[1..7] de inteiro //codigo de identificação
   itemNome: vetor[1..7] de caractere //nome do produto
   itemQuantidade: vetor[1..7] de inteiro // quantidade no estoque
   itemPreco: vetor[1..7] de real // preço unitário

   //variáveis referentes as informações de venda
   pedidoItemQuantidade: vetor[1..7] de inteiro //itens adicionados no pedido
   varTempPedidoItemQuantidade: vetor[1..7] de inteiro //vetor complementar dos itens adicionados no pedido
   pedidoValor: real //guarda o sub-total do pedido
   pedidoValorTotal : real//guarda o valor total, incluindo o desconto caso tenha
   pedidoFeito : inteiro //seu valor muda quando a venda é feita, impede ir no recebimento sem concluir a venda
   pedidoMenu : inteiro //redireciona o usuário dentro do menu da área de venda
   pedidoItemAdicionado : inteiro //confere se algum produto foi adicionado ao carrinho
   itemEsgotado: inteiro //confere se o item está esgotado

   //variáveis referentes as informações do cliente
   clienteNome : caractere
   clienteTelefone : inteiro
   formaPagamento : inteiro

   //variáveis de controle e outras
   varTempCodigoProduto: inteiro //variável que armazena determinado dado temporáriamente
   i: inteiro //variável de controle
   opcaoMenu : inteiro //redireciona o usuário dentro do menu, armazena sua escolha
Inicio

   //declarando estoque da loja (nome, quantidade e preço)
   itemCodigo[1] <- 1
   itemNome[1] <- "Camiseta roxa"
   itemQuantidade[1] <- 5
   itemPreco[1] <- 35.90

   itemCodigo[2] <- 2
   itemNome[2] <- "Camiseta bege"
   itemQuantidade[2] <- 5
   itemPreco[2] <- 35.90

   itemCodigo[3] <- 3
   itemNome[3] <- "Camiseta Azul"
   itemQuantidade[3] <- 5
   itemPreco[3] <- 35.90

   itemCodigo[4] <- 4
   itemNome[4] <- "Bermuda Preta"
   itemQuantidade[4] <- 5
   itemPreco[4] <- 41.90

   itemCodigo[5] <- 5
   itemNome[5] <- "Calça legging"
   itemQuantidade[5] <- 5
   itemPreco[5] <- 79.90

   itemCodigo[6] <- 6
   itemNome[6] <- "Meia colorida"
   itemQuantidade[6] <- 5
   itemPreco[6] <- 17.90

   itemCodigo[7] <- 7
   itemNome[7] <- "Meia sapatilha"
   itemQuantidade[7] <- 5
   itemPreco[7] <- 21.90

   //declarando valor inicial de algumas variáveis (seus valores podem mudar)


   repita //vai repetir o menu ate a opção de sair(4) seja selecionada
      escreval("LOJA DO SHAOLIN MATADOR DE PORCO")
      escreval("[1] Ver Itens em Estoque")
      escreval("[2] Realizar Pedido")
      escreval("[3] Recebimento do Pedido")
      escreval("[4] Sair do Sistema")
      escreval("Sua opção: ")
      leia(opcaoMenu)

      //escolha caso deixa o código menor, muito útil nessa situação
      escolha (opcaoMenu)

         //mostra os itens do estoque
      caso 1
         limpatela()
         escreval("COD. | NOME | PREÇO UNIT. | QUANTIDADE")

         para i de 1 ate 7 faca //vai mostrar o estoque da loja e seus dados
            escreval(itemCodigo[i],"   | ",itemNome[i]," | ",itemPreco[i]," | ",itemQuantidade[i])
         fimpara
         escreval("")

         //realiza a venda do cliente coleta dados do cliente
      caso 2
         escolha (pedidoFeito)
            //caso nenhuma venda tenha sido concluída, ele vai realizar uma nova
         caso 0
            limpatela()
            escreval("PARA REALIZARMOS O SEU PEDIDO, PREENCHA SUAS INFORMAÇÕES")
            escreva("Nome:")
            leia(clienteNome)
            escreva("Telefone:")
            leia(clienteTelefone)
            limpatela()

            //repetir menu ate usuario escolher sair dele
            repita
               se(pedidoItemAdicionado = 0) entao

                  escreval("INFORMAÇÕES PREENCHIDAS COM SUCESSO!")
                  escreval("")
                  escreval("COD. | NOME | PREÇO UNIT. | QUANTIDADE")
                  para i de 1 ate 7 faca
                     escreval(itemCodigo[i],"   | ",itemNome[i]," | ",itemPreco[i]," | ",itemQuantidade[i])
                  fimpara

                  escreval("")

                  repita
                     escreval("CÓDIGO DO PRODUTO QUE VOCÊ DESEJA COMPRAR")
                     leia(varTempCodigoProduto)
                  ate (varTempCodigoProduto >=1) e (varTempCodigoProduto <= 7)

                  escreval("")

                  repita
                     escreval("DIGITE A QUANTIDADE DESEJADA: ")
                     leia(varTempPedidoItemQuantidade[varTempCodigoProduto])
                  ate (varTempPedidoItemQuantidade[varTempCodigoProduto] >=1) e (varTempPedidoItemQuantidade[varTempCodigoProduto] <= itemQuantidade[varTempCodigoProduto])

                  //valor da varTemp é passada para o vetor "principal" dos itens
                  //que foram adicionados no pedido
                  pedidoItemQuantidade[varTempCodigoProduto] <- pedidoItemQuantidade[varTempCodigoProduto] + varTempPedidoItemQuantidade[varTempCodigoProduto]

                  //descontamos o valor do estoque após o cliente adicionar no 'carrinho'
                  itemQuantidade[varTempCodigoProduto] <- itemQuantidade[varTempCodigoProduto] - pedidoItemQuantidade[varTempCodigoProduto]

                  //somamos no subtotal do pedido o valor dos itens selecionados
                  pedidoValor <- pedidoValor + (pedidoItemQuantidade[varTempCodigoProduto] * itemPreco[varTempCodigoProduto])

                  //soma da quantidade de itens adicionados no pedido
                  pedidoItemAdicionado <- pedidoItemAdicionado + pedidoItemQuantidade[varTempCodigoProduto]

                  limpatela()
                  //caso o cliente já tenha realizado uma adição ao carrinho
               senao
                  escreval("COD. | NOME | PREÇO UNIT. | QUANTIDADE")
                  para i de 1 ate 7 faca
                     escreval(itemCodigo[i],"   | ",itemNome[i]," | ",itemPreco[i]," | ",itemQuantidade[i])
                  fimpara
                  escreval("")

                  repita
                     escreval("ESCOLHA SUA OPÇÃO")
                     escreval("[1] Adicionar mais produtos")
                     escreval("[2] Finalizar compra")
                     leia(pedidoMenu)
                  ate(pedidoMenu = 1) ou (pedidoMenu =2)

                  escolha(pedidoMenu)
                     //caso ele queira adicionar mais itens
                  caso 1
                     limpatela()
                     escreval("COD. | NOME | PREÇO UNIT. | QUANTIDADE")
                     para i de 1 ate 7 faca
                        escreval(itemCodigo[i],"   | ",itemNome[i]," | ",itemPreco[i]," | ",itemQuantidade[i])
                     fimpara
                     escreval("")

                     repita //loop ocorre até usuário digitar um produto que estaja disponivel
                        repita //Força o cliente a escolher um codigo de item válido
                           escreval("CÓDIGO DO PRODUTO QUE VOCÊ DESEJA COMPRAR")
                           leia(varTempCodigoProduto)
                        ate(varTempCodigoProduto >= 1)e (varTempCodigoProduto <=7)

                        //caso a quantidade do item selecionado seja igual a zero
                        se(itemQuantidade[varTempCodigoProduto] = 0)entao
                           escreval("ITEM ESGOTADO")
                           itemEsgotado <- 1
                        senao//caso seja maior do que zero (produto disponível)
                           itemEsgotado <- 0
                        fimse
                     ate (itemEsgotado = 0)//fim laço de repetição -> inicio 166

                     escreval("")

                     repita
                        escreval("Digite a quantidade desejada: ")
                        leia(varTempPedidoItemQuantidade[varTempCodigoProduto])
                     ate (varTempPedidoItemQuantidade[varTempCodigoProduto] >=1) e (varTempPedidoItemQuantidade[varTempCodigoProduto] <= itemQuantidade[varTempCodigoProduto])

                     //atribuição das variáveis  varTemp com pedidoItemQuantidade
                     pedidoItemQuantidade[varTempCodigoProduto] <- pedidoItemQuantidade[varTempCodigoProduto] + varTempPedidoItemQuantidade[varTempCodigoProduto]

                     //descontamos o valor do estoque após o cliente adicionar no 'carrinho'
                     itemQuantidade[varTempCodigoProduto] <- itemQuantidade[varTempCodigoProduto] - varTempPedidoItemQuantidade[varTempCodigoProduto]

                     //somamos no subtotal do pedido o valor dos itens selecionados
                     pedidoValor <- pedidoValor + (varTempPedidoItemQuantidade[varTempCodigoProduto] * itemPreco[varTempCodigoProduto])

                     //soma da quantidade de itens adicionados no pedido
                     pedidoItemAdicionado <- pedidoItemAdicionado + varTempPedidoItemQuantidade[varTempCodigoProduto]
                     limpatela()
                     
                  caso 2
                     limpatela()
                     escreval("PEDIDO REALIZADO COM SUCESSO!")
                     escreval("AGORA FAÇA O RECEBIMENTO")
                     escreval("")
                     
                  outrocaso //caso o usuario digite outra opção
                     limpatela()
                  fimescolha

                  //vamos verificar se todos os itens foram vendidos
                  //caso eles tenham sido, o pedido é concluido automaticamente
                  se (pedidoItemAdicionado = 35) entao
                     escreval("TODOS OS ITENS EM NOSSO ESTOQUE FORAM VENDIDOS")
                     escreval("SEU PEDIDO FOI FINALIZADO AUTOMATICAMENTE!")
                     escreval("")
                     pedidoMenu <- 2 //declarando isso saímos do loop de venda
                  fimse
               fimse
            ate (pedidoMenu = 2)
            pedidoFeito <- 1

            //caso a venda já tenha sido feita, uma mensagem aparece
         caso 1
            limpatela()
            escreval("VOCÊ JÁ REALIZOU UM PEDIDO")
            escreval("")
         fimescolha

         //realiza o recebimento da venda SOMENTE se a venda for concluída
      caso 3
         escolha (pedidoFeito)
         caso 1

            limpatela()
            //definindo a forma de pagamento
            repita
               escreval("FORMA DE PAGAMENTO")
               escreval("[1] Dinheiro")
               escreval("[2] Cartão")
               leia(formaPagamento)
            ate(formaPagamento = 1) ou (formaPagamento = 2)

            //desconto de 10% caso seja com dinheiro
            se(formaPagamento = 1)entao
               pedidoValorTotal <- pedidoValor - (pedidoValor * 0.1)
            senao
               pedidoValorTotal <- pedidoValor
            fimse
            limpatela()

            //informações do cliente
            escreval("INFORMAÇÕES DO CLIENTE")
            escreval("Nome do cliente:",clienteNome)
            escreval("Número para contato:",clienteTelefone)
            escreval("")

            //informações dos produtos
            escreval("INFORMAÇÕES DOS PRODUTOS")
            escreval("Total de itens adicionados: ",pedidoItemAdicionado)
            para i de 1 ate 7 faca
               se(pedidoItemQuantidade[i] >= 1)entao
                  escreval("Produto:",itemNome[i]," | Quantidade:",pedidoItemQuantidade[i]," | Valor: R$",pedidoItemQuantidade[i] * itemPreco[i])
               senao
               fimse
            fimpara
            escreval()

            //informações do pedido
            escreval("INFORMAÇÕES DO PEDIDO")
            escreval("Sub-total: R$",pedidoValor)
            escreval("Valor total: R$",pedidoValorTotal)
            escreval("")

         caso 0
            limpatela()
            escreval("REALIZE UM PEDIDO ANTES DE ACESSAR ESSA ÁREA")
            escreval("")
         fimescolha

         //caso o usuario deseja fechar o programa
      caso 4
         escreval("Até a próxima!")
      outrocaso
         limpatela()
      fimescolha
   ate(opcaoMenu = 4)
Fimalgoritmo