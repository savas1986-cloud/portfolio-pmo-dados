# Backlog Priorizado — Método MoSCoW
**Autora:** Patricia Vasconcelos · **Contexto:** TechFinance S.A.
**Projeto:** Painel de Produtividade · **Ciclo:** Jun–Ago/2026
**Data:** Junho/2026

> Backlog do time de dados com 16 itens priorizados pelo método
> MoSCoW. Cada classificação inclui justificativa explícita —
> porque priorização sem raciocínio documentado não é governança,
> é preferência.

---

## O que é MoSCoW

| Classificação | Significado | Pergunta de referência |
|---|---|---|
| **M** — Must Have | Obrigatório. Sem isso, o produto não pode ser entregue | "O MVP vai ao ar sem isso?" |
| **S** — Should Have | Importante mas existe alternativa aceitável | "Funciona sem isso?" |
| **C** — Could Have | Melhora a experiência sem mudar o resultado | "Agrega valor agora?" |
| **W** — Won't Have | Explicitamente excluído **neste ciclo** | "Decidimos não fazer agora?" |

> ⚠️ **Won't Have ≠ Nunca.** É uma decisão explícita e documentada
> para este ciclo. Protege o escopo de reaberturas não planejadas.

---

## Backlog Completo

| ID | Item | Classificação | Justificativa |
|---|---|---|---|
| B01 | Ingestão ELT do Jira no Databricks | 🔴 Must | Fonte primária de Deployment Frequency e Cycle Time. Sem ela, não há dado |
| B02 | Ingestão ELT do ServiceNow SPM no Databricks | 🔴 Must | Segunda fonte confirmada. MVP sem as duas fontes principais é protótipo vazio |
| B03 | Modelagem dimensional (star schema) no Databricks | 🔴 Must | Fundação técnica de tudo. Sem ela, Power BI não tem onde conectar |
| B04 | Dashboard com os 5 KPIs no Power BI Service | 🔴 Must | É o produto final solicitado. Sem o visual, não há entrega |
| B05 | RLS (Row-Level Security) por divisão e squad | 🔴 Must | Em ambiente regulado, publicar sem controle de acesso é risco de conformidade. Pré-requisito de publicação |
| B06 | Dicionário de dados do modelo | 🔴 Must | KR do projeto. Coluna sem documentação é risco regulatório em setor financeiro |
| B07 | Ingestão ELT do ServiceNow ITSM | 🟡 Should | Dependência externa pode atrasar. Dashboard funciona com Jira + SPM. ITSM entra em fase 2 |
| B08 | Filtros por período (semana / mês / trimestre) | 🟡 Should | Sem filtro, o painel perde 80% do valor analítico. Próxima prioridade após MVP |
| B09 | Drill-down por squad dentro de cada divisão | 🟡 Should | Sem ele, o gestor vê o número da divisão mas não identifica qual squad impacta o resultado |
| B10 | Alerta automático de falha no pipeline | 🟡 Should | Sem alerta, falha noturna só é descoberta às 8h pelo usuário. Monitoramento manual cobre no interim |
| B11 | Exportação do dashboard em PDF | 🟢 Could | Funcionalidade nativa do Power BI. Baixa prioridade — print resolve por ora |
| B12 | Página de glossário de KPIs dentro do dashboard | 🟢 Could | Glossário externo já existe. Inclusão no dashboard melhora UX mas não muda valor analítico |
| B13 | Histórico de 24 meses para análise de tendência | 🟢 Could | Alto valor estratégico, mas depende de dados históricos existentes nas fontes. Alta complexidade |
| B14 | Atualização em tempo real (streaming) | ⚪ Won't | Batch diário definido no TAP e nos OKRs. Decisão acordada com o solicitante. Kafka/Event Hub fora do escopo |
| B15 | Módulo de previsão de KPIs com Machine Learning | ⚪ Won't | Depende de dados históricos maduros. O modelo preditivo não existe antes do descritivo estar estável |
| B16 | Acesso mobile ao dashboard | ⚪ Won't | Requer configuração adicional de layout. Entra em roadmap após versão desktop estável |

---

## Distribuição por classificação

| Classificação | Itens | % do backlog |
|---|---|---|
| 🔴 Must Have | 6 | 37,5% |
| 🟡 Should Have | 4 | 25,0% |
| 🟢 Could Have | 3 | 18,75% |
| ⚪ Won't Have | 3 | 18,75% |
| **Total** | **16** | **100%** |

> **Referência de mercado:** Must Have acima de 60% do backlog
> é sinal de escopo inflado ou pressão de stakeholder não gerenciada.
> Neste backlog, 37,5% indica escopo saudável e realista para o ciclo.

---

## Alinhamento com os demais documentos do projeto

Este backlog é consistente com as decisões tomadas no TAP e nos OKRs:

| Decisão | TAP | OKRs | Backlog |
|---|---|---|---|
| Batch diário — sem real-time | ❌ Fora do escopo | ❌ Won't Have (KR não inclui) | ⚪ W14 |
| ITSM como dependência externa | ⚠️ Risco R01 | 🟡 KR1 com contingência | 🟡 B07 |
| RLS obrigatório | ✅ Item 8 do escopo | — | 🔴 B05 |
| Dicionário de dados | ✅ Item 9 do escopo | ✅ KR2 do O2 | 🔴 B06 |

---

## Sprint 1 — Sugestão de sequência de execução

Considerando as dependências técnicas, a ordem recomendada dentro
dos Must Haves é:

```
Semana 1–2: B03 (modelagem) ← fundação de tudo
Semana 2–3: B01 (Jira) + B02 (SPM) ← pipelines em paralelo
Semana 3–4: B06 (dicionário) ← documentar enquanto modela
Semana 4:   B05 (RLS) ← configurar antes de publicar
Semana 4–5: B04 (dashboard) ← construir sobre modelo pronto
```

---

*Documento elaborado com o método MoSCoW aplicado a um projeto
de dados em empresa de tecnologia do setor financeiro regulado.
Junho/2026*
