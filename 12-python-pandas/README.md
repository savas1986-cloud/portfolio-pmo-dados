# Projeto 12 — Análise de Demandas em Python (Pandas)

**Contexto:** Reprodução das análises do Painel de Produtividade (Power BI)
usando Python e Pandas, a partir do dataset bruto normalizado em 6 tabelas
(Star Schema). O mesmo conjunto de 420 demandas já analisado em SQL, Power BI
e Excel — agora tratado em Pandas.

**O que entrega:** Notebook documentado que carrega os 6 CSVs, reconstrói o
Star Schema via merge, trata os dados e reproduz os indicadores do dashboard —
validando os números contra o Painel já publicado.

**Por que importa:** Para um PMO de Dados, Python não precisa ser dominado como
desenvolvedor — mas ler código, abrir um notebook e estimar a complexidade de
uma demanda de dados é competência de literacia essencial. Este projeto mostra
que a consistência dos indicadores independe da ferramenta.

**Habilidades demonstradas:** Pandas (read_csv, merge, groupby, crosstab) ·
Reconstrução de Star Schema · Tratamento de dados (encoding, separadores,
tipos) · Análise de SLA com datas · Visualização (matplotlib) · Validação
cruzada entre ferramentas

**Ferramentas:** Python · Pandas · Matplotlib · Jupyter (VS Code / Google Colab)
**Status:** ✅ Concluído — notebook documentado e publicado

---

## 📓 Notebook

[`analise_demandas.ipynb`](./analise_demandas.ipynb) — renderiza direto no
GitHub, com narrativa, código e gráficos.

Dados de apoio: [`demandas_tratado.csv`](./demandas_tratado.csv) — as 420
demandas já com merge e limpeza aplicados (permite reproduzir a análise sem
refazer o tratamento).

---

## 🔄 Etapas da análise

| # | Etapa | Técnica |
|---|---|---|
| 1 | Importação dos 6 CSVs | `read_csv` (encoding + separador) |
| 2 | Reconstrução do Star Schema | 5 `merge` (LEFT JOIN) |
| 3 | Limpeza | seleção de colunas + `rename` |
| 4 | Agregações | `groupby` · `crosstab` |
| 5 | Análise de SLA | `to_datetime` + comparação de datas |
| 6 | Visualização | `matplotlib` (barras) |

---

## 🎯 Resultado — validação cruzada

A análise em Pandas reproduz os indicadores do Painel de Produtividade:

- **420 demandas** · distribuição por squad idêntica ao dashboard
- **SLA: 228 de 301 demandas fechadas = 75,75%** — idêntico ao card do Painel

O SLA usa como base as demandas **fechadas** (301), não o total (420): demandas
em aberto não têm cumprimento de prazo a avaliar.

📄 Estudo completo do módulo: [modulo-6-python-pandas.html](https://savas1986-cloud.github.io/portfolio-pmo-dados/Estudos/modulo-5-powerbi-dax.html)

---

*Desenvolvido no Módulo 6 do roteiro de estudos PMO de Dados. Dados sintéticos —
TechFinance S.A. (contexto fictício). Julho/2026*
