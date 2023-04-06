# chat_trainee_challenge_04

https://dribbble.com/shots/19752905-Messenger-Dashboard

## Passo 0

De acordo com esse readme, crie as issues no github.  
Deve ser usado o mesmo fluxo de `commits`, `pull requests` e `merges` que nos desafios anteriores.

Deve ser usado linter da Flutterando.

O ato de procurar conteúdo, fica por sua conta.

Criatividade e apreço ao código, sempre são levados em conta.  
Análise os desafios anteriores, e tente assimilar o que pode ser reusado, principalmente os conceitos.  
Se atente aos detalhes de cada tarefa e seja perfeccionista quanto ao design.  
Embora o design mostre o chat e o profile diretamente "abertos", observe o Telegram. O chat só abre ao clicar na conversa e o profile só deve abrir quando clicar no nome do usuário na AppBar do chat.  
Se for implementar algo que não entenda/conheça, construa uma POC e entenda como funciona **ANTES** de implementar no projeto.

As camadas de Infra, External e Domain devem ter 100% de coverage.  
A camada de presenter, 1 Store deve ter 100% de coverage, caso tenha mais de 1 store, as outras não são necessárias testar.

Embora tenha 10 passos, podem tem muito mais que 10 issues, isso depende do quanto você vai separar as tarefas.  
"Um problema grande é a soma de problemas menores."

Não tenha pressa e foque na quantidade.

## Passo 1

Reveja o design system

Reveja se vai ser necessário alguma mudança.

Faça as alterações necessárias para suportar o layout do web.  
Se julgar necessário ter mais widgets, crie-os.

Dicas:

- Com base no `WidgetBook` adicione `Devices` para simular o tamanho do web.
- Talvez seja necessário receber propriedades para fora, para o web e o mobile poderem delimitar seus tamanhos e garantir o reuso.

## Passo 2

O Widget que foi feito com animação implícita.

Refaça com animação explícita.

## Passo 3

Fazer a alteração entre web e mobile.

Antes de codar de fato, procure pessoas que já tenham feito e colha opiniões, a partir do que foi ouvido, tome sua própria decisão.

Tendo tomado sua decisão, se precisar de algum código para essa "gerência/alteração", faça.

Dica:
  - Teste o Telegram Desktop, tem esse mesmo comportamento.

## Passo 4

Construa a tela do web com o suporte caso seja Mobile/Desktop

## Passo 5

Insira o `FlutterModular`, faça as alterações necessárias.

## Passo 5

Faça a alteração tema, tendo o switch entre claro e escuro.

Quanto ao tema claro, use a criatividade e faça um tema bonito.

Use `ValueNotifier` como reatividade.

## Passo 6

Faça o Fluxo de inserir uma task em Clean Arch(Flutterando)

Dicas:

- Desenhe o fluxo de acesso(qual classe acessa quem).
- Embora pareça muito diferente, grande parte, ja foi feito, só não se tinha essa percepção, ao analisar os desafios anteriores, algumas partes foram abordadas separadamente.

## Passo 7

Insira o firebase no projeto. 

## Passo 8

Substitua seu Datasource, para outro que utilize Firestore como fonte de dados.

Fazendo a inserção e consulta pelo Firestore.

## Passo 9

Na camada de presenter deve ser usado o Triple.

Refatore a reatividade feita no desafio 3.

## Passo 10
Bota esse chat para funcionar 😅  

Faça um Fluxo de Clean Arch sobre o envio e recebimento de mensagens. 

A parte de chat deve funcionar, servindo para de fato estabelecer um comunicação com um usuário. 

Sugestão:
  - Não é necessário realizar o login, use `userIDs` mockados, para você conseguir visualizar de ambos os lados
  - Faça um especie de `UserStore` que contenha apenas um id em seu estado.
  - Adicione um botão na `AppBar` que faça o `toggle`, entre usuários.
  - Sempre que o `ID` é atualizado, a tela pode se atualizar por completo.
  - Utilize esse `ID` para vincular a mensagem que vai ser enviada e exibir as mensagens do `lado certo`.  
  - Seria interessante que as `tarefas` fossem vinculadas com esse mesmo `ID` rs.
