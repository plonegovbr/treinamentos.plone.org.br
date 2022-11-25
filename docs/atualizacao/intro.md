---
myst:
  html_meta:
    "description": "Introdução"
    "property=og:description": "Introdução"
    "property=og:title": "Introdução"
    "keywords": "Introdução, atualização, Plone, migração, versão"
---

(atualizacao-introcucao-label)=

# Introdução

Esta parte da documentação descreve como atualizar uma instalação existente do Plone. Para a maioria das pessoas, isso significa atualizar o Plone para uma versão mais recente, por exemplo, de 5.2.9 para 6.0.0. Este guia se aplica a todas as versões modernas do Plone. Para versões sem suporte do ano de 2009 e anteriores, consulte as versões mais antigas desta documentação.

A atualização do Plone inclui o aplicativo Plone e seus complementos, bem como a migração de seu conteúdo.

Uma migração é o processo de pegar um componente em seu site Plone e movê-lo de sua versão atual para uma mais nova. A migração é necessária porque as partes internas do Plone às vezes mudam para suportar novas funcionalidades. Quando for esse o caso, o conteúdo armazenado em sua instância Plone pode não estar alinhado com os requisitos da nova versão. Para lidar com essa situação, o Plone possui uma ferramenta integrada que migra o conteúdo existente para a nova estrutura.

Antes de migrar, você deve ler todo este documento, bem como os guias de atualização específicos da versão , para entender o impacto potencial que a migração terá em seu site Plone. Também é aconselhável ler o capítulo Solução de problemas de uma atualização , caso você encontre algum problema.

(introcucao-politica-versao-label)=
## Política de versão e numeração 
O Plone segue o [versionamento semântico](https://semver.org/) para comunicar o que os usuários e desenvolvedores podem esperar de um lançamento em relação a mudanças importantes, novos recursos e correções de bugs. Usamos um esquema de versão de três dígitos (por exemplo, `6.0.0`), seguindo o major.minor.patchesquema.

(introcucao-versao-quebra-label)=
### Versão de Quebra (principal)

Uma versão de quebra indica uma mudança que pode quebrar um aplicativo ou complemento de terceiros que depende do Plone. A numeração da versão aumentaria como no exemplo a seguir.

````
5.2.3 -> 6.0.0
````

Para cada lançamento de quebra, os detalhes do que quebra e como mitigá-lo devem ser documentados nas notas de mudança e lançamento.

### Versão do recurso (menor) 
Um lançamento de recurso indica que um novo recurso foi adicionado ao Plone de forma ininterrupta. A numeração da versão aumentaria como no exemplo a seguir.

````
5.1.7 -> 5.2.0
````

Você não precisa esperar nenhuma mudança significativa de tal lançamento. É possível que a interface do usuário mude devido a um novo recurso adicionado.

Versão de correção de bugs (patch) 
Um lançamento de bugfix indica que um ou mais bugs no Plone foram corrigidos. A numeração da versão aumentaria como no exemplo a seguir.

````
5.2.8 -> 5.2.9
````

Não deve haver quebra ou alterações de UX/UI de tal lançamento. Apenas corrigiu um bug.

```{Veja também}
Uma postagem no fórum da comunidade, Regras para o desenvolvimento do Plone 6 durante o estágio beta , discute as versões alfa e beta.
```
## Guias de atualização específicos da versão 
Além do procedimento geral de atualização, existem guias de migração específicos da versão . Esses guias contêm instruções específicas e informações valiosas coletadas de casos reais de migração.

Essa abordagem é recomendada para todas as atualizações de versões secundárias e pode funcionar bem para a maioria das atualizações principais. Ao lidar com grandes mudanças no Plone, ou com instalações muito grandes ou complexas, uma migração baseada em exportação-importação geralmente é a melhor solução.

## Estratégias de atualização 
### Migrações no local 
Uma migração local significa que o conteúdo e as configurações de uma instalação Plone estão sendo atualizadas enquanto o Plone está rodando. Essas atualizações usam uma ferramenta integrada. Eles executam etapas de atualização que são coletadas em plone.app.upgrade .

Essa abordagem é recomendada para todos os upgrades de versões de recursos (secundários). Isso geralmente funciona bem para a maioria das atualizações (grandes) também.

Ao lidar com grandes mudanças no Plone, ou com instalações muito grandes ou complexas, uma migração baseada em exportação-importação geralmente é a melhor solução.

Durante as migrações no local, é aconselhável não ignorar os números de versão (principais) de interrupção.

Ir do Plone 5.2 para o Plone 6.0 é bom.

Se você está no Plone 2.5 e deseja atualizar para o Plone 6 mais recente, você deve abordar isso em várias etapas:

- Primeiro upgrade do Plone 2.5 para a última versão do Plone 3 (3.3.6).
- Então atualize do Plone 3 para a última versão do Plone 4 (4.3.20).
- Em seguida, atualize do Plone 4 para a versão mais recente do Plone 5.
- Em seguida, atualize do Plone 5 para a versão mais recente do Plone 6.

### Migrações de exportação-importação 
Exporte todo o conteúdo e configurações que deseja manter de um site antigo e importe-o para um novo site.

Esta abordagem permite que você migre do Plone 4 para o 6, do Python 2 para o 3 e do Archetypes para o Dexterity, em uma etapa de migração. É recomendado para migrações grandes e complexas.

A ferramenta recomendada para isso é collective.exportimport. Uma alternativa é transmogrifier(consulte o treinamento Migrando conteúdo com Transmogrifier ).

## Principais Mudanças 
As seguintes grandes mudanças na história do Plone requerem atenção especial durante a migração.

### Plone 5.0: Destreza substitui Arquétipos 
Com o Plone 5.0, a estrutura padrão para tipos de conteúdo mudou de Arquétipos para Destreza.

Até o Plone 5.2.x, há uma migração integrada de Archetypes para Dexterity, mas suporta apenas Python 2. Veja Migration na versão estável mais recente de plone.app.contenttypespara detalhes sobre a migração de tipos de conteúdo padrão e personalizado para Dexterity.

Usando o Collective.exportimport, você pode exportar o conteúdo de Arquétipos e importá-lo como conteúdo de Destreza.

### Plone 5.2: Suporte para Python 3 
O Plone 5.2 adicionou suporte para Python 3, enquanto o Plone 6.0 retirou o suporte para Python 2. Isso significa que você pode usar o Plone 5.2 para atualizar para Python 3.

Isso requer que você execute o Plone em Python 3 e use apenas código que suporte Python 3. Também requer que você migre o banco de dados em uma etapa separada do Python 2 para 3 enquanto o Plone não estiver em execução.

Veja os capítulos Migrando Plone 5.2 para Python 3 e Migrando um ZODB de Python 2.7 para Python 3 para informações detalhadas sobre estes passos.

Usando o Collective.exportimport , você pode exportar o conteúdo do Python 2 e importá-lo no Python 3.

## Plone 6.0: Volto é o novo frontend

O Plone 6.0 vem com um novo frontend padrão chamado {term}`Volto`. Ele é escrito em React e espera algumas mudanças sutis, mas importantes.

Veja Migrando do Plone Classic UI para o Volto para as etapas de migração específicas.