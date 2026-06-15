# Glossário PMO de Dados
**Autora:** Patricia Vasconcelos · **Contexto:** F1RST — Santander Group  
**Módulo:** 0 — Fundamentos de Dados · **Data:** Junho/2026

> 23 termos essenciais com definição e aplicação no contexto bancário regulado.
> Vocabulário que diferencia um PMO que decora de um PMO que entende.

---

## Arquitetura de Dados

**Data Warehouse (DW)**
Repositório de dados estruturados com schema definido antes da carga.
Alta confiabilidade, custo elevado. Padrão para relatórios regulatórios
e histórico financeiro.
*No F1RST: usado para relatórios do Bacen e dados regulatórios.*

---

**Data Lake**
Armazenamento de dados brutos em qualquer formato. Schema definido
na leitura (schema on read). Escala massiva, custo baixo.
Risco: virar "data swamp" sem governança adequada.

---

**Lakehouse**
Combina Data Lake + Data Warehouse: armazena dado bruto mas adiciona
transações ACID e SQL analítico completo.
*No F1RST: o Databricks usa Delta Lake — é um Lakehouse, não um
Data Lake puro, embora o time use os dois termos como sinônimos.*

---

**ETL** (Extrair → Transformar → Carregar)
Transforma o dado num ambiente intermediário (staging) antes de
carregar no destino. Se falhar, o dado fica preso no staging —
o destino não recebe nada.
*No F1RST: usado em pipelines regulatórios (Bacen).*

---

**ELT** (Extrair → Carregar → Transformar)
Carrega o dado bruto no destino primeiro, transforma depois.
Se falhar, o dado já chegou — só a transformação não rodou.
Recuperação mais rápida.
*No F1RST: padrão no Databricks para análises do domínio de dados.*

---

## Métricas e Indicadores

**KPI** (Key Performance Indicator)
Métrica estratégica vinculada a um objetivo de negócio declarado.
Todo KPI é métrica — nem toda métrica é KPI.
*Exemplo: Deployment Frequency por squad.*

---

**OKR** (Objectives and Key Results)
Framework com 1 objetivo qualitativo + 2 a 5 resultados-chave
mensuráveis. Define onde chegar num ciclo trimestral ou semestral.
Diferente do KPI, que mede performance contínua.

---

**Métrica**
Qualquer valor mensurável. "Número de squads" é uma métrica.
"Cumprimento de SLA" é um KPI. A distinção está no vínculo
com um objetivo estratégico declarado.

---

**Dimensão**
Contexto pelo qual uma métrica é analisada: por squad, vertical,
região, período. É a dimensão que transforma um número em insight.
*Exemplo: taxa de inadimplência por segmento (Premium vs. Básico).*

---

**Granularidade**
Nível de detalhe dos dados. Granularidade fina (diária): mais
analítica. Granularidade grossa (mensal): perde detalhe permanente.
A escolha precisa entrar no escopo antes do dado ser persistido.

---

## Modelagem

**Tabela Fato**
Tabela central no modelo dimensional. Cada linha = 1 evento
mensurável (1 transação, 1 deploy, 1 chamado). Contém os valores
numéricos e as chaves para as dimensões.

---

**Modelagem Estrela** (Star Schema)
Esquema com 1 tabela fato central rodeada por tabelas dimensão.
Mais performático que o floco de neve (snowflake).
*Para Power BI: sempre estrela.*

---

## Business Intelligence

**BI** (Business Intelligence)
Conjunto de processos, tecnologias e ferramentas que transformam
dados brutos em informação útil para decisões de negócio.
Power BI é uma ferramenta de BI — não o BI em si.

---

**OLAP** (Online Analytical Processing)
Sistemas para analisar grandes volumes de dados históricos.
Lê muito, agrega, consolida. O Data Warehouse é o ambiente
OLAP por excelência.

---

**OLTP** (Online Transaction Processing)
Sistemas que registram transações com alta velocidade e consistência.
O sistema do Pix é OLTP. Escreve muito, lê pouco, linha por linha.

---

**Dashboard**
Painel com múltiplos visuais em uma tela para monitoramento rápido.
Foco em identificar anomalias — não é o lugar para análise profunda.

---

**Relatório**
Documento analítico com mais profundidade que o dashboard.
Várias páginas, tabelas e filtros. No Power BI, o arquivo .pbix
é o relatório — o dashboard é uma composição de visuais fixados.

---

**Scorecard**
Painel de acompanhamento de metas com indicadores de status
(✅ no prazo / ⚠️ atenção / ❌ atrasado).
Responde: "estamos no caminho certo para cada objetivo?"

---

## Navegação em Dashboards

**Drill-down**
Navegar de um nível agregado para um nível mais detalhado no mesmo
visual. Exemplo: Total Brasil → Sudeste → SP → Agência.

---

**Drill-through**
Navegar de um visual para uma página diferente do relatório
mantendo o contexto do item selecionado.
Exemplo: clicou num produto → abre a página de detalhe daquele produto.

---

**Slicer**
Filtro visual interativo no Power BI. Controla todos os outros
visuais da página. É um visual como qualquer outro, mas funciona
como controlador geral do dashboard.

---

## Processamento

**Real-time (Streaming)**
Dados processados assim que chegam. Necessário para alertas de
fraude e monitoramento ao vivo. Exige Kafka ou Event Hub —
arquitetura complexa e cara.
*Antes de aprovar: confirme se o solicitante precisa de minuto
a minuto ou se batch diário resolve.*

---

**Batch**
Dados acumulados e processados em bloco num horário agendado
(ex: toda noite às 2h). Padrão para a maioria dos dashboards
corporativos. Mais simples, estável e econômico que real-time.

---

*Glossário desenvolvido durante o Módulo 0 do roteiro de estudos
PMO de Dados — Junho/2026*
