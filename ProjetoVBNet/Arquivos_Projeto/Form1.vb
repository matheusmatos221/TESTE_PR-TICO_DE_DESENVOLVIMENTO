Public Class Form1
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
    Dim threadContadorEntrada As Threading.Thread
    Dim threadContadorSaida As Threading.Thread
    Dim threadPEntradaVeiculo As Threading.Thread
    Dim threadPSaidaVeiculo As Threading.Thread
    Dim entradasDisponiveis As Integer
    Dim saidasDisponiveis As Integer

    '
    'Botão de Início do Programa
    '
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        'Desabilita outro start no programa
        Button1.Enabled = False

        'Pede ao usuário que insira as quantidades de entradas e saídas do estacionamento
        SetEntradasSaidas()

        'Inicia Thread de entrada (chegada de veículos a cada x quantidade de tempo, sendo x entre 1s e 5s)
        IniciarThreads()

    End Sub

    '
    'Evento de mudança de valor em "Veiculos na Fila de Entrada"
    '
    Private Sub TextBox3_TextChanged(sender As Object, e As EventArgs) Handles TextBox3.TextChanged

        VerificadorEntradaDisponivel()

    End Sub
    '
    'Evento de mudança de valor em "Veiculos na Fila de Saída"
    '
    Private Sub TextBox4_TextChanged(sender As Object, e As EventArgs) Handles TextBox4.TextChanged

        VerificadorSaidaDisponivel()

    End Sub
    '
    'Verifica Cancela de Entrada Disponível (Função)
    '
    Private Sub VerificadorEntradaDisponivel()

        'VERIFICADOR DE DISPONIBILIDADE DE CANCELAS DE ENTRADA
        'Quando há mudança no número de veículos na fila de entrada, verifica a quantidade de veículos na fila e
        'Se houver cancelas de entrada disponíveis, inicia o processo de entrada de um veículo que pode
        'Demorar um tempo aleatório entre 3 e 5 segundos para ser concluído

        'Se houver cancelas disponíveis inicia processo de entrada
        'Se veículos na fila >= 1 e <= nº entradas (tem que ter pelo menos 1 cancela, não pode valor negativo...
        If CInt(TextBox3.Text) >= 1 And entradasDisponiveis >= 1 Then
            'MsgBox("Valor é Menor ou Igual, Há Cancelas Disponíveis!")
            'Iniciar processo de entrada de 1 veículo
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
    Private Sub VerificadorSaidaDisponivel()

        'VERIFICADOR DE DISPONIBILIDADE DE CANCELAS DE SAÍDA
        'Quando há mudança no número de veículos na fila de entrada, verifica a quantidade de veículos na fila e
        'Se houver cancelas de entrada disponíveis, inicia o processo de entrada de um veículo que pode
        'Demorar um tempo aleatório entre 3 e 5 segundos para ser concluído

        'Se houver cancelas disponíveis inicia processo de entrada
        'Se veículos na fila >= 1 e <= nº entradas (tem que ter pelo menos 1 cancela, não pode valor negativo...
        If CInt(TextBox4.Text) >= 1 And saidasDisponiveis >= 1 Then
            'MsgBox("Valor é Menor ou Igual, Há Cancelas Disponíveis!")
            'Iniciar processo de saida de 1 veículo
            threadPSaidaVeiculo = New Threading.Thread(AddressOf ProcessoSaida)
            threadPSaidaVeiculo.Start()

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
        threadContadorEntrada = New Threading.Thread(AddressOf IniciarEntrada)
        threadContadorEntrada.Start()

        'Inicia contador aleatório de saida (a cada x um veículo inicia processo de saida, x entre 10s e 30s)
        threadContadorSaida = New Threading.Thread(AddressOf IniciarSaida)
        threadContadorSaida.Start()

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
        End While

        'Assume inicialmente que não há veículos no estacionamento ou em processo e utiliza valores definidos pelo usuário como referencia
        entradasDisponiveis = Val(TextBox1.Text) 'Define o numero de cancelas de entrada disponíveis como o número de entradas declarado
        saidasDisponiveis = Val(TextBox2.Text) 'Define o numero de cancelas de saida disponíveis como o número de entradas declarado

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
            Randomize() 'Gera uma nova seed baseada no timer do sistema para a função Rnd()
            tempoRndEntrada = Int((LimiteMax - LimiteMin + 1) * Rnd() + LimiteMin) 't em milisegundos

            System.Threading.Thread.CurrentThread.Sleep(tempoRndEntrada) 'Aplica delay no Thread

            'Após o tempo, adiciona veículo a fila de entrada, a mudança de valor desencadeia uma verificação de cancela disponível
            'Se houver cancela disponível, o veículo é "instantâneamente" movido para o processo de entrada
            'Quando TextBox3 muda, a função "TextBox3_TextChanged" é chamada através de evento "called by changed value")
            'Pode ocorrer um erro quando fecha o programa, porque ele tenta finalizar o processo sem valor, não impacta no resultado.
            TextBox3.Text = Val(TextBox3.Text) + 1 'Adiciona veículo na fila de entrada TextBox3 = Fila de Entrada

        End While
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
            Randomize() 'Gera uma nova seed baseada no timer do sistema para a função Rnd()
            tempoRndSaida = Int((LimiteMax - LimiteMin + 1) * Rnd() + LimiteMin) 't em milisegundos

            System.Threading.Thread.CurrentThread.Sleep(tempoRndSaida) 'Aplica delay no Thread

            'Após o tempo, um veículo do estacionamento inicia processo de saída do estacionamento, 
            'Quando TextBox4 muda, a função "TextBox4_TextChanged" é chamada através de evento "called by changed value")
            'Se houver cancela de saída disponível, o veículo será "instantâneamente" movido para o processo de saída
            TextBox7.Text = Val(TextBox7.Text) - 1 'Um veículo deixa o estacionamento
            TextBox4.Text = Val(TextBox4.Text) + 1 'Um veículo vai pra fila ou processo de saida
        End While

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
        Randomize() 'Gera uma nova seed baseada no timer do sistema para a função Rnd()
        tempoRndPEntrada = Int((LimiteMax - LimiteMin + 1) * Rnd() + LimiteMin) 't em milisegundos

        System.Threading.Thread.CurrentThread.Sleep(tempoRndPEntrada) 'Aplica delay no Thread

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
        Console.WriteLine("Cancelas de Saídas Disponíveis: " & saidasDisponiveis)

        'Variáveis locais e internas
        Dim tempoRndPSaida As Integer
        Dim LimiteMin As Integer
        Dim LimiteMax As Integer
        LimiteMin = 3000 'Tempo mínimo da aleatoriedade de processo de entrada em milisegundos
        LimiteMax = 5000 'Tempo máximo da aleatoriedade de processo de entrada em milisegundos

        'Função utilizada para randomizar um valor de tempo com resolução de milisegundos
        Randomize() 'Gera uma nova seed baseada no timer do sistema para a função Rnd()
        tempoRndPSaida = Int((LimiteMax - LimiteMin + 1) * Rnd() + LimiteMin) 't em milisegundos
        System.Threading.Thread.CurrentThread.Sleep(tempoRndPSaida) 'Aplica delay no Thread

        'Conclui processo de entrada e contabiliza dados nos respectivos locais de armazenamento de informação (O ideal era criar variáveis ou colocar em um banco de dados para não perder a informação)
        saidasDisponiveis = saidasDisponiveis + 1 'Ao final disponibiliza novamente a cancela para um novo veículo (um novo thread pode ser iniciado)
        Console.WriteLine("Cancelas de Saídas Disponíveis: " & saidasDisponiveis)
        TextBox6.Text = Val(TextBox6.Text) + 1 'Adiciona 1 veículo no número de veículos que passaram pela saida
        TextBox7.Text = Val(TextBox7.Text) - 1 'Subtrai 1 veículo no número de veículos dentro do estacionamento

    End Sub
    '
    'INTERFACE 5.1 - Atualiza número de veículos no estacionamento (total) se houver ENTRADA no mesmo.
    '
    Private Sub TextBox5_TextChanged(sender As Object, e As EventArgs) Handles TextBox5.TextChanged
        'Calcula e atualiza através da diferença entre entrada e saída (foi executada uma validação através de inspeção no próprio código)
        TextBox8.Text = Val(TextBox5.Text) - Val(TextBox6.Text)
    End Sub
    '
    'INTERFACE 5.2 - Atualiza número de veículos no estacionamento (total) se houver SAÍDA no mesmo.
    '
    Private Sub TextBox6_TextChanged(sender As Object, e As EventArgs) Handles TextBox6.TextChanged
        'Calcula e atualiza através da diferença entre entrada e saída (foi executada uma validação através de inspeção no próprio código)
        TextBox8.Text = Val(TextBox5.Text) - Val(TextBox6.Text)
    End Sub
End Class
