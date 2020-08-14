VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   5265
   ClientLeft      =   2790
   ClientTop       =   1935
   ClientWidth     =   6765
   LinkTopic       =   "Form1"
   ScaleHeight     =   5265
   ScaleWidth      =   6765
   Begin VB.TextBox TextBox8 
      Enabled         =   0   'False
      Height          =   480
      Index           =   7
      Left            =   360
      TabIndex        =   8
      Text            =   "0"
      Top             =   4440
      Width           =   1320
   End
   Begin VB.TextBox TextBox7 
      Enabled         =   0   'False
      Height          =   480
      Index           =   6
      Left            =   360
      TabIndex        =   7
      Text            =   "0"
      Top             =   3840
      Width           =   1320
   End
   Begin VB.TextBox TextBox6 
      Enabled         =   0   'False
      Height          =   480
      Index           =   5
      Left            =   360
      TabIndex        =   6
      Text            =   "0"
      Top             =   3240
      Width           =   1320
   End
   Begin VB.TextBox TextBox5 
      Enabled         =   0   'False
      Height          =   480
      Index           =   4
      Left            =   360
      TabIndex        =   5
      Text            =   "0"
      Top             =   2640
      Width           =   1320
   End
   Begin VB.TextBox TextBox4 
      Enabled         =   0   'False
      Height          =   480
      Index           =   3
      Left            =   360
      TabIndex        =   4
      Text            =   "0"
      Top             =   2040
      Width           =   1320
   End
   Begin VB.TextBox TextBox3 
      Enabled         =   0   'False
      Height          =   480
      Index           =   2
      Left            =   360
      TabIndex        =   3
      Text            =   "0"
      Top             =   1440
      Width           =   1320
   End
   Begin VB.TextBox TextBox2 
      Enabled         =   0   'False
      Height          =   480
      Index           =   1
      Left            =   330
      TabIndex        =   2
      Text            =   "0"
      Top             =   870
      Width           =   1320
   End
   Begin VB.CommandButton Button1 
      Caption         =   "Iniciar"
      Height          =   465
      Left            =   5280
      TabIndex        =   1
      Top             =   360
      Width           =   1200
   End
   Begin VB.TextBox TextBox1 
      Enabled         =   0   'False
      Height          =   480
      Index           =   0
      Left            =   330
      TabIndex        =   0
      Text            =   "0"
      Top             =   255
      Width           =   1320
   End
   Begin VB.Label Label1 
      Caption         =   "Ve�culos no Estacionamento (Total)"
      Height          =   255
      Index           =   7
      Left            =   1800
      TabIndex        =   16
      Top             =   4560
      Width           =   3015
   End
   Begin VB.Label Label1 
      Caption         =   "Ve�culos no Estacionamento (Estacionados)"
      Height          =   255
      Index           =   6
      Left            =   1800
      TabIndex        =   15
      Top             =   3960
      Width           =   3135
   End
   Begin VB.Label Label1 
      Caption         =   "Ve�culos Passaram Sa�da"
      Height          =   255
      Index           =   5
      Left            =   1800
      TabIndex        =   14
      Top             =   3360
      Width           =   2295
   End
   Begin VB.Label Label1 
      Caption         =   "Ve�culos Passaram Entrada"
      Height          =   255
      Index           =   4
      Left            =   1800
      TabIndex        =   13
      Top             =   2760
      Width           =   2415
   End
   Begin VB.Label Label1 
      Caption         =   "Ve�culos Fila Sa�da"
      Height          =   255
      Index           =   3
      Left            =   1800
      TabIndex        =   12
      Top             =   2280
      Width           =   1695
   End
   Begin VB.Label Label1 
      Caption         =   "Ve�culos Fila Entrada"
      Height          =   255
      Index           =   2
      Left            =   1800
      TabIndex        =   11
      Top             =   1680
      Width           =   1935
   End
   Begin VB.Label Label1 
      Caption         =   "Qtd. Sa�das"
      Height          =   255
      Index           =   1
      Left            =   1800
      TabIndex        =   10
      Top             =   1080
      Width           =   1335
   End
   Begin VB.Label Label1 
      Caption         =   "Qtd. Entradas"
      Height          =   255
      Index           =   0
      Left            =   1800
      TabIndex        =   9
      Top             =   360
      Width           =   1335
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

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



