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
      Caption         =   "Veículos no Estacionamento (Total)"
      Height          =   255
      Index           =   7
      Left            =   1800
      TabIndex        =   16
      Top             =   4560
      Width           =   3015
   End
   Begin VB.Label Label1 
      Caption         =   "Veículos no Estacionamento (Estacionados)"
      Height          =   255
      Index           =   6
      Left            =   1800
      TabIndex        =   15
      Top             =   3960
      Width           =   3135
   End
   Begin VB.Label Label1 
      Caption         =   "Veículos Passaram Saída"
      Height          =   255
      Index           =   5
      Left            =   1800
      TabIndex        =   14
      Top             =   3360
      Width           =   2295
   End
   Begin VB.Label Label1 
      Caption         =   "Veículos Passaram Entrada"
      Height          =   255
      Index           =   4
      Left            =   1800
      TabIndex        =   13
      Top             =   2760
      Width           =   2415
   End
   Begin VB.Label Label1 
      Caption         =   "Veículos Fila Saída"
      Height          =   255
      Index           =   3
      Left            =   1800
      TabIndex        =   12
      Top             =   2280
      Width           =   1695
   End
   Begin VB.Label Label1 
      Caption         =   "Veículos Fila Entrada"
      Height          =   255
      Index           =   2
      Left            =   1800
      TabIndex        =   11
      Top             =   1680
      Width           =   1935
   End
   Begin VB.Label Label1 
      Caption         =   "Qtd. Saídas"
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
'Botão de Início do Programa
'
Public Sub Button1_Click()

    'Desabilita outro start no programa
    Button1.Enabled = False

    'Pede ao usuário que insira as quantidades de entradas e saídas do estacionamento
    SetEntradasSaidas

    'Inicia Thread de entrada (chegada de veículos a cada x quantidade de tempo, sendo x entre 1s e 5s)
    IniciarThreads

End Sub

'
'Evento de mudança de valor em "Veiculos na Fila de Entrada"
'

Public Sub TextBox3_Change(Index As Integer)

    VerificadorEntradaDisponivel

End Sub

'
'Evento de mudança de valor em "Veiculos na Fila de Saída"
'
Public Sub TextBox4_Change(Index As Integer)

    VerificadorSaidaDisponivel

End Sub
'
'Verifica Cancela de Entrada Disponível (Função)
'
Public Sub VerificadorEntradaDisponivel()

    'VERIFICADOR DE DISPONIBILIDADE DE CANCELAS DE ENTRADA
    'Quando há mudança no número de veículos na fila de entrada, verifica a quantidade de veículos na fila e
    'Se houver cancelas de entrada disponíveis, inicia o processo de entrada de um veículo que pode
    'Demorar um tempo aleatório entre 3 e 5 segundos para ser concluído

    'Se houver cancelas disponíveis inicia processo de entrada
    'Se veículos na fila >= 1 e <= nº entradas (tem que ter pelo menos 1 cancela, não pode valor negativo...
    If Form1.TextBox3.Item.Text >= 1 And entradasDisponiveis >= 1 Then
        'MsgBox("Valor é Menor ou Igual, Há Cancelas Disponíveis!")
        'Iniciar processo de entrada de 1 veículo
        threadContadorEntrada
        threadPEntradaVeiculo = New Threading.Thread(AddressOf ProcessoEntrada)
        threadPEntradaVeiculo.Start()

    Else
        'MsgBox("Valor é Maior, Não há Cancelas Disponíveis")
        'O veículo foi adicionado na fila no inicio do processo... consideramos o processo de deslocamento até a
        'Cancela de saída, como parte da fila, porém se houver cancelas disponíveis, ele é retirado da fila em uma fração
    End If

