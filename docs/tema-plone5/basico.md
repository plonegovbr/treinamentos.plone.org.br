---
myst:
  html_meta:
    "description": "Customizando o Plone pelo Painel de Controle"
    "property=og:description": "Customizando o Plone pelo Painel de Controle"
    "property=og:title": "Básico"
    "keywords": "Básico, Customização, Personalização, Logotipo, CSS, Less"
---

# Básico: Customizando o Plone pelo Painel de Controle

Nesta seção você irá: 
- Usar o painel de controle do site para adicionar um logotipo personalizado - Personalizar a aparência de um site Plone ajustando Variáveis Less
- Adicionar um logotipo de barra de ferramentas personalizado

Assuntos abordados: 
- O painel de controle "Site" 
- O Painel de Controle "Registros de Recursos" 
- Registros de recursos > Modo de desenvolvimento

## Personalize o logotipo e o CSS do tema padrão

Personalizar logotipo:

1. Vá para o Painel de Controle do Plone: {menuselection}`​​Barra de Ferramentas --> Admin --> Configuração do Site`

2. Acesse o ícone do  "Site". 

3. Você verá este formulário:

    ```{image} ./_static/change-logo-in-site-control-panel.png
    ```

4. Agora você pode adicionar/editar/remover seu logotipo personalizado.

Para mais informações, dê uma olhada nos [documentos oficiais](https://docs.plone.org/adapt-and-extend/change-the-logo.html).

## Personalizar CSS / Variáveis Less

1. Volte para o Painel de Controle.
2. Acesse o Registro de Recursos.
3. Ative a opção Development Mode (only logged in users) na guia Registry
4. No pacote "plone" abaixo, clique em "Develop CSS".

Seu painel agora deve ficar assim:

```{image} ./_static/theming-dev_mode_on.png
:align: center
```

Agora podemos brincar com algumas {guilabel}`variáveis ​​Less`:

1. Vá para a guia Variáveis Less

2. Encontre a variável `plone-left-toolbar-expanded` e defina-a para 400px.

 ```{image} ./_static/theming-less_var_hack.png
   :align: center
   ```

3. Clique no botão {guilabel}`Salvar` no canto superior direito e recarregue a página.

4. Clique no logotipo da barra de ferramentas para expandi-la: voilá!

Você pode brincar com algumas outras variáveis, se quiser.

```{Warning}
O "Modo de Desenvolvimento" é pesado para o navegador. Dependendo do navegador e do sistema, você pode encontrar extrema lentidão ao renderizar a página. Você pode ver uma página sem tema por um tempo.

Lembre-se de desligá-lo assim que terminar de ajustar.
```

No entanto, quando você desligar o modo de desenvolvimento depois de alterar algumas {guilabel}`variáveis less`, você verá que as alterações que você acabou de fazer na guia Less Variables não estão mais ativas no tema. O modo de desenvolvimento recompila os recursos do tema dinamicamente para cada solicitação, mas no modo de produção o tema será compilado uma vez ou manualmente no Painel de controle "Registros de recursos". Quando você instala o Plone, o tema Barceloneta incluído e ativo é servido a partir do sistema de arquivos. Esses recursos de temas compilados no sistema de arquivos não podem ser alterados de dentro do Plone.

No próximo tópico faremos uma cópia personalizada do Tema Barceloneta que não será armazenada no sistema de arquivos, mas como uma cópia no banco de dados do site. Ao ativar esta cópia editável, suas variáveis less serão incluídas nos recursos compilados desse tema.