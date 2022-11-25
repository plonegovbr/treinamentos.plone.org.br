---
myst:
  html_meta:
    "description": "Solução de problemas de uma atualização"
    "property=og:description": "Solução de problemas de uma atualização"
    "property=og:title": "Solução de problemas de uma atualização"
    "keywords": "Solução"
---

(atualizacao-solucionar-problemas-label)=

# Solução de problemas de uma atualização
Este capítulo aborda a solução de problemas de uma atualização do Plone. 

Quando ocorrer um problema durante a migração, recomendamos que você execute as seguintes etapas.

## Verifique os arquivos de registro
Quando ocorre um erro no site, ou o Zope falha ao iniciar, provavelmente há uma mensagem de erro informativa nos arquivos de log. Os arquivos de log estão localizados no diretório `var/log` do seu projeto. Inspecione `instance.log`. Ignore os avisos irrelevantes e faça uma pesquisa que não diferencia maiúsculas de minúsculas por palavras como "erro", "exceção" e "rastreamento".

Quando o Zope não inicia e não há informações úteis no arquivo de log, você pode iniciar o Zope interativamente. 

Comando Plone 6:

```` 
make start-backend 
````

Plone 5.2 e comandos anteriores:

````
bin/instance fg
````

Observe as mensagens de erro no console.

Você pode encontrar mais informações sobre as mensagens de erro nos documentos a seguir. 

- [Dicas de migração específicas](https://6.dev-docs.plone.org/backend/upgrading/version-specific-migration/index.html) da sua versão do Plone 
- [Referência de erro](https://docs.plone.org/appendices/error-reference.html)

````{todo}
Consulte [https://github.com/plone/documentation/issues/1323](https://github.com/plone/documentation/issues/1323)
````

## Teste sem personalizações 

Quando você personalizou modelos de página ou scripts Python, suas alterações podem interferir nas alterações na nova versão do Plone. É importante descartar essa possibilidade. Suas personalizações são exclusivas do seu site e ninguém no planeta poderá ajudá-lo a resolvê-las.

Remova temporariamente suas personalizações. Remova suas camadas de `portal_skins`. Remova os arquivos dessas camadas no sistema de arquivos. Se o problema desaparecer, você precisará verificar novamente suas personalizações. Geralmente é melhor copiar os arquivos originais da nova versão do Plone para a sua skin e customizá-los novamente.

## Teste sem complementos 

Bugs ou problemas de compatibilidade em add-ons que você instalou podem causar problemas no Plone. Vá para Site Setup > Add-ons e desative todos os add-ons que não são distribuídos com o Plone. Remova os add-ons desativados dos pacotes de sua instância do Zope.

Se o problema desaparecer, você precisará verificar novamente o produto incorreto.

- Ele suporta a nova versão do Plone, Zope e Python? Verifique os `README.txt` arquivos ou páginas do produto ou de outras informações.
- O produto requer algum procedimento de migração adicional? Verifique os `INSTALL.txt`, `UPGRADE.txt`, ou outros arquivos ou páginas informativas do produto.
- O produto foi instalado corretamente? Reinstale-o e verifique o log de instalação.

## Teste com uma nova instância Plone 

Crie um novo site Plone com sua nova versão do Plone. Você não precisa de uma nova instância do Zope, porque você pode adicionar outro site Plone na raiz do Zope. Se o problema não ocorrer em um site novo, a causa do problema provavelmente é uma personalização, um produto instalado ou um conteúdo que não foi migrado corretamente.

## Torne o problema reproduzível 

Antes de sair e pedir ajuda , você deve ser capaz de descrever seu problema de forma que outras pessoas possam reproduzi-lo em seu ambiente.

Reduza o problema ao menor domínio possível.

Elimine produtos e customizações que não fazem parte do problema.

Isso facilita a reprodução do problema por outras pessoas e aumenta suas chances de encontrar outras pessoas com o mesmo problema ou até mesmo uma solução. Quanto mais complexa for a sua história, maior a probabilidade de ela ser exclusiva da sua situação e impenetrável para os outros.

## Peça por ajuda Reportar um erro

[Peça ajuda](https://plone.org/support/how-to-ask-for-help) no [Fórum da Comunidade Plone](https://community.plone.org/) ou solicite suporte comercial pago de [provedores de serviço Plone](https://plone.org/providers). Certifique-se de fazer o seguinte.

Forneça o código-fonte relevante para suas personalizações que fazem parte do problema.

Descreva a configuração exata, versões de software, histórico de migração, mensagens de erro e assim por diante.

## Relatar um bug

Depois de investigar, analisar, identificar e confirmar a causa do seu problema e estiver convencido de que é um bug, vá para o rastreador de bugs apropriado e relate-o.

- Complementos: o README geralmente informa como relatar bugs.
- [Rastreador de problemas do Plone.](https://github.com/plone/Products.CMFPlone/issues)

Não abuse dos rastreadores de problemas pedindo suporte.