close all
clear all


Fs = 100; % Frequência de amostragem
bitA = ones(1, Fs);  % Definição de bitA
bitB = -ones(1, Fs); % Definição de bitB

y1 = [];
y2 = [];

yChip1 = [];
yChip2 = [];

chipHost1 = [1 1 1 -1 1 -1 -1 -1];
chipHost2 = [1 -1 1 1 1 -1 1 1 ];

mensagemHost1 = [1 1 -1 1 -1 1];
mensagemHost2 = [-1 1 1 -1 1 1];

resultadoParaTransmitir1 = [];
resultadoParaTransmitir2 = [];

somaTransmissoes = [];

yMensagemHost1 = [];
yMensagemHost2 = [];

resultadoMensagem1 = [];
resultadoMensagem2 = [];

for i = 1:length(mensagemHost1)
    if mensagemHost1(i) == 1
        yMensagemHost1 = [yMensagemHost1, bitA]; 
    else
        yMensagemHost1 = [yMensagemHost1, bitB]; 
    end
end

for i = 1:length(mensagemHost2)
    if mensagemHost2(i) == 1
        yMensagemHost2 = [yMensagemHost2, bitA]; 
    else
        yMensagemHost2 = [yMensagemHost2, bitB]; 
    end
end

for i = 1:length(mensagemHost1)
    bitsMultiplicados1 = mensagemHost1(i) * chipHost1;
    resultadoParaTransmitir1 = [resultadoParaTransmitir1, bitsMultiplicados1];
end

for i = 1:length(mensagemHost2)
    bitsMultiplicados2 = mensagemHost2(i) * chipHost2;
    resultadoParaTransmitir2 = [resultadoParaTransmitir2, bitsMultiplicados2];
end

for i = 1:length(resultadoParaTransmitir1)
    if resultadoParaTransmitir1(i) == 1
        y1 = [y1, bitA]; 
    else
        y1 = [y1, bitB]; 
    end
end

for i = 1:length(resultadoParaTransmitir2)
    if resultadoParaTransmitir2(i) == 1
        y2 = [y2, bitA]; 
    else
        y2 = [y2, bitB];
    end
end

for i = 1:length(chipHost1)
    if chipHost1(i) == 1
        yChip1 = [yChip1, bitA];
    else
        yChip1 = [yChip1, bitB];
    end
end

for i = 1:length(chipHost2)
    if chipHost2(i) == 1
        yChip2 = [yChip2, bitA];
    else
        yChip2 = [yChip2, bitB];
    end
end

for i = 1:length(y1)
    somaTransmissoes = [somaTransmissoes, y1(i) + y2(i)];
end

len_chipHost = length(chipHost1);

for i = 1:len_chipHost*Fs:length(somaTransmissoes)
    bloco = somaTransmissoes(i:i+len_chipHost*Fs-1);  % Seleciona o bloco de somaTransmissoes
    blocoChipado = reshape(bloco, Fs, []);            % Divide o bloco em Fs partes para cada elemento do chip
    somaBloco = sum(sum(blocoChipado .* repmat(chipHost1, Fs, 1), 1));  % Multiplicação e soma dos elementos
    resultadoMensagem1 = [resultadoMensagem1, somaBloco / (len_chipHost * Fs)];  % Normalizar
end

for i = 1:len_chipHost*Fs:length(somaTransmissoes)
    bloco = somaTransmissoes(i:i+len_chipHost*Fs-1);  % Seleciona o bloco de somaTransmissoes
    blocoChipado = reshape(bloco, Fs, []);            % Divide o bloco em Fs partes para cada elemento do chip
    somaBloco = sum(sum(blocoChipado .* repmat(chipHost2, Fs, 1), 1));  % Multiplicação e soma dos elementos
    resultadoMensagem2 = [resultadoMensagem2, somaBloco / (len_chipHost * Fs)];  % Normalizar
end

yMensagemRecuperadaHost1 = [];
yMensagemRecuperadaHost2 = [];

for i = 1:length(resultadoMensagem1)
    if resultadoMensagem1(i) == 1
        yMensagemRecuperadaHost1 = [yMensagemRecuperadaHost1, bitA]; 
    else
        yMensagemRecuperadaHost1 = [yMensagemRecuperadaHost1, bitB]; 
    end
end

for i = 1:length(resultadoMensagem2)
    if resultadoMensagem2(i) == 1
        yMensagemRecuperadaHost2 = [yMensagemRecuperadaHost2, bitA]; 
    else
        yMensagemRecuperadaHost2 = [yMensagemRecuperadaHost2, bitB]; 
    end
end

    
tTransmissao =        ((0:length(y2)-1)/Fs);
tChip =               ((0:length(yChip1)-1)/Fs);
tSoma =               ((0:length(somaTransmissoes)-1)/Fs);
tMensagem =           ((0:length(yMensagemHost2)-1)/Fs);
tMensagemRecuperada = ((0:length(yMensagemRecuperadaHost2)-1)/Fs); 

subplot(5,2,1)
plot(tChip, yChip1)
axis([0 max(tChip) -2 2])
title('Chip Host 1')
grid

subplot(5,2,2)
plot(tChip, yChip2)
axis([0 max(tChip) -2 2])
title('Chip Host 2')
grid

subplot(5,2,3)
plot(tMensagem, yMensagemHost1)  
title('mensagem a ser transmitida 1')
axis([0 max(tMensagem) -2 2])
grid

subplot(5,2,4)
plot(tMensagem, yMensagemHost2)  
title('mensagem a ser transmitida 2')
axis([0 max(tMensagem) -2 2])
grid

subplot(5,2,5)
plot(tTransmissao, y1)
axis([0 max(tTransmissao) -2 2])
title('Resultado a ser transmitido 1')
grid

subplot(5,2,6)
plot(tTransmissao, y2)
axis([0 max(tTransmissao) -2 2])
title('Resultado a ser transmitido 2')
grid

subplot(5,2,7)
plot(tTransmissao, y1, tTransmissao, y2) 
axis([0 max(tTransmissao) -2 2]) 
title('Transmissão 1 + 2')
grid

subplot(5,2,8)
plot(tSoma, somaTransmissoes)  
title('Resultado da transmissão de 1 + 2')
axis([0 max(tTransmissao) -3 3])
grid

subplot(5,2,9)
plot(tMensagemRecuperada, yMensagemRecuperadaHost1)  
title('Mensagem recuperada de host 1')
axis([0 max(tMensagemRecuperada) -2 2])
grid

subplot(5,2,10)
plot(tMensagemRecuperada, yMensagemRecuperadaHost2)  
title('Mensagem recuperada de host 2')
axis([0 max(tMensagemRecuperada) -2 2])
grid