'Dim threadContadorEntrada As Threading.Thread
'Dim threadContadorSaida As Threading.Thread
'Dim threadPEntradaVeiculo As Threading.Thread
'Dim threadPSaidaVeiculo As Threading.Thread

Dim threadContadorEntrada As clsThread
Dim threadContadorSaida As clsThread
Dim threadPEntradaVeiculo As clsThread
Dim threadPSaidaVeiculo As clsThread

Dim entradasDisponiveis As Integer
Dim saidasDisponiveis As Integer

Dim Txt1 As Integer
Dim Txt2 As Integer
Dim Txt3 As Integer
Dim Txt4 As Integer
Dim Txt5 As Integer
Dim Txt6 As Integer
Dim Txt7 As Integer
Dim Txt8 As Integer


'
'Bot�o de In�cio do Programa
'
Public Sub Button1_Click()

    'Desabilita outro start no programa
    Button1.Enabled = False

    'Pede ao usu�rio que insira as quantidades de entradas e sa�das do estacionamento
    SetEntradasSaidas

    'Inicia Thread de entrada (chegada de ve�culos a cada x quantidade de tempo, sendo x entre 1s e 5s)
    IniciarThreads

End Sub

'
'Evento de mudan�a de valor em "Veiculos na Fila de Entrada"
'

Public Sub TextBox3_Change(Index As Integer)

    VerificadorEntradaDisponivel

End Sub

'
'Evento de mudan�a de valor em "Veiculos na Fila de Sa�da"
'
Public Sub TextBox4_Change(Index As Integer)

    VerificadorSaidaDisponivel

End Sub
'
'Verifica Cancela de Entrada Dispon�vel (Fun��o)
'
Public Sub VerificadorEntradaDisponivel()

    'VERIFICADOR DE DISPONIBILIDADE DE CANCELAS DE ENTRADA
    'Quando h� mudan�a no n�mero de ve�culos na fila de entrada, verifica a quantidade de ve�culos na fila e
    'Se houver cancelas de entrada dispon�veis, inicia o processo de entrada de um ve�culo que pode
    'Demorar um tempo aleat�rio entre 3 e 5 segundos para ser conclu�do

    'Se houver cancelas dispon�veis inicia processo de entrada
    'Se ve�culos na fila >= 1 e <= n� entradas (tem que ter pelo menos 1 cancela, n�o pode valor negativo...
    If Form1.TextBox3.Item.Text >= 1 And entradasDisponiveis >= 1 Then
        'MsgBox("Valor � Menor ou Igual, H� Cancelas Dispon�veis!")
        'Iniciar processo de entrada de 1 ve�culo
        threadContadorEntrada
        threadPEntradaVeiculo = New Threading.Thread(AddressOf ProcessoEntrada)
        threadPEntradaVeiculo.Start()

    Else
        'MsgBox("Valor � Maior, N�o h� Cancelas Dispon�veis")
        'O ve�culo foi adicionado na fila no inicio do processo... consideramos o processo de deslocamento at� a
        'Cancela de sa�da, como parte da fila, por�m se houver cancelas dispon�veis, ele � retirado da fila em uma fra��o
    End If

End Sub
'
'Verifica Cancela de Sa�da Dispon�vel (Fun��o)
'
Public Sub VerificadorSaidaDisponivel()

    'VERIFICADOR DE DISPONIBILIDADE DE CANCELAS DE SA�DA
    'Quando h� mudan�a no n�mero de ve�culos na fila de entrada, verifica a quantidade de ve�culos na fila e
    'Se houver cancelas de entrada dispon�veis, inicia o processo de entrada de um ve�culo que pode
    'Demorar um tempo aleat�rio entre 3 e 5 segundos para ser conclu�do

    'Se houver cancelas dispon�veis inicia processo de entrada
    'Se ve�culos na fila >= 1 e <= n� entradas (tem que ter pelo menos 1 cancela, n�o pode valor negativo...
    If CInt(TextBox4.Text) >= 1 And saidasDisponiveis >= 1 Then
        'MsgBox("Valor � Menor ou Igual, H� Cancelas Dispon�veis!")
        'Iniciar processo de saida de 1 ve�culo
        ''threadPSaidaVeiculo = New Threading.Thread(AddressOf ProcessoSaida)
        ''threadPSaidaVeiculo.Start()

    Else
        'MsgBox("Valor � Maior, N�o h� Cancelas Dispon�veis")
    End If

