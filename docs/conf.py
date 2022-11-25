# Arquivo de configuração para o construtor de documentação Sphinx.
# Arquivo de configuração da compilação da documentação dos Treinamentos de Plone


# -- Configuração do Caminho (Path setup) --------------------------------------------------------------

from datetime import datetime

# Se as extensões (ou módulos para documentar com autodoc) estiverem em outro diretório, 
# adicione esses diretórios ao sys.path aqui. Se o diretório for relativo à 
# raiz da documentação, use os.path.abspath para torná-lo absoluto, como mostrado aqui.
#
# import os
# import sys
# sys.path.insert(0, os.path.abspath("."))


# -- Informações do Projeto -----------------------------------------------------

project = "Treinamentos de Plone"
copyright = ""
author = "Comunidade PloneGovBr"
trademark_name = "Plone"

now = datetime.now()
year = str(now.year)
version = year
release = year

# -- Configuração geral ----------------------------------------------------

templates_path = ["_templates"]

extensions = [
    "myst_parser",
    "sphinx.ext.autodoc",
    "sphinx.ext.intersphinx",
    "sphinx.ext.todo",
    "sphinx_copybutton",
    "sphinx_design",
    "sphinx_sitemap",
    "sphinxcontrib.spelling",
    "sphinxext.opengraph",
]

myst_enable_extensions = [
    "deflist",  
    "linkify",  
    "colon_fence",
]

smartquotes = False

pygments_style = "sphinx"

linkcheck_ignore = [
    r"http://localhost",
    r"http://127.0.0.1",
    r"http://example.com",
    r"https://github.com/plone/training/issues/new/choose",
    r"https://www.linode.com",  
    r"https://www.virtualbox.org",  
    r"https://docs.github.com/en/get-started/.*",  
    r"https://github.com/plone/mockup/blob/master/mockup/.jshintrc",
    r"https://www.chef.io/products/chef-infra/",  
    r"https://plonedemo.kitconcept.com",  
    r"https://www.packtpub.com/.*",  
    r"https://www.dipf.de/.*",  
    r"https?://plone-conference.localhost.*",
    
    "https://domain-a.com/data.json",
    "https://domain-b.com/data.json",
    
    "https://github.com/collective/awesome-volto#addons",
    "https://github.com/collective/collective.easyform#collectivez3cformnorobots-support",
    "https://github.com/collective/collective.easyform#recaptcha-support",
    "https://github.com/collective/collective.recipe.solrinstance/blob/master/README.rst#multi-core-solr",
    "https://github.com/nvm-sh/nvm#install-script",
    "https://github.com/plone/plone.app.contentlisting/#methods-of-contentlistingobjects",
    "https://github.com/plone/plone.app.contenttypes#changing-the-base-class-for-existing-objects",
    "https://github.com/plone/plone.recipe.zope2instance#advanced-logging-options-for-wsgi",
    "https://github.com/repoze/repoze.catalog/blob/master/docs/usage.rst#query-objects",
    "https://plone.github.io/mockup/dev/#pattern/autotoc",
    "https://plone.github.io/mockup/dev/#pattern/modal",
    "https://plone.github.io/mockup/dev/#pattern/moment",
    "https://github.com/collective/collective.exportimport#faq-tips-and-tricks",
    "https://github.com/plone/plone.app.contenttypes/tree/2.2.x#migration",
    "https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html#Keywords",
    "https://solr.apache.org/guide/8_2/updatehandlers-in-solrconfig.html#UpdateHandlersinSolrConfig-commitWithin",
    "https://www.npmjs.com/package/axios#example",
    "https://github.com/plone/plone.restapi/blob/afde2a940d2518e061eb3fe30093093af55e3a50/src/plone/restapi/services/content/configure.zcml#L15-L20",
    "https://github.com/plone/plone.rest#cors",
    "https://github.com/plone/plone.docker#for-basic-usage",
    "https://github.com/nodejs/release#release-schedule",
]
linkcheck_allowed_redirects = {
    r"https://chrome\.google\.com/webstore/detail/.*": r"https://consent\.google\.com/.*",
}
linkcheck_anchors = True
linkcheck_timeout = 10
linkcheck_retries = 2

spelling_word_list_filename = "spelling_wordlist.txt"
spelling_ignore_pypi_package_names = True

source_suffix = {
    ".md": "markdown",
}

master_doc = "index"

exclude_patterns = [
    "spelling_wordlist.txt",
]


# -- Opções para saída HTML -------------------------------------------------

html_theme = "sphinx_book_theme"

html_logo = "_static/logo.svg"
html_favicon = "_static/favicon.ico"

html_css_files = ["custom.css", ("print.css", {"media": "print"})]
html_js_files = [
    "patch_scrollToActive.js",
]

html_extra_path = [
    "robots.txt",
]

html_baseurl = "https://treinamentos.plone.org.br"
sitemap_url_scheme = "{link}"

html_static_path = ["_static"]

html_theme_options = {
    "repository_url": "https://github.com/plonegovbr/treinamentos",
    "repository_branch": "main",
    "path_to_docs": "docs",
    "use_repository_button": True,
    "use_issues_button": True,
    "use_edit_page_button": True,
    "extra_navbar": f"""
        <p class="ploneorglink">
            <a href="https://plone.org.br">
                <img src="{html_baseurl}/_static/logo.svg" alt="plone.org.br" /> plone.org.br</a>
        </p>""",
}


# -- Configuração Intersphinx  ----------------------------------

intersphinx_mapping = {
    "plonedocs": ("https://docs.plone.org/", None),
    "plone6docs": ("https://6.dev-docs.plone.org/", None),
    "python": ("https://docs.python.org/3/", None),
}


# -- Configuração GraphViz ----------------------------------

graphviz_output_format = "svg"


# -- Configuração OpenGraph ----------------------------------

ogp_site_url = "https://treinamentos.plone.org.br"
ogp_description_length = 200
ogp_image = "https://treinamentos.plone.org.br/_static/Plone_logo_square.png"
ogp_site_name = "Treinamentos Plone"
ogp_type = "website"
ogp_custom_meta_tags = [
    '<meta property="og:locale" content="pt_BR" />',
]

# -- sphinx_copybutton -----------------------
copybutton_prompt_text = r"^ {0,2}\d{1,3}"
copybutton_prompt_is_regexp = True


# -- sphinx.ext.todo -----------------------
todo_include_todos = True


def source_replace(app, docname, source):
    result = source[0]
    for key in app.config.source_replacements:
        result = result.replace(key, app.config.source_replacements[key])
    source[0] = result


source_replacements = {
    "{PLONE_BACKEND_VERSION}": "6.0.0b3",
}


def setup(app):
    app.add_config_value("source_replacements", {}, True)
    app.connect("source-read", source_replace)