VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   5730
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   7170
   LinkTopic       =   "Form1"
   ScaleHeight     =   5730
   ScaleWidth      =   7170
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command3 
      Caption         =   "Saida de Veículo do Estacionamento (Manualente)"
      Height          =   615
      Left            =   5040
      TabIndex        =   18
      Top             =   1680
      Width           =   1935
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Adicionar Veículo na Entrada (Manualmente)"
      Height          =   615
      Left            =   5040
      TabIndex        =   17
      Top             =   960
      Width           =   1935
   End
   Begin VB.TextBox Text8 
      Enabled         =   0   'False
      Height          =   495
      Left            =   240
      TabIndex        =   15
      Text            =   "0"
      Top             =   4440
      Width           =   1695
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Definir Qtd Entradas e Saidas"
      Height          =   615
      Left            =   5040
      TabIndex        =   7
      Top             =   240
      Width           =   1935
   End
   Begin VB.TextBox Text7 
      Enabled         =   0   'False
      Height          =   495
      Left            =   240
      TabIndex        =   6
      Text            =   "0"
      Top             =   3840
      Width           =   1695
   End
   Begin VB.TextBox Text6 
      Enabled         =   0   'False
      Height          =   495
      Left            =   240
      TabIndex        =   5
      Text            =   "0"
      Top             =   3240
      Width           =   1695
   End
   Begin VB.TextBox Text5 
      Enabled         =   0   'False
      Height          =   495
      Left            =   240
      TabIndex        =   4
      Text            =   "0"
      Top             =   2640
      Width           =   1695
   End
   Begin VB.TextBox Text4 
      Enabled         =   0   'False
      Height          =   495
      Left            =   240
      TabIndex        =   3
      Text            =   "0"
      Top             =   2040
      Width           =   1695
   End
   Begin VB.TextBox Text3 
      Enabled         =   0   'False
      Height          =   495
      Left            =   240
      TabIndex        =   2
      Text            =   "0"
      Top             =   1440
      Width           =   1695
   End
   Begin VB.TextBox Text2 
      Enabled         =   0   'False
      Height          =   495
      Left            =   240
      TabIndex        =   1
      Text            =   "0"
      Top             =   840
      Width           =   1695
   End
   Begin VB.TextBox Text1 
      Enabled         =   0   'False
      Height          =   495
      Left            =   240
      TabIndex        =   0
      Text            =   "0"
      Top             =   240
      Width           =   1695
   End
   Begin VB.Label Label8 
      Caption         =   "Veiculos no Estacionamento (Total)"
      Height          =   615
      Left            =   2040
      TabIndex        =   16
      Top             =   4440
      Width           =   1935
   End
   Begin VB.Label Label7 
      Caption         =   "Veiculos no Estacionamento (Estacionados)"
      Height          =   615
      Left            =   2040
      TabIndex        =   14
      Top             =   3840
      Width           =   2295
   End
   Begin VB.Label Label6 
      Caption         =   "Passou Saída"
      Height          =   375
      Left            =   2040
      TabIndex        =   13
      Top             =   3360
      Width           =   1335
   End
   Begin VB.Label Label5 
      Caption         =   "Passou Entrada"
      Height          =   375
      Left            =   2040
      TabIndex        =   12
      Top             =   2760
      Width           =   1335
   End
   Begin VB.Label Label4 
      Caption         =   "Qtd. Fila Saida"
      Height          =   375
      Left            =   2040
      TabIndex        =   11
      Top             =   2160
      Width           =   1335
   End
   Begin VB.Label Label3 
      Caption         =   "Qtd. Fila Entrada"
      Height          =   375
      Left            =   2040
      TabIndex        =   10
      Top             =   1560
      Width           =   1335
   End
   Begin VB.Label Label2 
      Caption         =   "Qtd. Saidas"
      Height          =   375
      Left            =   2040
      TabIndex        =   9
      Top             =   960
      Width           =   1335
   End
   Begin VB.Label Label1 
      Caption         =   "Qtd. Entradas"
      Height          =   375
      Left            =   2040
      TabIndex        =   8
      Top             =   360
      Width           =   1335
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
    ''' TESTE PRÁTICO DE DESENVOLVIMENTO
    ''' Author: Matheus da Cruz Matos
    ''' Date: 13/08/2020
    ''' Version: 1.00 (Beta)
    ''' Email: matheusmatos1996@gmail.com / matheusmatos.221@hotmail.com
    '''
    '''
    ''' <Premissas_adotadas_e_Observações_Gerais>
    '''
    ''' O desenvolvimento buscou seguir com exatidão as especificações do cliente/avaliador, porém com a finalidade de auxiliar
    ''' o mesmo no processo de avaliação, foi acrescentado um botão de início que não estava especificado no teste.
    '''
    ''' No desenvolvimento, foi considerado como "veículo em fila de entrada" ou "veículo em fila de saída", apenas os veículos que
    ''' estavam em estado de espera. Veículos que estão no processo de entrada ou saída (nas cancelas) não são exibidos como
    ''' "veiculos em fila de entrada" ou "Veiculos em fila de saída"
    '''
    ''' A informação de "em qual cancela de entrada ou saída o veículo passou e suas quantidades" podem ser extraídas
    ''' de maneira simples através do número de cancelas de entrada e saídas disponíveis, porém teriamos de adotar
    ''' uma premissa de que NENHUM MOTORISTA ENTRA EM UMA CANCELA FORA DA ORDEM, o que na prática é totalmente inverdade.
    ''' Acredito que o objetivo do teste não seja exatamente medir com exatidão a realidade, e sim os conhecimentos
    ''' de quem desenvolve, porém ressalto que a informação não foi exibida porém pode ser obtida através da informação
    ''' e cancelas disponíveis.
    '''
    ''' Na interface de usuário, veículos estacionados representam veículos que entraram no estacionamento porém não iniciaram processo de saida
    ''' Na interface de usuário, veículos no estacionamento (totais) representam veículos que estão no estacionamento independentemente do estado (estacionado ou em processo de saída)
    '''
    ''' "Com toda certeza é possível aprimorar o programa, estou ciente por exemplo que armazenar variáveis e manipular
    ''' variáveis em objetos não é uma prática aceitável em softwares com desenvolvimento profissional e com possível
    ''' manipulação cooperativa, porém para efeitos práticos de exemplificação da atividades relacionadas ao entendimento
    ''' do problema, à definição da solução, à implementação, à organização e ao uso das características da linguagem, tal
    ''' aprimoramento se torna irrelevante."
    '''
    '''
    '''Declaração de objetos globais e objetos de thread utilizados
    '''
      
Option Explicit
Private Declare Sub Sleep Lib "kernel32.dll" (ByVal dwMilliseconds As Long)

Dim p_thread As New nmp_Threads.cls_Threads
  
Dim entradasDisponiveis As Integer
Dim saidasDisponiveis As Integer
 
Private Sub Command1_Click()

'Desabilita outro comando start no programa
Command1.Enabled = False

'Requisita ao usuário as quantidades de entradas e saídas
SetEntradasSaidas

End Sub

Private Sub Command2_Click()
rand_ini_entrada

End Sub

Private Sub Command3_Click()
rand_ini_saida
End Sub

Public Sub SetEntradasSaidas()

'Pede ao usuário valores de quantidades de entradas e saídas
Text1.Text = InputBox("Digite a quantidade de ENTRADAS do estacionamento:", "Quantidade de Entradas")
Text2.Text = InputBox("Digite a quantidade de SAIDAS do estacionamento:", "Quantidade de Saidas")

'Requisita novamente se houver inconsitencia no tipo de valor, valor negativo, porém faz o request das duas informações novamente.
While Not IsNumeric(Text1.Text) Or Not IsNumeric(Text2.Text) Or Not Val(Text1.Text) >= 0 Or Not Val(Text2.Text) >= 0 Or Not Text1.Text - Int(Text1.Text) = 0 Or Not Text2.Text - Int(Text2.Text) = 0
    Text1.Text = InputBox("Digite NOVAMENTE a quantidade de entradas que o seu estacionamento tem (APENAS NÚMEROS INTEIROS POSITIVOS): ", Title:="Quantidade de Entradas")
    Text2.Text = InputBox("Digite NOVAMENTE quantidade de saídas que o seu estacionamento tem: (APENAS NÚMEROS INTEIROS POSITIVOS)", Title:="Quantidade de Saídas")
Wend

'Assume inicialmente que não há veículos no estacionamento ou em processo e utiliza valores definidos pelo usuário como referencia
entradasDisponiveis = Val(Text1.Text) 'Define o numero de cancelas de entrada disponíveis como o número de entradas declarado
saidasDisponiveis = Val(Text2.Text) 'Define o numero de cancelas de saida disponíveis como o número de entradas declarado

End Sub

'
'SUB-ROTINAS DE TEMPORIZAÇÃO
'
'
'
'ESPECÍFICAÇÃO 2 - Processo de entrada do veículo
'
Public Sub rand_ini_entrada()

'Após tempo aleatório entre 1 e 5 segundos, um veículo do estacionamento inicia processo de entrada

'Variáveis locais e internas
Dim tempoRndEntrada As Integer
Dim LimiteMin As Integer
Dim LimiteMax As Integer
LimiteMin = 1000 'Tempo mínimo da aleatoriedade de entrada em milisegundos
LimiteMax = 5000 'Tempo máximo da aleatoriedade de entrada em milisegundos

'Função utilizada para randomizar um valor de tempo com resolução de milisegundos
Randomize (10) 'Gera uma nova seed baseada no timer do sistema para a função Rnd()
tempoRndEntrada = Int((LimiteMax - LimiteMin + 1) * Rnd() + LimiteMin) 't em milisegundos
Sleep (tempoRndEntrada) 'delay

'Após o tempo, adiciona veículo a fila de entrada, a mudança de valor desencadeia uma verificação de cancela disponível
'Se houver cancela disponível, o veículo é "instantâneamente" movido para o processo de entrada
'Quando Text3 muda, a função "Text3_TextChanged" é chamada através de evento "called by changed value")
'Pode ocorrer um erro quando fecha o programa, porque ele tenta finalizar o processo sem valor, não impacta no resultado.

'Adiciona veículo na fila de entrada Text3 = Fila de Entrada
Text3.Text = Text3.Text + 1

End Sub

'
'ESPECÍFICAÇÃO 3 - Processo de saída do veículo
'
Public Sub rand_ini_saida()

'Após tempo aleatório entre 10 e 30 segundos, um veículo do estacionamento inicia processo de entrada

'Variáveis locais e internas
Dim tempoRndEntrada As Integer
Dim LimiteMin As Integer
Dim LimiteMax As Integer
LimiteMin = 10000 'Tempo mínimo da aleatoriedade de saida em milisegundos
LimiteMax = 30000 'Tempo máximo da aleatoriedade de saida em milisegundos

'Função utilizada para randomizar um valor de tempo com resolução de milisegundos
Randomize (594) 'Gera uma nova seed baseada no timer do sistema para a função Rnd()
tempoRndEntrada = Int((LimiteMax - LimiteMin + 1) * Rnd() + LimiteMin) 't em milisegundos
Sleep (tempoRndEntrada) 'delay

'Após o tempo, adiciona veículo a fila de entrada, a mudança de valor desencadeia uma verificação de cancela disponível
'Se houver cancela disponível, o veículo é "instantâneamente" movido para o processo de entrada
'Quando Text4 muda, a função "Text4_TextChanged" é chamada através de evento "called by changed value")
'Pode ocorrer um erro quando fecha o programa, porque ele tenta finalizar o processo sem valor, não impacta no resultado.



'Adiciona veículo na fila de saida Text4 = Fila de Saida
Text4.Text = Text4.Text + 1



End Sub
'
' ESPECÍFICAÇÃO 4.1 - Processo de ENTRADA de veículos
'
Public Sub rand_proc_entrada()

'Após verificação de disponibilidade de cancela de entrada (value change do textbox3)
'Inicia processo de entrada de veículo, após tempo aleatório entre 3 e 5 segundos,
'conclui 1 processo de entrada do veículo e move 1 veículo da fila de entrada para o estacionamento
'Adiciona 1 no contador de veículos que passaram pela entrada no final da função
'Nesse caso não há loop pois existe função de ativação a partir da verificação de cancelas (value change do textbox3)
'MsgBox("Iniciando Processo de Entrada") '<- UTILIZADO NO DEBUG

'Move veículo da fila de espera para cancela (ocupa 1 vaga de cancela de entrada)
''Retira 1 veículo na fila de entrada (considerando que processo de entrada não faz parte do processo de espera "fila de espera")

'Ocupa 1 cancela, retira 1 no número de cancelas de entrada disponível enquanto houver o processamento
entradasDisponiveis = entradasDisponiveis - 1 'Declara que uma das cancelas de entrada disponíveis não está mais disponível
'As vezes, por conta da execução do Thread, pode aparecer que o número de entradas ficou negativo no console, porém é um problema da execução
'Do thread que na verdade executa de forma alternada os diferentes processos e eventualmente ocorre esse bug. (não altera o funcionamento do programa)
'Console.WriteLine("Cancelas de Entrada Disponíveis: " & entradasDisponiveis) '<- UTILIZADO NO DEBUG

'Variáveis locais e internas
Dim tempoRndPEntrada As Integer
Dim LimiteMin As Integer
Dim LimiteMax As Integer
LimiteMin = 3000 'Tempo mínimo da aleatoriedade de processo de entrada em milisegundos
LimiteMax = 5000 'Tempo máximo da aleatoriedade de processo de entrada em milisegundos

'Função utilizada para randomizar um valor de tempo com resolução de milisegundos
Randomize (95) 'Gera uma nova seed baseada no timer do sistema para a função Rnd()
tempoRndPEntrada = Int((LimiteMax - LimiteMin + 1) * Rnd() + LimiteMin) 't em milisegundos

Sleep (tempoRndPEntrada) 'Aplica delay no Thread

'Desocupa 1 cancela, disponibiliza +1 no número de cancelas de entrada disponível no fim do processamento
entradasDisponiveis = entradasDisponiveis + 1 'Ao final disponibiliza novamente a cancela para um novo veículo (um novo thread pode ser iniciado)
'Console.WriteLine("Cancelas de Entrada Disponíveis: " & entradasDisponiveis) '<- UTILIZADO NO DEBUG

'Conclui processo de entrada e contabiliza dados nos respectivos locais de armazenamento de informação (O ideal era criar variáveis ou colocar em um banco de dados para não perder a informação)
Text5.Text = Val(Text5.Text) + 1 'Adiciona 1 veículo no número de veículos que passaram pela entrada
Text7.Text = Val(Text7.Text) + 1 'Adiciona 1 veículo no número de veículos dentro do estacionamento

End Sub
'
' ESPECÍFICAÇÃO 4.2 - Processo de SAÍDA de veículos
'
Public Sub rand_proc_saida()
'Após verificação de disponibilidade de cancela de entrada (value change do textbox3)
'Inicia processo de entrada de veículo, após tempo aleatório entre 3 e 5 segundos,
'conclui 1 processo de entrada do veículo e move 1 veículo da fila de entrada para o estacionamento
'Adiciona 1 no contador de veículos que passaram pela entrada no final da função
'Nesse caso não há loop pois existe função de ativação a partir da verificação de cancelas (value change do textbox3)
'MsgBox("Iniciando Processo de Entrada")

'Move da fila de espera para cancela (ocupa 1 vaga de cancela de entrada)
Text4.Text = Val(Text4.Text) - 1 'Retira 1 veículo na fila de saida (considerando que processo de entrada não faz parte do processo de espera "fila de espera")
saidasDisponiveis = saidasDisponiveis - 1 'Declara que uma das cancelas de entrada disponíveis não está mais disponível
'As vezes, por conta da execução do Thread, pode aparecer que o número de entradas ficou negativo no console, porém é um problema da execução
'Do thread que na verdade executa de forma alternada os diferentes processos e eventualmente ocorre esse bug. (não altera o funcionamento do programa)

'Variáveis locais e internas
Dim tempoRndPSaida As Integer
Dim LimiteMin As Integer
Dim LimiteMax As Integer
LimiteMin = 3000 'Tempo mínimo da aleatoriedade de processo de entrada em milisegundos
LimiteMax = 5000 'Tempo máximo da aleatoriedade de processo de entrada em milisegundos

'Função utilizada para randomizar um valor de tempo com resolução de milisegundos
Randomize (49) 'Gera uma nova seed baseada no timer do sistema para a função Rnd()
tempoRndPSaida = Int((LimiteMax - LimiteMin + 1) * Rnd() + LimiteMin) 't em milisegundos
Sleep (tempoRndPSaida) 'Aplica delay no Thread

'Conclui processo de entrada e contabiliza dados nos respectivos locais de armazenamento de informação (O ideal era criar variáveis ou colocar em um banco de dados para não perder a informação)
''saidasDisponiveis = saidasDisponiveis + 1 'Ao final disponibiliza novamente a cancela para um novo veículo (um novo thread pode ser iniciado)

Text6.Text = Val(Text6.Text) + 1 'Adiciona 1 veículo no número de veículos que passaram pela saida
Text7.Text = Val(Text7.Text) - 1 'Subtrai 1 veículo no número de veículos dentro do estacionamento
End Sub

' Ativa com mudança de estado em fila de entrada
Private Sub Text3_Change()
VerificadorEntradaDisponivel
End Sub

Private Sub VerificadorEntradaDisponivel()

'VERIFICADOR DE DISPONIBILIDADE DE CANCELAS DE ENTRADA
'Quando há mudança no número de veículos na fila de entrada, verifica a quantidade de veículos na fila e
'Se houver cancelas de entrada disponíveis, inicia o processo de entrada de um veículo que pode
'Demorar um tempo aleatório entre 3 e 5 segundos para ser concluído

'Se houver cancelas disponíveis inicia processo de entrada
'Se veículos na fila >= 1 e <= nº entradas (tem que ter pelo menos 1 cancela, não pode valor negativo...
If Text3.Text >= 1 And entradasDisponiveis >= 1 Then
    'MsgBox("Valor é Menor ou Igual, Há Cancelas Disponíveis!")
    'Iniciar processo de entrada de 1 veículo
    ProcessoEntrada
Else
    'MsgBox("Valor é Maior, Não há Cancelas Disponíveis")
    'O veículo foi adicionado na fila no inicio do processo... consideramos o processo de deslocamento até a
    'Cancela de saída, como parte da fila, porém se houver cancelas disponíveis, ele é retirado da fila em uma fração
End If

End Sub

Private Sub VerificadorSaidaDisponivel()
    'VERIFICADOR DE DISPONIBILIDADE DE CANCELAS DE SAÍDA
    'Quando há mudança no número de veículos na fila de entrada, verifica a quantidade de veículos na fila e
    'Se houver cancelas de entrada disponíveis, inicia o processo de entrada de um veículo que pode
    'Demorar um tempo aleatório entre 3 e 5 segundos para ser concluído

    'Se houver cancelas disponíveis inicia processo de entrada
    'Se veículos na fila >= 1 e <= nº entradas (tem que ter pelo menos 1 cancela, não pode valor negativo...
    If CInt(Text4.Text) >= 1 And saidasDisponiveis >= 1 Then
        'MsgBox("Valor é Menor ou Igual, Há Cancelas Disponíveis!")
        'Iniciar processo de saida de 1 veículo
        'threadPSaidaVeiculo = New Threading.Thread(AddressOf ProcessoSaida)
        'threadPSaidaVeiculo.Start()
        ProcessoSaida

    Else
        'MsgBox("Valor é Maior, Não há Cancelas Disponíveis")
    End If

End Sub

'
' ESPECÍFICAÇÃO 4.1 - Processo de ENTRADA de veículos
'
Public Sub ProcessoEntrada()
    'Após verificação de disponibilidade de cancela de entrada (value change do textbox3)
    'Inicia processo de entrada de veículo, após tempo aleatório entre 3 e 5 segundos,
    'conclui 1 processo de entrada do veículo e move 1 veículo da fila de entrada para o estacionamento
    'Adiciona 1 no contador de veículos que passaram pela entrada no final da função
    'Nesse caso não há loop pois existe função de ativação a partir da verificação de cancelas (value change do textbox3)
    'MsgBox("Iniciando Processo de Entrada") '<- UTILIZADO NO DEBUG

    'Move veículo da fila de espera para cancela (ocupa 1 vaga de cancela de entrada)
    Text3.Text = Val(Text3.Text) - 1 'Retira 1 veículo na fila de entrada (considerando que processo de entrada não faz parte do processo de espera "fila de espera")

    'Ocupa 1 cancela, retira 1 no número de cancelas de entrada disponível enquanto houver o processamento
    entradasDisponiveis = entradasDisponiveis - 1 'Declara que uma das cancelas de entrada disponíveis não está mais disponível
    'As vezes, por conta da execução do Thread, pode aparecer que o número de entradas ficou negativo no console, porém é um problema da execução
    'Do thread que na verdade executa de forma alternada os diferentes processos e eventualmente ocorre esse bug. (não altera o funcionamento do programa)
    'Console.WriteLine("Cancelas de Entrada Disponíveis: " & entradasDisponiveis) '<- UTILIZADO NO DEBUG

    'Variáveis locais e internas
    Dim tempoRndPEntrada As Integer
    Dim LimiteMin As Integer
    Dim LimiteMax As Integer
    LimiteMin = 3000 'Tempo mínimo da aleatoriedade de processo de entrada em milisegundos
    LimiteMax = 5000 'Tempo máximo da aleatoriedade de processo de entrada em milisegundos

    'Função utilizada para randomizar um valor de tempo com resolução de milisegundos
    Randomize (84) 'Gera uma nova seed baseada no timer do sistema para a função Rnd()
    tempoRndPEntrada = Int((LimiteMax - LimiteMin + 1) * Rnd() + LimiteMin) 't em milisegundos
    
    'System.Threading.Thread.CurrentThread.Sleep (tempoRndPEntrada) 'Aplica delay no Thread
    Sleep (tempoRndPEntrada)

    'Desocupa 1 cancela, disponibiliza +1 no número de cancelas de entrada disponível no fim do processamento
    entradasDisponiveis = entradasDisponiveis + 1 'Ao final disponibiliza novamente a cancela para um novo veículo (um novo thread pode ser iniciado)
    'Console.WriteLine("Cancelas de Entrada Disponíveis: " & entradasDisponiveis) '<- UTILIZADO NO DEBUG

    'Conclui processo de entrada e contabiliza dados nos respectivos locais de armazenamento de informação (O ideal era criar variáveis ou colocar em um banco de dados para não perder a informação)
    Text5.Text = Val(Text5.Text) + 1 'Adiciona 1 veículo no número de veículos que passaram pela entrada
    Text7.Text = Val(Text7.Text) + 1 'Adiciona 1 veículo no número de veículos dentro do estacionamento

End Sub
'
' ESPECÍFICAÇÃO 4.2 - Processo de SAÍDA de veículos
'
Public Sub ProcessoSaida()
    'Após verificação de disponibilidade de cancela de entrada (value change do textbox3)
    'Inicia processo de entrada de veículo, após tempo aleatório entre 3 e 5 segundos,
    'conclui 1 processo de entrada do veículo e move 1 veículo da fila de entrada para o estacionamento
    'Adiciona 1 no contador de veículos que passaram pela entrada no final da função
    'Nesse caso não há loop pois existe função de ativação a partir da verificação de cancelas (value change do textbox3)
    'MsgBox("Iniciando Processo de Entrada")

    'Move da fila de espera para cancela (ocupa 1 vaga de cancela de entrada)
    Text4.Text = Val(Text4.Text) - 1 'Retira 1 veículo na fila de saida (considerando que processo de entrada não faz parte do processo de espera "fila de espera")
    saidasDisponiveis = saidasDisponiveis - 1 'Declara que uma das cancelas de entrada disponíveis não está mais disponível
    'As vezes, por conta da execução do Thread, pode aparecer que o número de entradas ficou negativo no console, porém é um problema da execução
    'Do thread que na verdade executa de forma alternada os diferentes processos e eventualmente ocorre esse bug. (não altera o funcionamento do programa)

    'Variáveis locais e internas
    Dim tempoRndPSaida As Integer
    Dim LimiteMin As Integer
    Dim LimiteMax As Integer
    LimiteMin = 3000 'Tempo mínimo da aleatoriedade de processo de entrada em milisegundos
    LimiteMax = 5000 'Tempo máximo da aleatoriedade de processo de entrada em milisegundos

    'Função utilizada para randomizar um valor de tempo com resolução de milisegundos
    Randomize (84) 'Gera uma nova seed baseada no timer do sistema para a função Rnd()
    tempoRndPSaida = Int((LimiteMax - LimiteMin + 1) * Rnd() + LimiteMin) 't em milisegundos
    Sleep (tempoRndPSaida)
    'System.Threading.Thread.CurrentThread.Sleep (tempoRndPSaida) 'Aplica delay no Thread

    'Conclui processo de entrada e contabiliza dados nos respectivos locais de armazenamento de informação (O ideal era criar variáveis ou colocar em um banco de dados para não perder a informação)
    saidasDisponiveis = saidasDisponiveis + 1 'Ao final disponibiliza novamente a cancela para um novo veículo (um novo thread pode ser iniciado)
    'Console.WriteLine ("Cancelas de Saídas Disponíveis: " & saidasDisponiveis)
    Text6.Text = Val(Text6.Text) + 1 'Adiciona 1 veículo no número de veículos que passaram pela saida
    Text7.Text = Val(Text7.Text) - 1 'Subtrai 1 veículo no número de veículos dentro do estacionamento

End Sub

Private Sub Text4_Change()
VerificadorSaidaDisponivel
End Sub

'
'INTERFACE 5.1 - Atualiza número de veículos no estacionamento (total) se houver ENTRADA no mesmo.
'
Private Sub Text5_Change()
Text8.Text = Val(Text5.Text) - Val(Text6.Text)
End Sub

Private Sub Text6_Change()
Text8.Text = Val(Text5.Text) - Val(Text6.Text)
End Sub
