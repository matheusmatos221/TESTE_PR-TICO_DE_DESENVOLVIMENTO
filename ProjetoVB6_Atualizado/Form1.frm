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
      Caption         =   "Saida de Ve�culo do Estacionamento (Manualente)"
      Height          =   615
      Left            =   5040
      TabIndex        =   18
      Top             =   1680
      Width           =   1935
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Adicionar Ve�culo na Entrada (Manualmente)"
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
      Caption         =   "Passou Sa�da"
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
    ''' TESTE PR�TICO DE DESENVOLVIMENTO
    ''' Author: Matheus da Cruz Matos
    ''' Date: 13/08/2020
    ''' Version: 1.00 (Beta)
    ''' Email: matheusmatos1996@gmail.com / matheusmatos.221@hotmail.com
    '''
    '''
    ''' <Premissas_adotadas_e_Observa��es_Gerais>
    '''
    ''' O desenvolvimento buscou seguir com exatid�o as especifica��es do cliente/avaliador, por�m com a finalidade de auxiliar
    ''' o mesmo no processo de avalia��o, foi acrescentado um bot�o de in�cio que n�o estava especificado no teste.
    '''
    ''' No desenvolvimento, foi considerado como "ve�culo em fila de entrada" ou "ve�culo em fila de sa�da", apenas os ve�culos que
    ''' estavam em estado de espera. Ve�culos que est�o no processo de entrada ou sa�da (nas cancelas) n�o s�o exibidos como
    ''' "veiculos em fila de entrada" ou "Veiculos em fila de sa�da"
    '''
    ''' A informa��o de "em qual cancela de entrada ou sa�da o ve�culo passou e suas quantidades" podem ser extra�das
    ''' de maneira simples atrav�s do n�mero de cancelas de entrada e sa�das dispon�veis, por�m teriamos de adotar
    ''' uma premissa de que NENHUM MOTORISTA ENTRA EM UMA CANCELA FORA DA ORDEM, o que na pr�tica � totalmente inverdade.
    ''' Acredito que o objetivo do teste n�o seja exatamente medir com exatid�o a realidade, e sim os conhecimentos
    ''' de quem desenvolve, por�m ressalto que a informa��o n�o foi exibida por�m pode ser obtida atrav�s da informa��o
    ''' e cancelas dispon�veis.
    '''
    ''' Na interface de usu�rio, ve�culos estacionados representam ve�culos que entraram no estacionamento por�m n�o iniciaram processo de saida
    ''' Na interface de usu�rio, ve�culos no estacionamento (totais) representam ve�culos que est�o no estacionamento independentemente do estado (estacionado ou em processo de sa�da)
    '''
    ''' "Com toda certeza � poss�vel aprimorar o programa, estou ciente por exemplo que armazenar vari�veis e manipular
    ''' vari�veis em objetos n�o � uma pr�tica aceit�vel em softwares com desenvolvimento profissional e com poss�vel
    ''' manipula��o cooperativa, por�m para efeitos pr�ticos de exemplifica��o da atividades relacionadas ao entendimento
    ''' do problema, � defini��o da solu��o, � implementa��o, � organiza��o e ao uso das caracter�sticas da linguagem, tal
    ''' aprimoramento se torna irrelevante."
    '''
    '''
    '''Declara��o de objetos globais e objetos de thread utilizados
    '''
      
Option Explicit
Private Declare Sub Sleep Lib "kernel32.dll" (ByVal dwMilliseconds As Long)

Dim p_thread As New nmp_Threads.cls_Threads
  
Dim entradasDisponiveis As Integer
Dim saidasDisponiveis As Integer
 
Private Sub Command1_Click()

'Desabilita outro comando start no programa
Command1.Enabled = False

'Requisita ao usu�rio as quantidades de entradas e sa�das
SetEntradasSaidas

End Sub

Private Sub Command2_Click()
rand_ini_entrada

End Sub

Private Sub Command3_Click()
rand_ini_saida
End Sub

Public Sub SetEntradasSaidas()

'Pede ao usu�rio valores de quantidades de entradas e sa�das
Text1.Text = InputBox("Digite a quantidade de ENTRADAS do estacionamento:", "Quantidade de Entradas")
Text2.Text = InputBox("Digite a quantidade de SAIDAS do estacionamento:", "Quantidade de Saidas")

'Requisita novamente se houver inconsitencia no tipo de valor, valor negativo, por�m faz o request das duas informa��es novamente.
While Not IsNumeric(Text1.Text) Or Not IsNumeric(Text2.Text) Or Not Val(Text1.Text) >= 0 Or Not Val(Text2.Text) >= 0 Or Not Text1.Text - Int(Text1.Text) = 0 Or Not Text2.Text - Int(Text2.Text) = 0
    Text1.Text = InputBox("Digite NOVAMENTE a quantidade de entradas que o seu estacionamento tem (APENAS N�MEROS INTEIROS POSITIVOS): ", Title:="Quantidade de Entradas")
    Text2.Text = InputBox("Digite NOVAMENTE quantidade de sa�das que o seu estacionamento tem: (APENAS N�MEROS INTEIROS POSITIVOS)", Title:="Quantidade de Sa�das")
Wend

'Assume inicialmente que n�o h� ve�culos no estacionamento ou em processo e utiliza valores definidos pelo usu�rio como referencia
entradasDisponiveis = Val(Text1.Text) 'Define o numero de cancelas de entrada dispon�veis como o n�mero de entradas declarado
saidasDisponiveis = Val(Text2.Text) 'Define o numero de cancelas de saida dispon�veis como o n�mero de entradas declarado

End Sub

'
'SUB-ROTINAS DE TEMPORIZA��O
'
'
'
'ESPEC�FICA��O 2 - Processo de entrada do ve�culo
'
Public Sub rand_ini_entrada()

'Ap�s tempo aleat�rio entre 1 e 5 segundos, um ve�culo do estacionamento inicia processo de entrada

'Vari�veis locais e internas
Dim tempoRndEntrada As Integer
Dim LimiteMin As Integer
Dim LimiteMax As Integer
LimiteMin = 1000 'Tempo m�nimo da aleatoriedade de entrada em milisegundos
LimiteMax = 5000 'Tempo m�ximo da aleatoriedade de entrada em milisegundos

'Fun��o utilizada para randomizar um valor de tempo com resolu��o de milisegundos
Randomize (10) 'Gera uma nova seed baseada no timer do sistema para a fun��o Rnd()
tempoRndEntrada = Int((LimiteMax - LimiteMin + 1) * Rnd() + LimiteMin) 't em milisegundos
Sleep (tempoRndEntrada) 'delay

'Ap�s o tempo, adiciona ve�culo a fila de entrada, a mudan�a de valor desencadeia uma verifica��o de cancela dispon�vel
'Se houver cancela dispon�vel, o ve�culo � "instant�neamente" movido para o processo de entrada
'Quando Text3 muda, a fun��o "Text3_TextChanged" � chamada atrav�s de evento "called by changed value")
'Pode ocorrer um erro quando fecha o programa, porque ele tenta finalizar o processo sem valor, n�o impacta no resultado.

'Adiciona ve�culo na fila de entrada Text3 = Fila de Entrada
Text3.Text = Text3.Text + 1

End Sub

'
'ESPEC�FICA��O 3 - Processo de sa�da do ve�culo
'
Public Sub rand_ini_saida()

'Ap�s tempo aleat�rio entre 10 e 30 segundos, um ve�culo do estacionamento inicia processo de entrada

'Vari�veis locais e internas
Dim tempoRndEntrada As Integer
Dim LimiteMin As Integer
Dim LimiteMax As Integer
LimiteMin = 10000 'Tempo m�nimo da aleatoriedade de saida em milisegundos
LimiteMax = 30000 'Tempo m�ximo da aleatoriedade de saida em milisegundos

'Fun��o utilizada para randomizar um valor de tempo com resolu��o de milisegundos
Randomize (594) 'Gera uma nova seed baseada no timer do sistema para a fun��o Rnd()
tempoRndEntrada = Int((LimiteMax - LimiteMin + 1) * Rnd() + LimiteMin) 't em milisegundos
Sleep (tempoRndEntrada) 'delay

'Ap�s o tempo, adiciona ve�culo a fila de entrada, a mudan�a de valor desencadeia uma verifica��o de cancela dispon�vel
'Se houver cancela dispon�vel, o ve�culo � "instant�neamente" movido para o processo de entrada
'Quando Text4 muda, a fun��o "Text4_TextChanged" � chamada atrav�s de evento "called by changed value")
'Pode ocorrer um erro quando fecha o programa, porque ele tenta finalizar o processo sem valor, n�o impacta no resultado.



'Adiciona ve�culo na fila de saida Text4 = Fila de Saida
Text4.Text = Text4.Text + 1



End Sub
'
' ESPEC�FICA��O 4.1 - Processo de ENTRADA de ve�culos
'
Public Sub rand_proc_entrada()

'Ap�s verifica��o de disponibilidade de cancela de entrada (value change do textbox3)
'Inicia processo de entrada de ve�culo, ap�s tempo aleat�rio entre 3 e 5 segundos,
'conclui 1 processo de entrada do ve�culo e move 1 ve�culo da fila de entrada para o estacionamento
'Adiciona 1 no contador de ve�culos que passaram pela entrada no final da fun��o
'Nesse caso n�o h� loop pois existe fun��o de ativa��o a partir da verifica��o de cancelas (value change do textbox3)
'MsgBox("Iniciando Processo de Entrada") '<- UTILIZADO NO DEBUG

'Move ve�culo da fila de espera para cancela (ocupa 1 vaga de cancela de entrada)
''Retira 1 ve�culo na fila de entrada (considerando que processo de entrada n�o faz parte do processo de espera "fila de espera")

'Ocupa 1 cancela, retira 1 no n�mero de cancelas de entrada dispon�vel enquanto houver o processamento
entradasDisponiveis = entradasDisponiveis - 1 'Declara que uma das cancelas de entrada dispon�veis n�o est� mais dispon�vel
'As vezes, por conta da execu��o do Thread, pode aparecer que o n�mero de entradas ficou negativo no console, por�m � um problema da execu��o
'Do thread que na verdade executa de forma alternada os diferentes processos e eventualmente ocorre esse bug. (n�o altera o funcionamento do programa)
'Console.WriteLine("Cancelas de Entrada Dispon�veis: " & entradasDisponiveis) '<- UTILIZADO NO DEBUG

'Vari�veis locais e internas
Dim tempoRndPEntrada As Integer
Dim LimiteMin As Integer
Dim LimiteMax As Integer
LimiteMin = 3000 'Tempo m�nimo da aleatoriedade de processo de entrada em milisegundos
LimiteMax = 5000 'Tempo m�ximo da aleatoriedade de processo de entrada em milisegundos

'Fun��o utilizada para randomizar um valor de tempo com resolu��o de milisegundos
Randomize (95) 'Gera uma nova seed baseada no timer do sistema para a fun��o Rnd()
tempoRndPEntrada = Int((LimiteMax - LimiteMin + 1) * Rnd() + LimiteMin) 't em milisegundos

Sleep (tempoRndPEntrada) 'Aplica delay no Thread

'Desocupa 1 cancela, disponibiliza +1 no n�mero de cancelas de entrada dispon�vel no fim do processamento
entradasDisponiveis = entradasDisponiveis + 1 'Ao final disponibiliza novamente a cancela para um novo ve�culo (um novo thread pode ser iniciado)
'Console.WriteLine("Cancelas de Entrada Dispon�veis: " & entradasDisponiveis) '<- UTILIZADO NO DEBUG

'Conclui processo de entrada e contabiliza dados nos respectivos locais de armazenamento de informa��o (O ideal era criar vari�veis ou colocar em um banco de dados para n�o perder a informa��o)
Text5.Text = Val(Text5.Text) + 1 'Adiciona 1 ve�culo no n�mero de ve�culos que passaram pela entrada
Text7.Text = Val(Text7.Text) + 1 'Adiciona 1 ve�culo no n�mero de ve�culos dentro do estacionamento

End Sub
'
' ESPEC�FICA��O 4.2 - Processo de SA�DA de ve�culos
'
Public Sub rand_proc_saida()
'Ap�s verifica��o de disponibilidade de cancela de entrada (value change do textbox3)
'Inicia processo de entrada de ve�culo, ap�s tempo aleat�rio entre 3 e 5 segundos,
'conclui 1 processo de entrada do ve�culo e move 1 ve�culo da fila de entrada para o estacionamento
'Adiciona 1 no contador de ve�culos que passaram pela entrada no final da fun��o
'Nesse caso n�o h� loop pois existe fun��o de ativa��o a partir da verifica��o de cancelas (value change do textbox3)
'MsgBox("Iniciando Processo de Entrada")

'Move da fila de espera para cancela (ocupa 1 vaga de cancela de entrada)
Text4.Text = Val(Text4.Text) - 1 'Retira 1 ve�culo na fila de saida (considerando que processo de entrada n�o faz parte do processo de espera "fila de espera")
saidasDisponiveis = saidasDisponiveis - 1 'Declara que uma das cancelas de entrada dispon�veis n�o est� mais dispon�vel
'As vezes, por conta da execu��o do Thread, pode aparecer que o n�mero de entradas ficou negativo no console, por�m � um problema da execu��o
'Do thread que na verdade executa de forma alternada os diferentes processos e eventualmente ocorre esse bug. (n�o altera o funcionamento do programa)

'Vari�veis locais e internas
Dim tempoRndPSaida As Integer
Dim LimiteMin As Integer
Dim LimiteMax As Integer
LimiteMin = 3000 'Tempo m�nimo da aleatoriedade de processo de entrada em milisegundos
LimiteMax = 5000 'Tempo m�ximo da aleatoriedade de processo de entrada em milisegundos

'Fun��o utilizada para randomizar um valor de tempo com resolu��o de milisegundos
Randomize (49) 'Gera uma nova seed baseada no timer do sistema para a fun��o Rnd()
tempoRndPSaida = Int((LimiteMax - LimiteMin + 1) * Rnd() + LimiteMin) 't em milisegundos
Sleep (tempoRndPSaida) 'Aplica delay no Thread

'Conclui processo de entrada e contabiliza dados nos respectivos locais de armazenamento de informa��o (O ideal era criar vari�veis ou colocar em um banco de dados para n�o perder a informa��o)
''saidasDisponiveis = saidasDisponiveis + 1 'Ao final disponibiliza novamente a cancela para um novo ve�culo (um novo thread pode ser iniciado)

Text6.Text = Val(Text6.Text) + 1 'Adiciona 1 ve�culo no n�mero de ve�culos que passaram pela saida
Text7.Text = Val(Text7.Text) - 1 'Subtrai 1 ve�culo no n�mero de ve�culos dentro do estacionamento
End Sub

' Ativa com mudan�a de estado em fila de entrada
Private Sub Text3_Change()
VerificadorEntradaDisponivel
End Sub

Private Sub VerificadorEntradaDisponivel()

'VERIFICADOR DE DISPONIBILIDADE DE CANCELAS DE ENTRADA
'Quando h� mudan�a no n�mero de ve�culos na fila de entrada, verifica a quantidade de ve�culos na fila e
'Se houver cancelas de entrada dispon�veis, inicia o processo de entrada de um ve�culo que pode
'Demorar um tempo aleat�rio entre 3 e 5 segundos para ser conclu�do

'Se houver cancelas dispon�veis inicia processo de entrada
'Se ve�culos na fila >= 1 e <= n� entradas (tem que ter pelo menos 1 cancela, n�o pode valor negativo...
If Text3.Text >= 1 And entradasDisponiveis >= 1 Then
    'MsgBox("Valor � Menor ou Igual, H� Cancelas Dispon�veis!")
    'Iniciar processo de entrada de 1 ve�culo
    ProcessoEntrada
Else
    'MsgBox("Valor � Maior, N�o h� Cancelas Dispon�veis")
    'O ve�culo foi adicionado na fila no inicio do processo... consideramos o processo de deslocamento at� a
    'Cancela de sa�da, como parte da fila, por�m se houver cancelas dispon�veis, ele � retirado da fila em uma fra��o
End If

End Sub

Private Sub VerificadorSaidaDisponivel()
    'VERIFICADOR DE DISPONIBILIDADE DE CANCELAS DE SA�DA
    'Quando h� mudan�a no n�mero de ve�culos na fila de entrada, verifica a quantidade de ve�culos na fila e
    'Se houver cancelas de entrada dispon�veis, inicia o processo de entrada de um ve�culo que pode
    'Demorar um tempo aleat�rio entre 3 e 5 segundos para ser conclu�do

    'Se houver cancelas dispon�veis inicia processo de entrada
    'Se ve�culos na fila >= 1 e <= n� entradas (tem que ter pelo menos 1 cancela, n�o pode valor negativo...
    If CInt(Text4.Text) >= 1 And saidasDisponiveis >= 1 Then
        'MsgBox("Valor � Menor ou Igual, H� Cancelas Dispon�veis!")
        'Iniciar processo de saida de 1 ve�culo
        'threadPSaidaVeiculo = New Threading.Thread(AddressOf ProcessoSaida)
        'threadPSaidaVeiculo.Start()
        ProcessoSaida

    Else
        'MsgBox("Valor � Maior, N�o h� Cancelas Dispon�veis")
    End If

End Sub

'
' ESPEC�FICA��O 4.1 - Processo de ENTRADA de ve�culos
'
Public Sub ProcessoEntrada()
    'Ap�s verifica��o de disponibilidade de cancela de entrada (value change do textbox3)
    'Inicia processo de entrada de ve�culo, ap�s tempo aleat�rio entre 3 e 5 segundos,
    'conclui 1 processo de entrada do ve�culo e move 1 ve�culo da fila de entrada para o estacionamento
    'Adiciona 1 no contador de ve�culos que passaram pela entrada no final da fun��o
    'Nesse caso n�o h� loop pois existe fun��o de ativa��o a partir da verifica��o de cancelas (value change do textbox3)
    'MsgBox("Iniciando Processo de Entrada") '<- UTILIZADO NO DEBUG

    'Move ve�culo da fila de espera para cancela (ocupa 1 vaga de cancela de entrada)
    Text3.Text = Val(Text3.Text) - 1 'Retira 1 ve�culo na fila de entrada (considerando que processo de entrada n�o faz parte do processo de espera "fila de espera")

    'Ocupa 1 cancela, retira 1 no n�mero de cancelas de entrada dispon�vel enquanto houver o processamento
    entradasDisponiveis = entradasDisponiveis - 1 'Declara que uma das cancelas de entrada dispon�veis n�o est� mais dispon�vel
    'As vezes, por conta da execu��o do Thread, pode aparecer que o n�mero de entradas ficou negativo no console, por�m � um problema da execu��o
    'Do thread que na verdade executa de forma alternada os diferentes processos e eventualmente ocorre esse bug. (n�o altera o funcionamento do programa)
    'Console.WriteLine("Cancelas de Entrada Dispon�veis: " & entradasDisponiveis) '<- UTILIZADO NO DEBUG

    'Vari�veis locais e internas
    Dim tempoRndPEntrada As Integer
    Dim LimiteMin As Integer
    Dim LimiteMax As Integer
    LimiteMin = 3000 'Tempo m�nimo da aleatoriedade de processo de entrada em milisegundos
    LimiteMax = 5000 'Tempo m�ximo da aleatoriedade de processo de entrada em milisegundos

    'Fun��o utilizada para randomizar um valor de tempo com resolu��o de milisegundos
    Randomize (84) 'Gera uma nova seed baseada no timer do sistema para a fun��o Rnd()
    tempoRndPEntrada = Int((LimiteMax - LimiteMin + 1) * Rnd() + LimiteMin) 't em milisegundos
    
    'System.Threading.Thread.CurrentThread.Sleep (tempoRndPEntrada) 'Aplica delay no Thread
    Sleep (tempoRndPEntrada)

    'Desocupa 1 cancela, disponibiliza +1 no n�mero de cancelas de entrada dispon�vel no fim do processamento
    entradasDisponiveis = entradasDisponiveis + 1 'Ao final disponibiliza novamente a cancela para um novo ve�culo (um novo thread pode ser iniciado)
    'Console.WriteLine("Cancelas de Entrada Dispon�veis: " & entradasDisponiveis) '<- UTILIZADO NO DEBUG

    'Conclui processo de entrada e contabiliza dados nos respectivos locais de armazenamento de informa��o (O ideal era criar vari�veis ou colocar em um banco de dados para n�o perder a informa��o)
    Text5.Text = Val(Text5.Text) + 1 'Adiciona 1 ve�culo no n�mero de ve�culos que passaram pela entrada
    Text7.Text = Val(Text7.Text) + 1 'Adiciona 1 ve�culo no n�mero de ve�culos dentro do estacionamento

End Sub
'
' ESPEC�FICA��O 4.2 - Processo de SA�DA de ve�culos
'
Public Sub ProcessoSaida()
    'Ap�s verifica��o de disponibilidade de cancela de entrada (value change do textbox3)
    'Inicia processo de entrada de ve�culo, ap�s tempo aleat�rio entre 3 e 5 segundos,
    'conclui 1 processo de entrada do ve�culo e move 1 ve�culo da fila de entrada para o estacionamento
    'Adiciona 1 no contador de ve�culos que passaram pela entrada no final da fun��o
    'Nesse caso n�o h� loop pois existe fun��o de ativa��o a partir da verifica��o de cancelas (value change do textbox3)
    'MsgBox("Iniciando Processo de Entrada")

    'Move da fila de espera para cancela (ocupa 1 vaga de cancela de entrada)
    Text4.Text = Val(Text4.Text) - 1 'Retira 1 ve�culo na fila de saida (considerando que processo de entrada n�o faz parte do processo de espera "fila de espera")
    saidasDisponiveis = saidasDisponiveis - 1 'Declara que uma das cancelas de entrada dispon�veis n�o est� mais dispon�vel
    'As vezes, por conta da execu��o do Thread, pode aparecer que o n�mero de entradas ficou negativo no console, por�m � um problema da execu��o
    'Do thread que na verdade executa de forma alternada os diferentes processos e eventualmente ocorre esse bug. (n�o altera o funcionamento do programa)

    'Vari�veis locais e internas
    Dim tempoRndPSaida As Integer
    Dim LimiteMin As Integer
    Dim LimiteMax As Integer
    LimiteMin = 3000 'Tempo m�nimo da aleatoriedade de processo de entrada em milisegundos
    LimiteMax = 5000 'Tempo m�ximo da aleatoriedade de processo de entrada em milisegundos

    'Fun��o utilizada para randomizar um valor de tempo com resolu��o de milisegundos
    Randomize (84) 'Gera uma nova seed baseada no timer do sistema para a fun��o Rnd()
    tempoRndPSaida = Int((LimiteMax - LimiteMin + 1) * Rnd() + LimiteMin) 't em milisegundos
    Sleep (tempoRndPSaida)
    'System.Threading.Thread.CurrentThread.Sleep (tempoRndPSaida) 'Aplica delay no Thread

    'Conclui processo de entrada e contabiliza dados nos respectivos locais de armazenamento de informa��o (O ideal era criar vari�veis ou colocar em um banco de dados para n�o perder a informa��o)
    saidasDisponiveis = saidasDisponiveis + 1 'Ao final disponibiliza novamente a cancela para um novo ve�culo (um novo thread pode ser iniciado)
    'Console.WriteLine ("Cancelas de Sa�das Dispon�veis: " & saidasDisponiveis)
    Text6.Text = Val(Text6.Text) + 1 'Adiciona 1 ve�culo no n�mero de ve�culos que passaram pela saida
    Text7.Text = Val(Text7.Text) - 1 'Subtrai 1 ve�culo no n�mero de ve�culos dentro do estacionamento

End Sub

Private Sub Text4_Change()
VerificadorSaidaDisponivel
End Sub

'
'INTERFACE 5.1 - Atualiza n�mero de ve�culos no estacionamento (total) se houver ENTRADA no mesmo.
'
Private Sub Text5_Change()
Text8.Text = Val(Text5.Text) - Val(Text6.Text)
End Sub

Private Sub Text6_Change()
Text8.Text = Val(Text5.Text) - Val(Text6.Text)
End Sub
