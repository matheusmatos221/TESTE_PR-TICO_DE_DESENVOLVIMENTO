VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cls_Threads"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Declare Sub Sleep Lib "kernel32.dll" (ByVal dwMilliseconds As Long)



Public Function Foo()
    MsgBox "foo"
End Function
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

'Adiciona veículo na fila de entrada Text4 = Fila de Saida


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
        ''entradasDisponiveis = entradasDisponiveis - 1 'Declara que uma das cancelas de entrada disponíveis não está mais disponível
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
        ''entradasDisponiveis = entradasDisponiveis + 1 'Ao final disponibiliza novamente a cancela para um novo veículo (um novo thread pode ser iniciado)
        'Console.WriteLine("Cancelas de Entrada Disponíveis: " & entradasDisponiveis) '<- UTILIZADO NO DEBUG

        'Conclui processo de entrada e contabiliza dados nos respectivos locais de armazenamento de informação (O ideal era criar variáveis ou colocar em um banco de dados para não perder a informação)
        ''Text5.Text = Val(Text5.Text) + 1 'Adiciona 1 veículo no número de veículos que passaram pela entrada
        ''Text7.Text = Val(Text7.Text) + 1 'Adiciona 1 veículo no número de veículos dentro do estacionamento

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
        ''Text4.Text = Val(Text4.Text) - 1 'Retira 1 veículo na fila de saida (considerando que processo de entrada não faz parte do processo de espera "fila de espera")
        ''saidasDisponiveis = saidasDisponiveis - 1 'Declara que uma das cancelas de entrada disponíveis não está mais disponível
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
    
        ''Text6.Text = Val(Text6.Text) + 1 'Adiciona 1 veículo no número de veículos que passaram pela saida
        ''Text7.Text = Val(Text7.Text) - 1 'Subtrai 1 veículo no número de veículos dentro do estacionamento
End Sub


