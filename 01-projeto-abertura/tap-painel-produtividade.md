# Termo de Abertura de Projeto
## Painel de Produtividade F1RST

| Campo | Informação |
|---|---|
| **Data de Abertura** | 15/06/2026 |
| **Patrocinador** | Diretora de Produtividade / CIO Office |
| **Gerente do Projeto** | Patricia Vasconcelos (PMO de Dados) |
| **Área Solicitante** | Área de Produtividade |
| **Usuários Finais** | Todos os squads F1RST |
| **Status** | Em execução |

---

## 1. Objetivo do Projeto

Desenvolver dashboard analítico no Power BI para monitoramento
contínuo dos KPIs de produtividade das squads F1RST, consolidando
dados de Jira, ServiceNow SPM e ITSM no Databricks (Lakehouse),
com atualização batch diária e distribuição via Power BI Service
para toda a organização.

**Benefício esperado:** Eliminar extração manual de dados via Excel
e centralizar em fonte única de verdade — reduzindo o tempo de
geração de relatórios de produtividade de dias para minutos.

---

## 2. Escopo

### ✅ Dentro do escopo

| # | Entregável |
|---|---|
| 1 | Dashboard Power BI com 5 KPIs de produtividade |
| 2 | Ingestão ELT dos dados do Jira via Databricks |
| 3 | Ingestão ELT dos dados do ServiceNow SPM via Databricks |
| 4 | Ingestão ELT dos dados do ServiceNow ITSM via Databricks |
| 5 | Modelagem dimensional (star schema) no Databricks |
| 6 | Dimensões: Vertical · Global Domains · Squad · Tribo · Período |
| 7 | Atualização batch diária (carga noturna) |
| 8 | RLS (Row-Level Security) por vertical e squad |
| 9 | Dicionário de dados documentado |

### ❌ Fora do escopo

| # | Exclusão | Justificativa |
|---|---|---|
| 1 | Atualização em tempo real (streaming) | Batch diário atende o requisito. Real-time exige Kafka/Event Hub — custo e complexidade não justificados para uso de dashboard gerencial |
| 2 | Módulo de projeção/previsão com ML | Capacidade analítica futura — depende de maturidade dos dados históricos |
| 3 | Dados individuais por colaborador | Granularidade mínima: squad. Nível individual viola princípio de Privacy by Design (LGPD) |

---

## 3. KPIs do Painel

| KPI / Métrica | Tipo | Dimensões | Granularidade |
|---|---|---|---|
| Deployment Frequency | KPI | Vertical · Squad · Período | Diária / Semanal |
| Change Failure Rate | KPI | Vertical · Squad · Período | Semanal / Mensal |
| Cycle Time de Issues | KPI | Vertical · Squad · Tribo · Período | Semanal / Mensal |
| Mean Time to Resolution (MTTR) | KPI | Vertical · Squad · Período | Diária |
| Quantidade de Squads | Métrica de contexto | Vertical · Global Domains | Mensal |

---

## 4. Stakeholders

| Stakeholder | Papel | O que espera |
|---|---|---|
| Área de Produtividade / CIO Office | Solicitante e validador | Visibilidade de produtividade por squad para decisão executiva |
| Time de Domínio de Dados | Executor técnico | Escopo estável, requisitos claros, priorização no backlog |
| Líderes de Vertical / Global Domains | Usuário final — gestão | KPIs da sua vertical sem precisar extrair manualmente |
| Squads F1RST | Usuário final — operacional | Transparência dos próprios indicadores |

> ⚠️ **Atenção crítica:** cliente solicitante (CIO Office) ≠ usuário
> final (toda F1RST). Uma mudança validada com o solicitante impacta
> toda a organização. Ambos os stakeholders devem ser consultados
> antes de qualquer alteração de escopo.

---

## 5. Pipeline de Dados

```
ORIGENS
├── Jira ──────────────────────────────┐
├── ServiceNow SPM ────────────────────┤→ Time de Domínio → ELT
├── ServiceNow ITSM (previsão jun/26) ─┤
└── Excel manual (temporário, fim/06) ─┘
                                            ↓
                                       DATABRICKS
                                       (Lakehouse)
                                            ↓
                                    POWER BI + Power Query
                                            ↓
                              CIO Office · Toda a F1RST
```

---

## 6. Matriz de Riscos

| ID | Risco | Prob | Impacto | Mitigação | Contingência |
|---|---|---|---|---|---|
| R01 | Pipeline ITSM não disponível no Databricks até jun/2026 | Média | Alto | **Gap crítico:** inicio do desenvolvimento completo condicionado a esta entrega | Entregar dashboard MVP com Jira + SPM. ITSM integrado em fase 2 |
| R02 | Excel manual como fonte de dados | Alta | Alto | Definir prazo formal de migração (30/06/26) e acompanhar semanalmente | Manter checklist de validação do Excel até migração concluída |
| R03 | Mudança de escopo validada só com o solicitante impacta usuários finais | Média | Alto | Mapear impacto em squads antes de qualquer mudança. Comunicado formal para F1RST | Rollback de configuração e re-comunicação |
| R04 | Dados de colaboradores violando LGPD | Média | Alto | Granularidade mínima squad (não indivíduo). Classificar colunas antes da modelagem | Remover colunas pessoais do dashboard na entrega MVP |
| R05 | Time de Domínio com backlog concorrente | Alta | Médio | Priorizar demanda no backlog. Confirmar alocação a cada sprint | Escalar para gestão se prazo comprometido |

---

## 7. Premissas e Restrições

### Premissas
1. Pipeline ITSM no Databricks entregue pelo Time de Domínio até 30/06/2026
2. Dados de Jira e ServiceNow SPM já disponíveis e acessíveis no Databricks
3. Licenças Power BI Pro disponíveis para usuários da Área de Produtividade

### Restrições
1. Atualização: batch diário — não real-time
2. Granularidade mínima: squad — não individual (LGPD)
3. Início do desenvolvimento completo: condicionado à entrega do pipeline ITSM

---

## 8. Cronograma de Marcos

| ID | Marco | Data | Responsável |
|---|---|---|---|
| M1 | Kick-off e validação de escopo | 15/06/2026 | PMO |
| M2 | Validação do modelo dimensional | 22/06/2026 | Domínio + PMO |
| M3 | Migração do Excel → pipeline ITSM | 30/06/2026 | Time de Domínio |
| M4 | Dashboard MVP (Jira + SPM) | 15/07/2026 | Time de Domínio |
| M5 | Dashboard completo (+ ITSM) | 31/07/2026 | Time de Domínio |
| M6 | Publicação e rollout F1RST | 15/08/2026 | PMO |

---

## 9. Aprovações

| Papel | Nome | Data |
|---|---|---|
| Patrocinador | Diretora de Produtividade | ________ |
| Gerente do Projeto | Patricia Vasconcelos | 15/06/2026 |
| Responsável Técnico | Líder do Domínio de Dados | ________ |

---

*Documento elaborado com base nos conceitos de ETL/ELT,
Lakehouse, modelagem dimensional, granularidade e LGPD
aplicados ao contexto bancário regulado (F1RST — Santander Group).*
