---
myst:
  html_meta:
    "description": "Plone preparar para atualizar"
    "property=og:description": "Plone upgrade preparations"
    "property=og:title": "Plone upgrade preparations"
    "keywords": "Plone, atualização, preparações"
---

(atualizacao-preparacao-label)=

# Preparações


Este capítulo lista o que fazer antes de migrar o Plone.

## Reunir informações 
- Leia "O que há de novo em..." para sua versão Plone relevante e leia as notas de lançamento. Você os encontrará no diretório online de versões lançadas emdist.plone.org . Como exemplo, você pode encontrar o arquivo RELEASE-NOTES.mdpara 6.0.0b2 .
- Verifique as dependências.

    - Leia as notas de lançamento do lançamento do Plone para o qual você está atualizando, em particular:

        - Qual versão do Python é necessária?
        - Qual versão do Zope é necessária?
        - Você precisa de novas bibliotecas Python?

    - Certifique-se de que todos os produtos adicionais que você está usando foram atualizados para suportar a versão do Plone para a qual você está atualizando.
    - Comece com os produtos de terceiros que estão em uso em seu site. Verifique se eles foram atualizados ou verificados para funcionar na nova versão e atualize-os em sua instância existente antes de iniciar a atualização do Plone/Zope/Python, se possível.
    - Se o Zope depende de uma versão mais recente do Python, instale primeiro a nova versão do Python.
    - Se a versão mais recente do Plone depende de uma versão mais recente do Zope, você precisará instalá-la antes de prosseguir com a atualização do Plone.

```{seealso}
O Zope tem sua própria documentação de diretrizes de migração. De maior interesse para a migração são os seguintes documentos.

- O que há de novo em alto nível.
- Migrando entre as versões do Zope .
- Registro de alterações detalhado .

Se o Plone estiver sendo atualizado ao mesmo tempo que uma versão do Zope, o Plone geralmente tratará da atualização do Zope com seu próprio script de migração.
```

## Faça backup do seu site Plone 

```{danger}
Sempre faça backup do seu site Plone antes de atualizar.
```

```{seealso}
Veja a documentação do Plone 5.2, Backup de sua implantação Plone .
```

```{todo}
Migre os documentos do Plone 5.2 para fazer backup de sua implantação do Plone para os documentos do Plone 6.
```

## Configure um ambiente de teste para ensaiar a atualização 

```{danger}
Nunca trabalhe diretamente em seu site ao vivo até saber que a atualização foi bem-sucedida.
```

Sempre crie um ambiente de teste para ensaiar a atualização. Copie sua instância para um novo ambiente e atualize a cópia. Essa é uma boa maneira de trabalhar com seus produtos e dependências de terceiros em preparação para a atualização final do site ativo.