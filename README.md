# README: Código de Transmissão e Recuperação de Mensagens com Multiplexação por CDMA

## Descrição
Este projeto implementa uma simulação de transmissão e recuperação de mensagens usando a técnica de multiplexação CDMA (Code Division Multiple Access). CDMA é um método de comunicação onde várias mensagens são transmitidas simultaneamente em um mesmo canal de frequência, diferenciadas por códigos exclusivos de espalhamento.

## Estrutura do Código
O código MATLAB realiza as seguintes etapas:
1. **Definição dos Parâmetros**:
   - Frequência de amostragem (`Fs`).
   - Bits representando sinais positivos e negativos (`bitA`, `bitB`).
   - Mensagens dos hosts e códigos de espalhamento (`chipHost1`, `chipHost2`).
2. **Criação das Mensagens**:
   - As mensagens de dois hosts são geradas com base nos sinais definidos.
3. **Modulação CDMA**:
   - As mensagens são multiplicadas pelos respectivos códigos de espalhamento.
4. **Transmissão**:
   - As mensagens moduladas são combinadas e transmitidas em um único sinal.
5. **Recuperação da Mensagem**:
   - O sinal recebido é processado usando os códigos de espalhamento dos hosts para recuperar as mensagens originais.
6. **Visualização**:
   - Os resultados são plotados em gráficos que mostram os códigos de espalhamento, mensagens transmitidas, sinais modulados e mensagens recuperadas.

## Estrutura dos Gráficos
- **Chip Hosts**: Mostra os códigos de espalhamento dos hosts.
- **Mensagens a Serem Transmitidas**: Gráficos das mensagens originais dos hosts.
- **Resultados Transmitidos**: Sinais modulados prontos para transmissão.
- **Transmissão Combinada**: Combinação dos sinais de ambos os hosts.
- **Mensagem Recuperada**: Mensagens decodificadas para verificar a integridade da recuperação.

## Utilização
1. **Configuração**: Certifique-se de que o MATLAB está instalado e funcional.
2. **Execução**: Copie o código em um script `.m` e execute no MATLAB.
3. **Interpretação dos Gráficos**:
   - Verifique os gráficos para assegurar que as mensagens originais e as mensagens recuperadas sejam idênticas, validando a eficácia do processo de CDMA.

## Notas Adicionais
- Este código utiliza operações de multiplicação e soma de sinais com códigos de espalhamento para simular a transmissão e recuperação de mensagens. A normalização é feita para garantir a recuperação correta das mensagens.
- A técnica CDMA é amplamente usada em sistemas de telecomunicações, como redes móveis, devido à sua capacidade de permitir a transmissão simultânea de múltiplos sinais sem interferência significativa.

## Autor
Este código foi criado para fins educacionais e para demonstrar a viabilidade da técnica de multiplexação CDMA em comunicações digitais.
