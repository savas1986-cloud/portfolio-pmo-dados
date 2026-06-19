# OKRs e KPIs — Painel de Produtividade
**Autora:** Patricia Vasconcelos · **Contexto:** TechFinance S.A.
**Ciclo:** Jun/2026 – Ago/2026 · **Data:** Junho/2026

> Documento de definição de objetivos estratégicos e indicadores
> operacionais para implantação do Painel de Produtividade —
> consolidando Jira, ServiceNow SPM/ITSM e Databricks em um
> único dashboard Power BI.

---

## Distinção aplicada ao projeto

| Conceito | Pergunta que responde | Exemplo neste projeto |
|---|---|---|
| OKR | Onde o projeto precisa chegar? | Eliminar relatórios manuais em Excel |
| KPI dos KRs | Como sabemos que chegamos? | 0 relatórios manuais após go-live |
| KPI operacional | O projeto está saudável? | % de pipelines em produção |
| KPI do painel | O que o dashboard mede? | Deployment Frequency por squad |

---

## OKRs do Projeto

### O1 — Consolidar as fontes de dados em produção

*Eliminar a fragmentação de dados entre Jira, ServiceNow e Excel,
criando uma única fonte de verdade no Databricks.*

| # | Key Result | Meta | Prazo |
|---|---|---|---|
| KR1 | % de fontes integradas ao Databricks | 100% | 31/07/2026 |
| KR2 | Disponibilidade do pipeline em produção | ≥ 95% | Semanas 1–4 |
| KR3 | Relatórios manuais em Excel em uso | 0 | 30 dias após go-live |

> **Por que KR3 é o mais importante:** a extinção do processo
> manual é a prova definitiva de que o projeto gerou valor real.

---

### O2 — Garantir qualidade e rastreabilidade dos dados

*Assegurar que os dados exibidos no painel são confiáveis,
documentados e auditáveis — pré-requisito para adoção e
conformidade regulatória no setor financeiro.*

| # | Key Result | Meta | Prazo |
|---|---|---|---|
| KR1 | Taxa de erros no pipeline por semana | < 2% | Contínuo |
| KR2 | Colunas documentadas no dicionário de dados | 100% | Go-live |
| KR3 | Carga batch concluída até 07h em dias úteis | ≥ 90% | Contínuo |

> **Por que KR2 é crítico no setor financeiro:** auditoria interna
> e órgãos reguladores exigem rastreabilidade. Coluna sem
> documentação é risco regulatório, não só técnico.

---

### O3 — Garantir adoção real pelos squads

*Transformar o painel em ferramenta de decisão — não apenas
uma entrega técnica. Sucesso é medido pelo uso, não pela publicação.*

| # | Key Result | Meta | Prazo |
|---|---|---|---|
| KR1 | Líderes de divisão acessando semanalmente | ≥ 80% | 30 dias pós go-live |
| KR2 | NPS interno do painel | ≥ 7 | 30 dias pós go-live |
| KR3 | Solicitações de relatório manual após go-live | 0 | 60 dias pós go-live |

> **Por que NPS e não apenas acessos:** acesso mede visita.
> NPS mede valor percebido. Um dashboard acessado uma vez
> e nunca mais aberto não gerou impacto.

---

## KPIs Operacionais do Projeto

| KPI | Fórmula | Meta | Frequência |
|---|---|---|---|
| % de pipelines em produção | Pipelines entregues / Planejados | 100% até 31/07 | Semanal |
| Cobertura do dicionário | Colunas documentadas / Total | 100% no go-live | Quinzenal |
| Taxa de erros no pipeline | Erros / Total de execuções | < 2% | Semanal |
| MTTR do pipeline | Tempo de resolução / Nº de incidentes | < 4h | Por incidente |
| Taxa de adoção semanal | Squads com acesso / Total de squads | ≥ 80% | Semanal (pós go-live) |

> **Nota sobre o MTTR:** este KPI aparece também como indicador
> medido pelo painel. Aplicar a mesma métrica ao projeto demonstra
> consistência de governança — o PMO mede a si mesmo com os
> mesmos critérios que define para os squads.

---

## KPIs medidos pelo Painel de Produtividade

| KPI | Tipo | Dimensões | Granularidade |
|---|---|---|---|
| Deployment Frequency | KPI estratégico | Divisão · Squad · Período | Diária |
| Change Failure Rate | KPI estratégico | Divisão · Squad · Período | Semanal |
| Cycle Time de Issues | KPI estratégico | Divisão · Squad · Tribo | Semanal |
| MTTR | KPI estratégico | Divisão · Squad · Período | Diária |
| Volume de Squads | Métrica de contexto | Divisão · Domínios de Negócio | Mensal |

---

## Gap crítico — dependência de pipeline externo

| Situação | Impacto | Plano de contingência |
|---|---|---|
| Pipeline entregue até 30/06/2026 | Desenvolvimento completo em julho | — |
| Pipeline com atraso | KPIs de chamados indisponíveis no go-live | Dashboard MVP com Jira + SPM. Integração completa em fase 2 |

---

*Documento elaborado com os conceitos de OKR, KPI, granularidade,
SLA de dados e governança aplicados ao contexto de empresa de
tecnologia no setor financeiro regulado. Junho/2026*