End Sub
'
'Inicia Threads de processos de entrada e sa�da de ve�culos
'
Private Sub IniciarThreads()

    'Retira aviso de ilegalidade de "chamada de Thread em outra fun��o/m�todo"
    Control.CheckForIllegalCrossThreadCalls = False

    'Inicia contador aleat�rio de entrada (a cada x um ve�culo inicia processo de entrada, x entre 1s e 5s)
    Set threadContadorEntrada = CreateObject("Estacionamento_Teste.clsThread.IniciarEntrada")
    
    ''threadContadorEntrada = New Threading.Thread(AddressOf IniciarEntrada)
    ''threadContadorEntrada.Start()

    'Inicia contador aleat�rio de saida (a cada x um ve�culo inicia processo de saida, x entre 10s e 30s)
    ''threadContadorSaida = New Threading.Thread(AddressOf IniciarSaida)
    ''threadContadorSaida.Start()

End Sub
'
' ESPEC�FICA��O 1 - Usu�rio define quantidade de entradas e sa�das (n�mero de cancelas)
'
Public Sub SetEntradasSaidas()

    'Pede ao usu�rio valores de quantidade de entradas e sa�das
    TextBox1.Text = InputBox("Digite a quantidade de entradas que o seu estacionamento tem: ", Title:="Quantidade de Entradas", DefaultResponse:="3")
    TextBox2.Text = InputBox("Digite a quantidade de sa�das que o seu estacionamento tem: ", Title:="Quantidade de Sa�das", DefaultResponse:="3")

    'Requisita novamente se houver inconsitencia no tipo de valor, valor negativo, por�m faz o request das duas informa��es novamente.
    While Not IsNumeric(TextBox1.Text) Or Not IsNumeric(TextBox2.Text) Or Not Val(TextBox1.Text) >= 0 Or Not Val(TextBox2.Text) >= 0 Or Not TextBox1.Text - Int(TextBox1.Text) = 0 Or Not TextBox2.Text - Int(TextBox2.Text) = 0
        TextBox1.Text = InputBox("Digite NOVAMENTE a quantidade de entradas que o seu estacionamento tem (APENAS N�MEROS INTEIROS POSITIVOS): ", Title:="Quantidade de Entradas", DefaultResponse:="3")
        TextBox2.Text = InputBox("Digite NOVAMENTE quantidade de sa�das que o seu estacionamento tem: (APENAS N�MEROS INTEIROS POSITIVOS)", Title:="Quantidade de Sa�das", DefaultResponse:="3")
    Wend

    'Assume inicialmente que n�o h� ve�culos no estacionamento ou em processo e utiliza valores definidos pelo usu�rio como referencia
    entradasDisponiveis = Val(TextBox1.Text) 'Define o numero de cancelas de entrada dispon�veis como o n�mero de entradas declarado
    saidasDisponiveis = Val(TextBox2.Text) 'Define o numero de cancelas de saida dispon�veis como o n�mero de entradas declarado

End Sub

'
'INTERFACE 5.1 - Atualiza n�mero de ve�culos no estacionamento (total) se houver ENTRADA no mesmo.
'
Public Sub TextBox5_Change(Index As Integer)
    'Calcula e atualiza atrav�s da diferen�a entre entrada e sa�da (foi executada uma valida��o atrav�s de inspe��o no pr�prio c�digo)
    TextBox8.Text = Val(TextBox5.Text) - Val(TextBox6.Text)
End Sub
'
'INTERFACE 5.2 - Atualiza n�mero de ve�culos no estacionamento (total) se houver SA�DA no mesmo.
'
Public Sub TextBox6_Change(Index As Integer)
    'Calcula e atualiza atrav�s da diferen�a entre entrada e sa�da (foi executada uma valida��o atrav�s de inspe��o no pr�prio c�digo)
    TextBox8.Text = Val(TextBox5.Text) - Val(TextBox6.Text)
End Sub

