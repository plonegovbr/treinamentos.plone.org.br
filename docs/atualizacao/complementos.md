---
myst:
  html_meta:
    "description": "Atualizar complementos"
    "property=og:description": "Atualizar complementos"
    "property=og:title": "Atualizar complementos"
    "keywords": "Atualizar, Plone, complementar, produtos"
---

(atualizacao-complementos-label)=

# Atualizar complementos

Este capítulo descreve as etapas para migrar seus produtos de terceiros.

- Desligue sua instância do servidor Plone.
- Se você fixou versões de produtos de terceiros em seu `buildout.cfg` ou em outros arquivos de configuração, como , atualize essas referências para apontar para as novas versões `Products.PloneFormGen = 1.7.17`


    ```{note}
    Sem fixar, como especificar Products.PloneFormGensem um número de versão, sua ferramenta de compilação, buildout ou make, escolherá a versão mais recente dos produtos por padrão.
    ```

- Execute sua ferramenta de compilação. Aguarde até que todos os novos softwares sejam baixados e instalados.
- Inicie o Plone novamente. Seu site pode parecer estranho ou até mesmo inacessível até que você execute a próxima etapa.
- Navegue até a tela Add-on adicionando /prefs_install_products_formao URL do seu site. Atualize os produtos, se puder. Os produtos atualizáveis ​​seriam aqueles que suportam tanto a versão atual quanto a nova do Plone.
- Execute procedimentos de atualização específicos do produto, se houver. Você os encontrará na documentação de cada produto.

Se `/prefs_install_products_form` estiver inacessível, e você estiver usando o Plone 5.0.x ou anterior, você deve tentar fazer as atualizações complementares a partir da interface de gerenciamento. Navegue até a portal_quickinstallerinterface de gerenciamento em `/portal_quickinstaller/manage_installProductsForm` e reinstale ou atualize os produtos que estão desatualizados.

```{warning}
Tenha cuidado ao atualizar complementos por meio da interface de gerenciamento. Também pode mostrar temas desatualizados, com uma dica para atualizar. Se você fizer isso, o tema atualizado será ativado, substituindo o tema atual. Se isso acontecer, reative seu tema no painel de temas.
```