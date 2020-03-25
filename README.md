# Animais

Aplicativo desenvolvido na linguagem Dart com o SDK Flutter. O aplicativo puxa diferentes APIs com imagens aleatórias de animais. Ele conta com uma grade de escolha e após escolher o animal ele apresenta uma lista infinita de imagens.

Implementado por Mihael Scofield de Azevedo.

## Pré-Requisito de Instalação
É necessário ter o ambiente de desenvolvimento em Dart e Flutter configurados em sua máquina, também é necessáiro um dispositivo como maior que a versão 4.0.

## Instalação
Clone o repositório e abra a pasta "animais" pelo Visual Studio Code ou pelo Android Studio. Então, conecte seu celular ao computador em mode de depuração ou inicei um emulador pelo AVD Manager (vem junto com o Android Studio) e então faça o deploy da aplicação.

## Estruturação
Nenhuma arquitetura de desenvolvimento em específica foi aplicada no projeto, entretanto ele respeita as boas práticas de programação e conta com a modularização padrão vista na programação orientada a objeto.

### Divisão do código
A base do programa encontra-se em 3 folders diferentes, dentro da pasta "lib"

  - Model 
  
  Contendo os objetos utilizados que recebem os Jsons das APIs.
  
  - Utils
  
  Folders com diferentes métodos que auxiliam na leitura das APIs e modulariza o código, fazendo um reaproveitanmento grande de código.
   
  - View
  
  Aqui estão as duas páginas implementadas na aplicação, chamando os demais folders. Tem a página de escolha e a página com o scroll infinito. Além do UI, também existe a lógica básica para que as páginas funcionem.
