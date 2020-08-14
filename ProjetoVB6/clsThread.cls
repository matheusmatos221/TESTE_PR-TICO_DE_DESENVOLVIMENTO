VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsThread"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

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
    TextBox3.Text = Val(TextBox3.Text) - 1 'Retira 1 veículo na fila de entrada (considerando que processo de entrada não faz parte do processo de espera "fila de espera")

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
    ''Randomize() 'Gera uma nova seed baseada no timer do sistema para a função Rnd()
    tempoRndPEntrada = Int((LimiteMax - LimiteMin + 1) * Rnd() + LimiteMin) 't em milisegundos

    System.Threading.Thread.CurrentThread.Sleep (tempoRndPEntrada) 'Aplica delay no Thread

    'Desocupa 1 cancela, disponibiliza +1 no número de cancelas de entrada disponível no fim do processamento
    entradasDisponiveis = entradasDisponiveis + 1 'Ao final disponibiliza novamente a cancela para um novo veículo (um novo thread pode ser iniciado)
    'Console.WriteLine("Cancelas de Entrada Disponíveis: " & entradasDisponiveis) '<- UTILIZADO NO DEBUG

    'Conclui processo de entrada e contabiliza dados nos respectivos locais de armazenamento de informação (O ideal era criar variáveis ou colocar em um banco de dados para não perder a informação)
    TextBox5.Text = Val(TextBox5.Text) + 1 'Adiciona 1 veículo no número de veículos que passaram pela entrada
    TextBox7.Text = Val(TextBox7.Text) + 1 'Adiciona 1 veículo no número de veículos dentro do estacionamento

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
    TextBox4.Text = Val(TextBox4.Text) - 1 'Retira 1 veículo na fila de saida (considerando que processo de entrada não faz parte do processo de espera "fila de espera")
    saidasDisponiveis = saidasDisponiveis - 1 'Declara que uma das cancelas de entrada disponíveis não está mais disponível
    'As vezes, por conta da execução do Thread, pode aparecer que o número de entradas ficou negativo no console, porém é um problema da execução
    'Do thread que na verdade executa de forma alternada os diferentes processos e eventualmente ocorre esse bug. (não altera o funcionamento do programa)
    Console.WriteLine ("Cancelas de Saídas Disponíveis: " & saidasDisponiveis)

    'Variáveis locais e internas
    Dim tempoRndPSaida As Integer
    Dim LimiteMin As Integer
    Dim LimiteMax As Integer
    LimiteMin = 3000 'Tempo mínimo da aleatoriedade de processo de entrada em milisegundos
    LimiteMax = 5000 'Tempo máximo da aleatoriedade de processo de entrada em milisegundos

    'Função utilizada para randomizar um valor de tempo com resolução de milisegundos
    ''Randomize() 'Gera uma nova seed baseada no timer do sistema para a função Rnd()
    tempoRndPSaida = Int((LimiteMax - LimiteMin + 1) * Rnd() + LimiteMin) 't em milisegundos
    System.Threading.Thread.CurrentThread.Sleep (tempoRndPSaida) 'Aplica delay no Thread

    'Conclui processo de entrada e contabiliza dados nos respectivos locais de armazenamento de informação (O ideal era criar variáveis ou colocar em um banco de dados para não perder a informação)
    saidasDisponiveis = saidasDisponiveis + 1 'Ao final disponibiliza novamente a cancela para um novo veículo (um novo thread pode ser iniciado)
    Console.WriteLine ("Cancelas de Saídas Disponíveis: " & saidasDisponiveis)
    TextBox6.Text = Val(TextBox6.Text) + 1 'Adiciona 1 veículo no número de veículos que passaram pela saida
    TextBox7.Text = Val(TextBox7.Text) - 1 'Subtrai 1 veículo no número de veículos dentro do estacionamento

End Sub

'
'ESPECÍFICAÇÃO 2 - Processo de entrada do veículo
'
Public Sub IniciarEntrada()

    'Após tempo aleatório entre 1 e 5 segundos, um veículo do estacionamento inicia processo de entrada
    While True 'Loop Infinito (CUIDADO para não mudar algo no código e sobrecarregar o sistema) <- ATENÇÃO!

        'Variáveis locais e internas
        Dim tempoRndEntrada As Integer
        Dim LimiteMin As Integer
        Dim LimiteMax As Integer
        LimiteMin = 1000 'Tempo mínimo da aleatoriedade de entrada em milisegundos
        LimiteMax = 5000 'Tempo máximo da aleatoriedade de entrada em milisegundos

        'Função utilizada para randomizar um valor de tempo com resolução de milisegundos
        ''Randomize() 'Gera uma nova seed baseada no timer do sistema para a função Rnd()
        tempoRndEntrada = Int((LimiteMax - LimiteMin + 1) * Rnd() + LimiteMin) 't em milisegundos

        System.Threading.Thread.CurrentThread.Sleep (tempoRndEntrada) 'Aplica delay no Thread

        'Após o tempo, adiciona veículo a fila de entrada, a mudança de valor desencadeia uma verificação de cancela disponível
        'Se houver cancela disponível, o veículo é "instantâneamente" movido para o processo de entrada
        'Quando TextBox3 muda, a função "TextBox3_TextChanged" é chamada através de evento "called by changed value")
        'Pode ocorrer um erro quando fecha o programa, porque ele tenta finalizar o processo sem valor, não impacta no resultado.
        TextBox3.Text = Val(TextBox3.Text) + 1 'Adiciona veículo na fila de entrada TextBox3 = Fila de Entrada

    Wend
End Sub
'
'ESPECÍFICAÇÃO 3 - Processo de saída do veículo
'
Public Sub IniciarSaida()

    'Após tempo aleatório entre 10 e 30 segundos, um veículo do estacionamento inicia processo de saída
    While True 'Loop Infinito (Cuidado para não mudar algo no código e sobrecarregar o sistema)

        'Variáveis locais e internas
        Dim tempoRndSaida As Integer
        Dim LimiteMin As Integer
        Dim LimiteMax As Integer
        LimiteMin = 10000 'Tempo mínimo da aleatoriedade de saida em milisegundos
        LimiteMax = 30000 'Tempo máximo da aleatoriedade de saida em milisegundos

        'Função utilizada para randomizar um valor de tempo com resolução de milisegundos
        ''Randomize() 'Gera uma nova seed baseada no timer do sistema para a função Rnd()
        tempoRndSaida = Int((LimiteMax - LimiteMin + 1) * Rnd() + LimiteMin) 't em milisegundos

        System.Threading.Thread.CurrentThread.Sleep (tempoRndSaida) 'Aplica delay no Thread

        'Após o tempo, um veículo do estacionamento inicia processo de saída do estacionamento,
        'Quando TextBox4 muda, a função "TextBox4_TextChanged" é chamada através de evento "called by changed value")
        'Se houver cancela de saída disponível, o veículo será "instantâneamente" movido para o processo de saída
        TextBox7.Text = Val(TextBox7.Text) - 1 'Um veículo deixa o estacionamento
        TextBox4.Text = Val(TextBox4.Text) + 1 'Um veículo vai pra fila ou processo de saida
    Wend

End Sub

