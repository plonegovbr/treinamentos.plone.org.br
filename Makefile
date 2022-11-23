# Makefile para a documentação do Sphinx
#

# Você pode definir essas variáveis ​​na linha de comando.
SPHINXOPTS    = 
SPHINXBUILD     = $(realpath bin/sphinx-build)
SPHINXAUTOBUILD = $(realpath bin/sphinx-autobuild)
PAPER         =
DOCS_DIR      = ./docs/
BUILDDIR      = ../_build/

# Variáveis ​​internas.
PAPEROPT_a4     = -D latex_paper_size=a4
PAPEROPT_letter = -D latex_paper_size=letter
ALLSPHINXOPTS   = -d $(BUILDDIR)/doctrees $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) .
# o construtor i18n não pode compartilhar o ambiente e doctrees com os outros
I18NSPHINXOPTS  = $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) .


# Adicione o seguinte alvo 'ajuda' ao seu Makefile
# E adicione texto de ajuda após cada nome de destino começando com '\#\#'
.PHONY: help
help: ## Esta mensagem de ajuda
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: clean
clean: ## Esta mensagem de ajuda
	cd $(DOCS_DIR) && rm -rf $(BUILDDIR)/*

.PHONY: distclean
distclean:  ## Diretório de construção de documentos limpos e ambiente virtual Python
	cd $(DOCS_DIR) && rm -rf $(BUILDDIR)/
	rm -rf ./bin/ ./lib/ ./lib64 ./include ./pyvenv.cfg

bin/python:  ## Set up training: Install requirements
	python3 -m venv . || virtualenv --clear --python=python3 .
	bin/python -m pip install --upgrade pip
	bin/pip install -r requirements.txt
	@echo
	@echo "Instalação de requisitos concluída."

.PHONY: html
html: bin/python  ## Construir html
	cd $(DOCS_DIR) && $(SPHINXBUILD) -b html $(ALLSPHINXOPTS) $(BUILDDIR)/html
	@echo
	@echo "Construção finalizada. As páginas HTML estão em $(BUILDDIR)/html."

.PHONY: livehtml
livehtml: bin/python  ## Reconstrua a documentação do Sphinx sobre alterações, com atualização ao vivo no navegador
	cd "$(DOCS_DIR)" && $(SPHINXAUTOBUILD) \
		--ignore "*.swp" \
		-b html . "$(BUILDDIR)/html" $(SPHINXOPTS) $(O)

.PHONY: manual
manual: bin/python
	cd $(DOCS_DIR) && $(SPHINXBUILD) -b html -t manual . manual

.PHONY: presentation
presentation: bin/python  ## Construir html para apresentação
	cd $(DOCS_DIR) && $(SPHINXBUILD) -b html -t presentation . $(BUILDDIR)/presentation

.PHONY: livepresentation
livepresentation: bin/python  ## Reconstrua a documentação do Sphinx sobre alterações, com atualização ao vivo no navegador
	cd "$(DOCS_DIR)" && $(SPHINXAUTOBUILD) \
		--ignore "*.swp" \
		-b html -t presentation . "$(BUILDDIR)/presentation" $(SPHINXOPTS) $(O)

.PHONY: dirhtml
dirhtml: bin/python
	cd $(DOCS_DIR) && $(SPHINXBUILD) -b dirhtml $(ALLSPHINXOPTS) $(BUILDDIR)/dirhtml
	@echo
	@echo "Construção finalizada. A página HTML está em $(BUILDDIR)/dirhtml."

.PHONY: singlehtml
singlehtml: bin/python
	cd $(DOCS_DIR) && $(SPHINXBUILD) -b singlehtml $(ALLSPHINXOPTS) $(BUILDDIR)/singlehtml
	@echo
	@echo "Construção finalizada. As páginas HTML estão em $(BUILDDIR)/singlehtml."

.PHONY: pickle
pickle: bin/python
	cd $(DOCS_DIR) && $(SPHINXBUILD) -b pickle $(ALLSPHINXOPTS) $(BUILDDIR)/pickle
	@echo
	@echo "Construção finalizada; agora você pode processar os arquivos de picles."

.PHONY: json
json: bin/python
	cd $(DOCS_DIR) && $(SPHINXBUILD) -b json $(ALLSPHINXOPTS) $(BUILDDIR)/json
	@echo
	@echo "Construção finalizada; agora você pode processar os arquivos JSON."

.PHONY: htmlhelp
htmlhelp: bin/python
	cd $(DOCS_DIR) && $(SPHINXBUILD) -b htmlhelp $(ALLSPHINXOPTS) $(BUILDDIR)/htmlhelp
	@echo
	@echo "Construção finalizada; agora você pode executar o HTML Help Workshop com o" \
	      ".hhp arquivo de projeto em $(BUILDDIR)/htmlhelp."

.PHONY: qthelp
qthelp: bin/python
	cd $(DOCS_DIR) && $(SPHINXBUILD) -b qthelp $(ALLSPHINXOPTS) $(BUILDDIR)/qthelp
	@echo
	@echo "Construção finalizada; agora você pode correr "qcollectiongenerator" com o" \
	      ".qhcp arquivo de projeto em $(BUILDDIR)/qthelp, assim:"
	@echo "# qcollectiongenerator $(BUILDDIR)/qthelp/MasteringPlone.qhcp"
	@echo "Para visualizar o arquivo de ajuda:"
	@echo "# assistente -collectionFile $(BUILDDIR)/qthelp/MasteringPlone.qhc"

.PHONY: devhelp
devhelp: bin/python
	cd $(DOCS_DIR) && $(SPHINXBUILD) -b devhelp $(ALLSPHINXOPTS) $(BUILDDIR)/devhelp
	@echo
	@echo "Construção finalizada."
	@echo "Para visualizar o arquivo de ajuda:"
	@echo "# mkdir -p $$HOME/.local/share/devhelp/MasteringPlone"
	@echo "# ln -s $(BUILDDIR)/devhelp $$HOME/.local/share/devhelp/MasteringPlone"
	@echo "# devhelp"

.PHONY: epub
epub: bin/python
	cd $(DOCS_DIR) && $(SPHINXBUILD) -b epub $(ALLSPHINXOPTS) $(BUILDDIR)/epub
	@echo
	@echo "Construção finalizada. O arquivo epub está em $(BUILDDIR)/epub."

.PHONY: latex
latex: bin/python
	cd $(DOCS_DIR) && $(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) $(BUILDDIR)/latex
	@echo
	@echo "Construção finalizada; os arquivos LaTeX estão em $(BUILDDIR)/latex."
	@echo "Execute \`make' nesse diretório para executá-los através (pdf)latex" \
	      "(use \`make latexpdf' aqui para fazer isso automaticamente)."

.PHONY: latexpdf
latexpdf: bin/python
	cd $(DOCS_DIR) && $(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) $(BUILDDIR)/latex
	@echo "Executando arquivos LaTeX através pdflatex..."
	$(MAKE) -C $(BUILDDIR)/latex all-pdf
	@echo "pdflatex finalizado; os arquivos PDF estão em $(BUILDDIR)/latex."

.PHONY: text
text: bin/python
	cd $(DOCS_DIR) && $(SPHINXBUILD) -b text $(ALLSPHINXOPTS) $(BUILDDIR)/text
	@echo
	@echo "Construção finalizada. Os arquivos de texto estão em $(BUILDDIR)/text."

.PHONY: man
man: bin/python
	cd $(DOCS_DIR) && $(SPHINXBUILD) -b man $(ALLSPHINXOPTS) $(BUILDDIR)/man
	@echo
	@echo "Construção terminada. As páginas de manual estão em $(BUILDDIR)/man."

.PHONY: texinfo
texinfo: bin/python
	cd $(DOCS_DIR) && $(SPHINXBUILD) -b texinfo $(ALLSPHINXOPTS) $(BUILDDIR)/texinfo
	@echo
	@echo "Construção finalizada. Os arquivos Texinfo estão em $(BUILDDIR)/texinfo."
	@echo "Execute \`make' nesse diretório para executá-los através do makeinfo" \
	      "(use \`make info' aqui para fazer isso automaticamente)."

.PHONY: info
info: bin/python
	cd $(DOCS_DIR) && $(SPHINXBUILD) -b texinfo $(ALLSPHINXOPTS) $(BUILDDIR)/texinfo
	@echo "Executando arquivos Texinfo através do makeinfo..."
	make -C $(BUILDDIR)/texinfo info
	@echo "mmakeinfo finalizado; os arquivos Info estão em $(BUILDDIR)/texinfo."

.PHONY: changes
changes: bin/python
	cd $(DOCS_DIR) && $(SPHINXBUILD) -b changes $(ALLSPHINXOPTS) $(BUILDDIR)/changes
	@echo
	@echo "O arquivo de visão geral está em $(BUILDDIR)/changes."

.PHONY: linkcheck
linkcheck: bin/python  ## Executar linkcheck
	cd $(DOCS_DIR) && $(SPHINXBUILD) -b linkcheck $(ALLSPHINXOPTS) $(BUILDDIR)/linkcheck
	@echo
	@echo "Verificação de link concluída; procure por erros na saída acima " \
		"ou em $(BUILDDIR)/linkcheck/ ."

.PHONY: linkcheckbroken
linkcheckbroken: bin/python  ## Execute o linkcheck e mostre apenas links quebrados
	cd $(DOCS_DIR) && $(SPHINXBUILD) -b linkcheck $(ALLSPHINXOPTS) $(BUILDDIR)/linkcheck | GREP_COLORS='0;31' grep -wi "broken\|redirect" --color=auto || test $$? = 1
	@echo
	@echo "Verificação de link concluída; procure por erros na saída acima " \
		"ou em $(BUILDDIR)/linkcheck/ ."

.PHONY: spellcheck
spellcheck: bin/python  ## Executar verificação ortográfica
	cd $(DOCS_DIR) && LANGUAGE=$* $(SPHINXBUILD) -b spelling -j 4 $(ALLSPHINXOPTS) $(BUILDDIR)/spellcheck/$*
	@echo
	@echo "A verificação ortográfica está concluída; procure por erros na saída acima " \
		" ou em $(BUILDDIR)/spellcheck/ ."

.PHONY: html_meta
html_meta:
	python ./docs/addMetaData.py

.PHONY: doctest
doctest: bin/python
	cd $(DOCS_DIR) && $(SPHINXBUILD) -b doctest $(ALLSPHINXOPTS) $(BUILDDIR)/doctest
	@echo "Teste de doctests nas fontes finalizado, veja o " \
	      "resultado em $(BUILDDIR)/doctest/output.txt."

.PHONY: test
test: clean linkcheckbroken spellcheck  ## Executar linkcheckbroken, verificação ortográfica

.PHONY: deploy
deploy: clean html

.PHONY: netlify
netlify:
	pip install -r requirements.txt
	cd $(DOCS_DIR) && sphinx-build -b html $(ALLSPHINXOPTS) $(BUILDDIR)/html

.PHONY: all
all: clean spellcheck linkcheck html ## Executar verificações e construir html