# TodoMovies

## ideia geral

O aplicativo carrega uma lista de filmes, exibe detalhes de cada filme e da lista em si.

A lista exibida depende de um int, que para esse teste foi fixado em 2.

Os filmes tem um botão de "watched" e o cabeçalho da lista faz a contagem de quantos filmes da lista ja foram assistidos.

O cabeçalho tem um botão de favorito. Tanto o botão de favorito e os de assistidos gravam os dados localmente, assim quando abrir novamente o app os botões continuaram no mesmo estado.

Ao clicar no poster de um filme listado, o plicativo leva para uma página com mais detalhes do filme. A página está bem simples, apenas para mostrar a navegação e mostrar os demais parametros da entidade que não eram exibidos na lista.

Caso ocorra um erro de obtenção do filme ou mapeamento de dados, o aplicativo infroma o erro para o usuário. 

## Screenshot
![Screenshot](https://github.com/GSpaki/movie_app/blob/master/screenshots/screenshot1.png?raw=true)

## API
<p>A API utilizada é a TheMovieDB.
Ela pode fornecer filmes e listas</p>

## Arquitetura
A aplicação foi baseada em Clean Architecture, desacoplada e modular.

## Modularidade

Esse aplicativo seria parte de um aplicativo maior, foi feito com Flutter Modular pensando nisso. Da forma que o app está estruturado o módulo depende apenas da Id da lista, que poderia ser passada por outro módulo.
 ## Principais dependências

**Flutter Modular** - _Módulos e injeção de dependecia_
 <p>
 O modular auxilia na divisão de código por módulos para facilitar a manutenção e escalabidade do projeto.
 O pacote foi primariamente usado para injeção de dependências, mas poderia ser usado para rotas e acomodar mais módulos.</p>

**Oxidized** - _"type union" com Result_
 <p>O retorno do caso de uso poderia ser a entidade desejada ou uma falha. O ideal seria usar type union, porém o dart não oferece isso, então foi usado o Result do Oxidized como alternativa
 
 O package mais comum para esse tipo de operação é o DartZ, que tem diversas ferramentas para programação funcional, mas como precisava apenas "type union" e considero o Oxidized mais claro para leitura de código, resolvi utilizá-lo</p>

 **Hive** - _persistência de dados_
 <p>O Hive é um banco de dados de valor-chave leve e extremamente rápido</p>

**Dio** - _requisições HTTP_
 
**Mocktail** - _Mock para testes_

## O que eu gostaria de ter feito
 
 * _fazer cobertura total de testes;_
 
 * _implementar lista inicial usando parametros de URL, para aproveitar esse recurso do flutter modular;_
 
 * _ao clicar em um poster, exibir modal com mais detalhes do filme;_

* _criar botão de troca de tema, visto que o app já está em função das cores do tema;_

 * _estilisar mais os componentes, com divisores e textes com pesos diferentes, mas por hora não era o foco_