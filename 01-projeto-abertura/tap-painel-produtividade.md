# Termo de Abertura de Projeto
## Painel de Produtividade — TechFinance S.A.

| Campo | Informação |
|---|---|
| **Data de Abertura** | 15/06/2026 |
| **Patrocinador** | Diretora de Eficiência Operacional / Diretoria de Tecnologia |
| **Gerente do Projeto** | Patricia Vasconcelos (PMO de Dados) |
| **Área Solicitante** | Área de Eficiência Operacional |
| **Usuários Finais** | Todos os squads TechFinance S.A. |
| **Status** | Em execução |

---

## 1. Objetivo do Projeto

Desenvolver dashboard analítico no Power BI para monitoramento
contínuo dos KPIs de produtividade dos squads, consolidando dados
de Jira, ServiceNow SPM e ITSM no Databricks (Lakehouse), com
atualização batch diária e distribuição via Power BI Service
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
| 6 | Dimensões: Divisão de Negócio · Squad · Tribo · Período |
| 7 | Atualização batch diária (carga noturna) |
| 8 | RLS (Row-Level Security) por divisão e squad |
| 9 | Dicionário de dados documentado |

### ❌ Fora do escopo

| # | Exclusão | Justificativa |
|---|---|---|
| 1 | Atualização em tempo real (streaming) | Batch diário atende o requisito. Real-time exige Kafka/Event Hub — custo e complexidade não justificados para uso gerencial |
| 2 | Módulo de projeção com ML | Capacidade futura — depende de maturidade dos dados históricos |
| 3 | Dados individuais por colaborador | Granularidade mínima: squad. Nível individual viola Privacy by Design (LGPD) |

---

## 3. KPIs do Painel

| KPI / Métrica | Tipo | Dimensões | Granularidade |
|---|---|---|---|
| Deployment Frequency | KPI | Divisão · Squad · Período | Diária / Semanal |
| Change Failure Rate | KPI | Divisão · Squad · Período | Semanal / Mensal |
| Cycle Time de Issues | KPI | Divisão · Squad · Tribo · Período | Semanal / Mensal |
| Mean Time to Resolution (MTTR) | KPI | Divisão · Squad · Período | Diária |
| Quantidade de Squads | Métrica de contexto | Divisão · Domínios de Negócio | Mensal |

---

## 4. Stakeholders

| Stakeholder | Papel | O que espera |
|---|---|---|
| Diretoria de Tecnologia | Solicitante e validador | Visibilidade de produtividade por squad para decisão executiva |
| Time de Engenharia de Dados | Executor técnico | Escopo estável, requisitos claros, priorização no backlog |
| Líderes de Divisão / Domínios de Negócio | Usuário final — gestão | KPIs da sua divisão sem extração manual |
| Squads | Usuário final — operacional | Transparência dos próprios indicadores |

> ⚠️ **Atenção crítica:** cliente solicitante (Diretoria de Tecnologia)
> ≠ usuário final (toda a organização). Uma mudança validada com o
> solicitante impacta todos os squads. Ambos devem ser consultados
> antes de qualquer alteração de escopo.

---

## 5. Pipeline de Dados

```
ORIGENS
├── Jira ─────────────────────────────────┐
├── ServiceNow SPM ───────────────────────┤→ Time de Engenharia → ELT
├── ServiceNow ITSM (dependência externa)─┤
└── Excel manual (temporário, fim/06) ────┘
                                              ↓
                                         DATABRICKS
                                         (Lakehouse)
                                              ↓
                                      POWER BI + Power Query
                                              ↓
                               Diretoria de Tecnologia · Toda a organização
```

---

## 6. Matriz de Riscos

| ID | Risco | Prob | Impacto | Mitigação | Contingência |
|---|---|---|---|---|---|
| R01 | Pipeline com dependência externa não disponível no prazo | Média | Alto | Gap crítico: desenvolvimento completo condicionado a esta entrega | Dashboard MVP com Jira + SPM. ITSM integrado em fase 2 |
| R02 | Excel manual como fonte de dados transitória | Alta | Alto | Definir prazo formal de migração (30/06) e acompanhar semanalmente | Manter checklist de validação do Excel até migração concluída |
| R03 | Mudança de escopo validada só com solicitante impacta usuários finais | Média | Alto | Mapear impacto em squads antes de qualquer mudança | Rollback de configuração e comunicado formal |
| R04 | Dados de colaboradores violando LGPD | Média | Alto | Granularidade mínima squad. Classificar colunas antes da modelagem | Remover colunas pessoais na entrega MVP |
| R05 | Time de Engenharia com backlog concorrente | Alta | Médio | Priorizar demanda no backlog. Confirmar alocação a cada sprint | Escalar para gestão se prazo comprometido |

---

## 7. Premissas e Restrições

### Premissas
1. Pipeline de fornecedor externo entregue até 30/06/2026
2. Dados de Jira e ServiceNow SPM já disponíveis no Databricks
3. Licenças Power BI Pro disponíveis para os usuários solicitantes

### Restrições
1. Atualização: batch diário — não real-time
2. Granularidade mínima: squad — não individual (LGPD)
3. Início do desenvolvimento completo: condicionado à entrega do pipeline externo

---

## 8. Cronograma de Marcos

| ID | Marco | Data | Responsável |
|---|---|---|---|
| M1 | Kick-off e validação de escopo | 15/06/2026 | PMO |
| M2 | Validação do modelo dimensional | 22/06/2026 | Engenharia + PMO |
| M3 | Migração do Excel → pipeline integrado | 30/06/2026 | Time de Engenharia |
| M4 | Dashboard MVP (Jira + SPM) | 15/07/2026 | Time de Engenharia |
| M5 | Dashboard completo (+ ITSM) | 31/07/2026 | Time de Engenharia |
| M6 | Publicação e rollout | 15/08/2026 | PMO |

---

## 9. Aprovações

| Papel | Nome | Data |
|---|---|---|
| Patrocinador | Diretora de Eficiência Operacional | ________ |
| Gerente do Projeto | Patricia Vasconcelos | 15/06/2026 |
| Responsável Técnico | Líder de Engenharia de Dados | ________ |

---

*Documento elaborado com conceitos de ETL/ELT, Lakehouse,
modelagem dimensional, granularidade e LGPD aplicados ao
contexto de empresa de tecnologia no setor financeiro regulado.*