End Sub
'
'Verifica Cancela de Saída Disponível (Função)
'
Public Sub VerificadorSaidaDisponivel()

    'VERIFICADOR DE DISPONIBILIDADE DE CANCELAS DE SAÍDA
    'Quando há mudança no número de veículos na fila de entrada, verifica a quantidade de veículos na fila e
    'Se houver cancelas de entrada disponíveis, inicia o processo de entrada de um veículo que pode
    'Demorar um tempo aleatório entre 3 e 5 segundos para ser concluído

    'Se houver cancelas disponíveis inicia processo de entrada
    'Se veículos na fila >= 1 e <= nº entradas (tem que ter pelo menos 1 cancela, não pode valor negativo...
    If CInt(TextBox4.Text) >= 1 And saidasDisponiveis >= 1 Then
        'MsgBox("Valor é Menor ou Igual, Há Cancelas Disponíveis!")
        'Iniciar processo de saida de 1 veículo
        ''threadPSaidaVeiculo = New Threading.Thread(AddressOf ProcessoSaida)
        ''threadPSaidaVeiculo.Start()

    Else
        'MsgBox("Valor é Maior, Não há Cancelas Disponíveis")
    End If

End Sub
'
'Inicia Threads de processos de entrada e saída de veículos
'
Private Sub IniciarThreads()

    'Retira aviso de ilegalidade de "chamada de Thread em outra função/método"
    Control.CheckForIllegalCrossThreadCalls = False

    'Inicia contador aleatório de entrada (a cada x um veículo inicia processo de entrada, x entre 1s e 5s)
    Set threadContadorEntrada = CreateObject("Estacionamento_Teste.clsThread.IniciarEntrada")
    
    ''threadContadorEntrada = New Threading.Thread(AddressOf IniciarEntrada)
    ''threadContadorEntrada.Start()

    'Inicia contador aleatório de saida (a cada x um veículo inicia processo de saida, x entre 10s e 30s)
    ''threadContadorSaida = New Threading.Thread(AddressOf IniciarSaida)
    ''threadContadorSaida.Start()

End Sub
'
' ESPECÍFICAÇÃO 1 - Usuário define quantidade de entradas e saídas (número de cancelas)
'
Public Sub SetEntradasSaidas()

    'Pede ao usuário valores de quantidade de entradas e saídas
    TextBox1.Text = InputBox("Digite a quantidade de entradas que o seu estacionamento tem: ", Title:="Quantidade de Entradas", DefaultResponse:="3")
    TextBox2.Text = InputBox("Digite a quantidade de saídas que o seu estacionamento tem: ", Title:="Quantidade de Saídas", DefaultResponse:="3")

    'Requisita novamente se houver inconsitencia no tipo de valor, valor negativo, porém faz o request das duas informações novamente.
    While Not IsNumeric(TextBox1.Text) Or Not IsNumeric(TextBox2.Text) Or Not Val(TextBox1.Text) >= 0 Or Not Val(TextBox2.Text) >= 0 Or Not TextBox1.Text - Int(TextBox1.Text) = 0 Or Not TextBox2.Text - Int(TextBox2.Text) = 0
        TextBox1.Text = InputBox("Digite NOVAMENTE a quantidade de entradas que o seu estacionamento tem (APENAS NÚMEROS INTEIROS POSITIVOS): ", Title:="Quantidade de Entradas", DefaultResponse:="3")
        TextBox2.Text = InputBox("Digite NOVAMENTE quantidade de saídas que o seu estacionamento tem: (APENAS NÚMEROS INTEIROS POSITIVOS)", Title:="Quantidade de Saídas", DefaultResponse:="3")
    Wend

    'Assume inicialmente que não há veículos no estacionamento ou em processo e utiliza valores definidos pelo usuário como referencia
    entradasDisponiveis = Val(TextBox1.Text) 'Define o numero de cancelas de entrada disponíveis como o número de entradas declarado
    saidasDisponiveis = Val(TextBox2.Text) 'Define o numero de cancelas de saida disponíveis como o número de entradas declarado

End Sub

'
'INTERFACE 5.1 - Atualiza número de veículos no estacionamento (total) se houver ENTRADA no mesmo.
'
Public Sub TextBox5_Change(Index As Integer)
    'Calcula e atualiza através da diferença entre entrada e saída (foi executada uma validação através de inspeção no próprio código)
    TextBox8.Text = Val(TextBox5.Text) - Val(TextBox6.Text)
End Sub
'
'INTERFACE 5.2 - Atualiza número de veículos no estacionamento (total) se houver SAÍDA no mesmo.
'
Public Sub TextBox6_Change(Index As Integer)
    'Calcula e atualiza através da diferença entre entrada e saída (foi executada uma validação através de inspeção no próprio código)
    TextBox8.Text = Val(TextBox5.Text) - Val(TextBox6.Text)
End Sub

