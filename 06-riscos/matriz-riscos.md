# Matriz de Riscos — Painel de Produtividade
**Autora:** Patricia Vasconcelos · **Contexto:** TechFinance S.A.
**Projeto:** Painel de Produtividade · **Data:** Junho/2026

> Matriz de riscos cobrindo duas dimensões: riscos de gestão de
> projeto (prazo, recurso, escopo) e riscos específicos de dados
> (qualidade, LGPD, segurança, rastreabilidade). Em ambiente
> financeiro regulado, mapear ambos não é opcional — risco não
> identificado vira incidente, e incidente de dados vira risco
> regulatório.

---

## Como ler esta matriz

**Probabilidade × Impacto** define a severidade. Cada risco tem:
- **Mitigação** — ação para reduzir a probabilidade (prevenir)
- **Contingência** — ação caso o risco se concretize (reagir)

**Escala de probabilidade e impacto:** Baixa · Média · Alta

**Severidade (Prob × Impacto):**

| | Impacto Baixo | Impacto Médio | Impacto Alto |
|---|---|---|---|
| **Prob Alta** | 🟡 Média | 🔴 Alta | 🔴 Crítica |
| **Prob Média** | 🟢 Baixa | 🟡 Média | 🔴 Alta |
| **Prob Baixa** | 🟢 Baixa | 🟢 Baixa | 🟡 Média |

---

## Parte 1 — Riscos de Projeto

Riscos relacionados à execução, prazo, recursos e dependências.

| ID | Risco | Prob | Impacto | Sev | Mitigação | Contingência |
|---|---|---|---|---|---|---|
| RP01 | Pipeline de dependência externa (ITSM) não entregue no prazo | Média | Alto | 🔴 | Acompanhamento semanal com o fornecedor. Gap crítico monitorado | Dashboard MVP com Jira + SPM. ITSM em fase 2 |
| RP02 | Excel manual como fonte transitória além do previsto | Alta | Alto | 🔴 | Prazo formal de migração (30/06) com checkpoint semanal | Manter checklist de validação do Excel até migração concluída |
| RP03 | Time de Engenharia com backlog concorrente | Alta | Médio | 🔴 | Priorização formal no backlog. Confirmar alocação por sprint | Escalar para gestão se o prazo for comprometido |
| RP04 | Mudança de escopo validada só com solicitante | Média | Alto | 🔴 | Mapear impacto nos squads antes de qualquer alteração | Rollback de configuração e comunicado formal à organização |
| RP05 | Subestimação do esforço de modelagem dimensional | Média | Médio | 🟡 | Validar modelo com Engenharia antes do desenvolvimento (M2) | Replanejar marcos M4 e M5 com novo prazo acordado |

---

## Parte 2 — Riscos de Dados

Riscos específicos do ambiente analítico e regulatório.

| ID | Risco | Tipo | Prob | Impacto | Sev | Mitigação | Contingência |
|---|---|---|---|---|---|---|---|
| RD01 | Dados de colaboradores expondo informação pessoal | Conformidade (LGPD) | Média | Alto | 🔴 | Granularidade mínima squad. Classificar colunas antes da modelagem. Avaliação do DPO | Remover colunas pessoais na entrega MVP |
| RD02 | Qualidade insuficiente das fontes (nulos, duplicidade) | Qualidade | Média | Alto | 🔴 | Checklist de qualidade antes da ingestão. Validar % de nulos nas colunas-chave | Documentar limitação no dashboard. Bloquear KPI afetado até correção |
| RD03 | KPI calculado sobre base incorreta | Qualidade | Média | Alto | 🔴 | Revisão das medidas DAX. Validar denominador (ex: SLA sobre fechadas, não total) | Corrigir medida e republicar com nota de retificação |
| RD04 | Acesso indevido a dados de outras divisões | Segurança | Média | Alto | 🔴 | RLS (Row-Level Security) por divisão e squad antes da publicação | Restringir acesso ao dashboard até RLS validado |
| RD05 | Dado sem rastreabilidade de origem | Governança | Média | Médio | 🟡 | Dicionário de dados completo. Timestamp de atualização no painel | Adicionar documentação de origem retroativamente |
| RD06 | Dado desatualizado apresentado como atual | Governança | Baixa | Alto | 🟡 | Carga batch monitorada (até 07h). Timestamp visível ao usuário | Alertar usuários e sinalizar período no dashboard |
| RD07 | Interpretação errada por ausência de contexto (meta, período) | Governança | Média | Médio | 🟡 | Anotações no dashboard. Meta exibida nos KPIs. Glossário de apoio | Sessão de capacitação com os usuários |

---

## Riscos de Maior Severidade — Foco de Atenção

Os riscos críticos (🔴) que exigem acompanhamento prioritário:

| ID | Risco | Por que é prioritário |
|---|---|---|
| RP02 | Excel manual transitório | Alta probabilidade + alto impacto. Enquanto o Excel roda, a fonte única de verdade não existe |
| RD01 | LGPD — dados de colaborador | Risco regulatório. Em ambiente financeiro, exposição de dado pessoal tem consequência legal |
| RD03 | KPI sobre base incorreta | Um número errado para a liderança destrói a credibilidade de todo o painel |
| RD04 | Acesso indevido entre divisões | Conformidade + segurança. Publicar sem RLS é falha de governança em ambiente regulado |

---

## Plano de Monitoramento

| Quando | Ação |
|---|---|
| Semanal | Revisar RP01 (ITSM), RP02 (Excel), RP03 (backlog) |
| Antes do go-live | Validar RD01 (LGPD), RD04 (RLS), RD03 (medidas DAX) |
| Contínuo pós go-live | Monitorar RD05, RD06, RD07 (governança e adoção) |

---

## Alinhamento com os demais documentos

Esta matriz expande os riscos do TAP e conecta com o checklist
de viabilidade:

| Risco | Origem no TAP | Conexão |
|---|---|---|
| RP01 (ITSM) | R01 do TAP | Dependência externa — gap crítico |
| RP02 (Excel) | R02 do TAP | Fonte transitória |
| RD01 (LGPD) | R04 do TAP | Pergunta 3 do checklist de viabilidade |
| RD04 (RLS) | Item 8 do escopo | Pré-requisito de publicação |

---

*Documento elaborado com os conceitos de gestão de riscos,
LGPD (Privacy by Design), governança de dados e segurança da
informação aplicados ao contexto de empresa de tecnologia no
setor financeiro regulado. Junho/2026*
