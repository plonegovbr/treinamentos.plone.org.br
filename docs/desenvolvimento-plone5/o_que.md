---
myst:
  html_meta:
    "description": ""
    "property=og:description": ""
    "property=og:title": ""
    "keywords": ""
---

(plone5-o-que-label)=

# O que é o Plone?

O Plone é um Sistema de Gerenciamento de Conteúdo (CMS) de código aberto construído em Python.

- CMS de código aberto para fins Empresariais
- Escrito em Python
- Plone 5.1 e abaixo suportam Python 2.7
- Plone 5.2 e posteriores suportam Python 3.8, 3.7, 3.6 e 2.7
- API de hipermídia RESTful
- Baseado no Web-Framework Zope
- Banco de dados: "Zope Object Database" (ZODB) ou ORM & SQL/Postgres/Oracle
- Funciona em Linux, Mac OS, BSD, Solaris, NixOS e Windows

O Plone tem uma infinidade de recursos poderosos, é facilmente acessível aos editores, mas também divertido para os programadores.

- Gerenciamento de conteúdo colaborativo e orientado por fluxo de trabalho
- Segurança e Controle de Acesso exigido pela Indústria
- Extensibilidade Ilimitada

```{Observação}
A arquitetura de componentes modulares e abertos do Plone permite que você altere ou amplie o Plone em todos os aspectos!
```

## Fundamentos do Plone 5

### Atravessar (Traversal)

O conteúdo do Plone é organizado como uma árvore. Atravessar significa procurar o conteúdo desta árvore pelo caminho. Quando uma requisição HTTP atinge um servidor Plone, o Plone irá percorrer o item de conteúdo correspondente e sua função de visualização por URI.

- Plone usa Traversal (portal/pasta/documento) ao invés de Routing (Roteamento)
- Objetos Python em uma árvore de objetos que se parece com um enorme dicionário aninhado:

```python
{'site': {'folder': {'page': page_object}}}
```

- Os objetos podem ser acessados ​​como caminhar por um sistema de arquivos:

```python
root['site']['folder']['page']
```

```python
>>> from plone import api
>>> portal = api.portal.get()
>>> portal.keys()
['folder1', 'document1']
>>> portal['folder1']
<Folder at xxxx>
```

### Publicação de objetos

Objetos podem ser chamados e retornar uma representação de si mesmos - geralmente html.

```python
>>> obj = portal['folder1']['a-newsitem']
>>> obj
<NewsItem at xxx>
>>> obj()
u'\n<!DOCTYPE html>\n\n<html xmlns="http://www.w3.org/1999/xhtml...'
```

### Conteúdo orientado a esquemas

O Plone vem com uma lista de tipos de conteúdo pré-definidos.

Os tipos de conteúdo são definidos em modelos/esquemas. Um esquema pode definir campos para armazenar dados.

Os valores desses campos em instâncias de objetos são atributos

```python
>>> obj.title
u'A Newsitem'
>>> obj.description
u'Some description'
>>> obj.description = u'A new description'
>>> obj.description
u'A new description'
>>> obj.image
<plone.namedfile.file.NamedBlobImage object at 0x11634c320>
>>> obj.image.data
'\x89PNG\r\n\x1a\n\x00\x00\x00\...'
```

Os objetos podem ter vários esquemas. Esquemas adicionais são chamados de comportamentos. Eles devem ser usados ​​em vários tipos.

```python
>>> from plone.dexterity.utils import iterSchemata
>>> [i for i in iterSchemata(self.context)]
[<InterfaceClass plone.dexterity.schema.generated.Plone_0_News_1_Item>,
 <SchemaClass plone.app.dexterity.behaviors.metadata.IDublinCore>,
 <SchemaClass plone.app.contenttypes.behaviors.richtext.IRichText>,
 <SchemaClass plone.app.dexterity.behaviors.discussion.IAllowDiscussion>,
 <SchemaClass plone.app.dexterity.behaviors.id.IShortName>,
 <SchemaClass plone.app.dexterity.behaviors.exclfromnav.IExcludeFromNavigation>,
 <SchemaClass plone.app.relationfield.behavior.IRelatedItems>,
 <SchemaClass plone.app.contenttypes.behaviors.leadimage.ILeadImage>,
 <SchemaClass plone.app.versioningbehavior.behaviors.IVersionable>]
```

Cada esquema pode definir campos

```python
>>> from plone.dexterity.utils import iterSchemata
>>> from zope.schema import getFieldsInOrder
>>> [getFieldsInOrder(schema) for schema in iterSchemata(obj)]
[[],
 [('title', <zope.schema._bootstrapfields.TextLine object at 0x114f1e790>),
  ('description', <zope.schema._bootstrapfields.Text object at 0x114f1e7d0>),
  ('subjects', <zope.schema._field.Tuple object at 0x114f1e990>),
  ('language', <zope.schema._field.Choice object at 0x114f1ea10>),
  ('effective', <zope.schema._field.Datetime object at 0x114f1eb90>),
  ('expires', <zope.schema._field.Datetime object at 0x114f1ec10>),
  ('creators', <zope.schema._field.Tuple object at 0x114e09750>),
  ('contributors', <zope.schema._field.Tuple object at 0x114f1ef10>),
  ('rights', <zope.schema._bootstrapfields.Text object at 0x114f1efd0>)],
 [('text', <plone.app.textfield.RichText object at 0x115215810>)],
 [('allow_discussion', <zope.schema._field.Choice object at 0x11553c590>)],
 [('id', <zope.schema._field.ASCIILine object at 0x11553cc50>)],
 [('exclude_from_nav', <zope.schema._bootstrapfields.Bool object at 0x11552f090>)],
 [('relatedItems', <z3c.relationfield.schema.RelationList object at 0x11556c710>)],
 [('image', <plone.namedfile.field.NamedBlobImage object at 0x114b2a750>),
  ('image_caption', <zope.schema._bootstrapfields.TextLine object at 0x114b2a410>)],
 [('changeNote', <zope.schema._bootstrapfields.TextLine object at 0x11599b350>),
  ('versioning_enabled', <zope.schema._bootstrapfields.Bool object at 0x11599b410>)]]
```
O Plone cria formulários a partir desses esquemas para adicionar e editar conteúdo.

### Arquitetura de componentes

- A lógica do Plone é conectada por uma arquitetura de componentes.
- Um sistema conectável de interfaces, adaptadores, utilitários, eventos e registros.
- Zope Component Architecture - ZCA: Uma estrutura Python para suportar design e programação baseados em componentes
- zope.interface 
- zope.event 
- zope.component