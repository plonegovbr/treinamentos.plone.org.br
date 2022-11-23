---
myst:
  html_meta:
    "description": "Instalando o Plone para o Treinamento"
    "property=og:description": "Instalando o Plone para o Treinamento"
    "property=og:title": "Instalando o Plone para o Treinamento"
    "keywords": "Intalação, Plone"
---

(plone5-instructions-label)=

# Instalando o Plone para o Treinamento

## Requisitos

Lembre-se de que você precisa de uma conexão rápida com a Internet durante a instalação, pois terá que baixar muitos dados!

Se você tem experiência em rodar o Plone em seu próprio laptop, nós o encorajamos a fazê-lo porque você terá alguns benefícios:
- Você pode usar o editor que está acostumado. 
- Você pode usar omelette para ter todo o código do Plone na ponta dos dedos. 
- Você não precisa alternar entre diferentes sistemas operacionais durante o treinamento.

Se você se sentir confortável, por favor, trabalhe em sua própria máquina com seu próprio Python.

No Ubuntu/Debian, você precisa ter certeza de que seu sistema está atualizado:

```shell
$ sudo apt update
$ sudo apt -y upgrade
```

Então, você precisa instalar os seguintes pacotes:

```shell
$ sudo apt install build-essential libssl-dev libxml2-dev libxslt1-dev libbz2-dev libjpeg62-dev
$ sudo apt install libreadline-dev wv poppler-utils
$ sudo apt install git
```

Para mais informações ou em caso de problemas, consulte as instruções oficiais de instalação.

## Instalando e Configurando o Pyenv

O Pyenv é um gerenciador de ambientes Python.

De maneira resumida, é uma ferramenta que te permite escolher entre diversas versões do Python para usar.

De acordo com o repositório oficial da ferramenta no GitHub, para instalar o Pyenv, precisamos digitar no terminal o seguinte comando:

```shell
$ curl https://pyenv.run | bash
```

Agora vamos abrir o$ n arquivo .bashrc

```shell
$ nano ~/.bashrc
```
e acrescentar ao final do arquivo essas linhas:

```shell
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
```

Agora basta reiniciar o Shell, fechando a janela do Terminal e abrindo outra, ou digitar o comando

```shell
$ exec $SHELL
```

A partir de agora podemos escolher qual versão do Python instalar com a ajuda do Pyenv. Para isso basta digitar,

```shell
$ pyenv install -list
```

### Plugin pyenv-virtualenv para pyenv

Clone o repositório do pyenv-virtualenv para a pasta de plugins do pyenv:

```shell
$ git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
``` 

(OPCIONAL) Adicione pyenv virtualenv-init ao seu shell para habilitar a ativação automática de virtualenvs. Isso é totalmente opcional, mas bastante útil. Consulte "Ativar virtualenv" abaixo.

```shell
$ echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
```

Reinicie seu shell para habilitar pyenv-virtualenv

```shell
$ exec "$SHELL"
```

Usando pyenv-virtualenv com pyenv

```shell
$ pyenv install 3.8.13
$ pyenv virtualenv 3.8.13 plone5
```

O pyenv instala os ambientes virtuais na pasta ~/.pyenv/versions, então o ambiente que acabamos de criar vai estar disponível em ~/.pyenv/versions/plone5.

Listar virtualenvs existentes

```shell
$ pyenv virtualenvs
```

Ativar e desativar um virtualenv

```shell
$ pyenv activate <name>
$ pyenv deactivate
```

## Instalar o Plone 5

Configure o Plone para o treinamento:

```shell
~/$ mkdir abc
~/$ cd abc
~/abc$ git clone https://github.com/collective/training_buildout.git plone5
~/abc/plone5$ cd plone5
~/abc/plone5$ git checkout plone5
~/abc/plone5$ ln -s ~/.pyenv/versions/plone5/bin/ ./bin
~/abc/plone5$ source bin/activate
(plone5) ~/abc/plone5$ pip install -r requirements.txt
```

Clonamos o repositório do treinamento do github para a pasta plone5 dentro do diretório abc. Realizamos um checkout para os arquivos destinados ao treinamento do Plone 5, criamos um link simbólico para o diretório do virtualenv que criamos anteriormente com pyenv virtualenv. Ativamos o virtualenv plone5 criando anteriormente  e instalamos alguns requisitos nele. 

Agora você pode executar o buildout pela primeira vez:

```shell
(plone5) ~/abc/plone5$ ./bin/buildout
```

Isso levará muito tempo (~ 10 minutos no Linode menos poderoso) e produzirá muita saída porque baixa e configura mais de 260 pacotes Python. 
Feito isso, você pode iniciar sua instância do Plone com o seguinte comando.

```shell
(plone5) ~/abc/plone5$ ./bin/instance fg
```

A saída deve ser semelhante a:

```{code-block} console
:emphasize-lines: 41
(plone5) ~/abc/plone5$ ./bin/instance fg
 
2019-09-05 20:11:03,708 WARNING [Init:89][MainThread] Class Products.CMFFormController.ControllerPythonScript.ControllerPythonScript has a security declaration for nonexistent method 'ZPythonScriptHTML_changePrefs'
2019-09-05 20:11:03,715 WARNING [Init:89][MainThread] Class Products.CMFFormController.ControllerValidator.ControllerValidator has a security declaration for nonexistent method 'ZPythonScriptHTML_changePrefs'
2019-09-05 20:11:03,776 WARNING [Products.PDBDebugMode:31][MainThread]
 
******************************************************************************
 
Debug-Mode enabled!
 
This will result in a pdb when a exception happens.
Turn off debug mode or remove Products.PDBDebugMode to disable.
See https://pypi.python.org/pypi/Products.PDBDebugMode
 
******************************************************************************
 
2019-09-05 20:11:04,858 INFO    [chameleon.config:38][MainThread] directory cache: /Users/pbauer/workspace/training_buildout/var/cache.
2019-09-05 20:11:07,151 WARNING [plone.behavior:172][MainThread] Specifying 'for' in behavior 'Tiles' if no 'factory' is given has no effect and is superfluous.
2019-09-05 20:11:08,353 WARNING [PrintingMailHost:30][MainThread] Hold on to your hats folks, I'm a-patchin'
2019-09-05 20:11:08,353 WARNING [PrintingMailHost:124][MainThread]
 
******************************************************************************
 
Monkey patching MailHosts to print e-mails to the terminal.
 
This is instead of sending them.
 
NO MAIL WILL BE SENT FROM ZOPE AT ALL!
 
Turn off debug mode or remove Products.PrintingMailHost from the eggs
or remove ENABLE_PRINTING_MAILHOST from the environment variables to
return to normal e-mail sending.
 
See https://pypi.python.org/pypi/Products.PrintingMailHost
 
******************************************************************************
 
2019-09-05 20:11:08,390 INFO    [Zope:45][MainThread] Ready to handle requests
Starting server in PID 30620.
 
Serving on http://0.0.0.0:8080

```

Se a saída disser Servindo em http://0.0.0.0:8080, você está pronto.

Se você apontar seu navegador para [http://0.0.0.0:8080](http://localhost:8080) você verá que o Plone está rodando.
