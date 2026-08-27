<?xml version="1.0" encoding="UTF-8"?>
<!-- Torna os feeds RSS legíveis quando abertos num browser (que já não renderiza
     RSS nativamente). Progressive enhancement: leitores de feeds ignoram isto. -->
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:atom="http://www.w3.org/2005/Atom">
<xsl:output method="html" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">
<html lang="pt-PT">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title><xsl:value-of select="/rss/channel/title"/> — feed</title>
  <style>
    :root { --fundo:#fafaf8; --texto:#1a2332; --suave:#5a6572; --primario:#14385c;
            --cartao:#ffffff; --borda:#e3e1da; --verde:#1e6b4f; --verde-fundo:#e8f3ee; }
    @media (prefers-color-scheme: dark) {
      :root { --fundo:#14181f; --texto:#e8eaf0; --suave:#9aa5b5; --primario:#8ab8e8;
              --cartao:#1c222c; --borda:#2b3442; --verde:#7fc9a8; --verde-fundo:#1a2e26; }
    }
    body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
           background: var(--fundo); color: var(--texto); margin: 0; padding: 1rem;
           line-height: 1.55; }
    main { max-width: 46rem; margin: 0 auto; }
    a { color: var(--primario); }
    .aviso { background: var(--verde-fundo); border: 1px solid var(--verde);
             border-radius: 8px; padding: 1rem 1.25rem; margin: 1rem 0 2rem; }
    .aviso strong { color: var(--verde); }
    .aviso ul { margin: .5rem 0 0; padding-left: 1.2rem; }
    .aviso code { background: var(--cartao); border: 1px solid var(--borda);
                  border-radius: 4px; padding: .1rem .35rem; word-break: break-all; }
    h1 { font-size: 1.4rem; margin: 0 0 .25rem; }
    h1 a { text-decoration: none; }
    .desc { color: var(--suave); margin: 0 0 1.5rem; }
    article { background: var(--cartao); border: 1px solid var(--borda);
              border-radius: 8px; padding: 1rem 1.25rem; margin-bottom: 1rem; }
    article h2 { font-size: 1.05rem; margin: 0 0 .35rem; }
    article h2 a { text-decoration: none; }
    .data { color: var(--suave); font-size: .8rem; margin: 0 0 .5rem; }
    .resumo { margin: 0 0 .5rem; white-space: pre-line; }
    .cats span { display: inline-block; font-size: .72rem; border: 1px solid var(--borda);
                 border-radius: 999px; padding: .05rem .55rem; margin: 0 .25rem .25rem 0;
                 color: var(--suave); }
    footer { color: var(--suave); font-size: .8rem; margin: 2rem 0 1rem; }
  </style>
</head>
<body>
<main>
  <div class="aviso">
    <strong>Isto é um feed RSS — está tudo bem, não é um erro.</strong>
    <p style="margin:.4rem 0 0">Um feed serve para receber as atualizações automaticamente,
    sem visitar o site. Duas formas fáceis de o usar:</p>
    <ul>
      <li><strong>Por email (grátis):</strong>
        <a><xsl:attribute name="href">https://blogtrottr.com/?subscribe=<xsl:value-of select="/rss/channel/atom:link[@rel='self']/@href"/></xsl:attribute>subscrever via Blogtrottr</a>
        — recebe estes itens na sua caixa de correio.</li>
      <li><strong>Num leitor de feeds</strong> (Feedly, NetNewsWire, Inoreader…):
        copie o endereço desta página —
        <code><xsl:value-of select="/rss/channel/atom:link[@rel='self']/@href"/></code>
        — e cole-o no leitor.</li>
    </ul>
  </div>

  <h1><a><xsl:attribute name="href"><xsl:value-of select="/rss/channel/link"/></xsl:attribute><xsl:value-of select="/rss/channel/title"/></a></h1>
  <p class="desc"><xsl:value-of select="/rss/channel/description"/></p>

  <xsl:for-each select="/rss/channel/item">
    <article>
      <h2><a><xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute><xsl:value-of select="title"/></a></h2>
      <p class="data"><xsl:value-of select="pubDate"/></p>
      <p class="resumo"><xsl:value-of select="description"/></p>
      <p class="cats">
        <xsl:for-each select="category"><span><xsl:value-of select="."/></span></xsl:for-each>
      </p>
    </article>
  </xsl:for-each>

  <footer>Lei em Dia — resumos gerados com apoio de IA; faz fé o texto oficial do
    Diário da República. <a><xsl:attribute name="href"><xsl:value-of select="/rss/channel/link"/></xsl:attribute>Voltar ao site</a></footer>
</main>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
