# Projeto 3 — Análise Crítica de Dashboard

**Contexto:** Análise crítica do Painel de Produtividade (Power BI)
desenvolvido no Módulo 2, avaliado sob a ótica de design visual,
governança de dados, storytelling e experiência do usuário — seguido
da implementação das melhorias identificadas.

**O que entrega:** Framework de avaliação com 10 critérios em 5
categorias, scorecard antes/depois, e um dashboard de 4 páginas
reformulado a partir dos achados da própria análise.

**Por que importa:** Saber construir um dashboard e saber avaliá-lo
criticamente são competências distintas. Este projeto demonstra o
ciclo completo de um PMO de Dados: construir → avaliar → melhorar.

**Habilidades demonstradas:** Storytelling com dados · Governança
de BI · Princípios de design · Formatação condicional · DAX ·
Drill-through · Autoavaliação crítica com framework estruturado

**Ferramenta:** Power BI Desktop + Power BI Service
**Status:** ✅ Concluído — análise + V2 implementado e publicado

---

## 🔗 Dashboard publicado

[Ver Painel de Produtividade no Power BI →](https://app.powerbi.com/view?r=eyJrIjoiNDNiYWU0NTUtYmJkMi00MDUyLWE5ZGMtYTBmNDQ0MGFkODIxIiwidCI6ImQ0NTdkYjJiLTdkNTAtNGVlYS1iZTk2LTQwNmE1MzhmNzVhMiJ9&pageName=911b74bba5e5702198c3)

4 páginas · dados sintéticos · 420 demandas · Jan/2024 a Jun/2025
- **Operacional** — visão geral da operação (5 KPIs + distribuição + evolução)
- **SLA** — análise de cumprimento de SLA com meta e desvio
- **Detalhe Squad** — drill-through individual por squad
- **Visão por Squad** — comparativo completo entre squads

---

## 📋 Framework de Avaliação

A análise avaliou o dashboard em 10 critérios:

| Categoria | Critérios |
|---|---|
| Design Visual | Hierarquia · Cores · Densidade |
| Storytelling | Clareza dos KPIs · Contexto e comparação |
| Governança | Rastreabilidade · Atualização (freshness) |
| Interatividade | Filtros · Drill-down |
| Acessibilidade | Outliers e alertas visuais |

---

## 📊 Resultado — Antes e Depois

| Critério | V1 | V2 |
|---|---|---|
| Hierarquia visual | ⚠️ | ✅ |
| Uso de cores | ✅ | ✅ |
| Densidade de informação | ⚠️ | ✅ |
| Clareza dos KPIs | ⚠️ | ✅ |
| Contexto e comparação | ❌ | ✅ |
| Rastreabilidade | ❌ | ✅ |
| Freshness (atualização) | ❌ | ✅ |
| Filtros e slicers | ✅ | ✅ |
| Drill-down | ⚠️ | ✅ |
| Outliers e alertas | ❌ | ✅ |

**Evolução do scorecard: de 2 boas práticas (V1) para 10 (V2).**

---

## 🔧 Melhorias Implementadas na V2

Estrutura: de 2 páginas (V1) para 4 páginas (V2).
Qualidade: de 2 critérios atendidos (V1) para 10 (V2).:

| # | Melhoria | Categoria |
|---|---|---|
| 1 | 5 cards de status na página Operacional | Hierarquia |
| 2 | Delta de meta nos KPIs de SLA e Tempo de Resolução | Contexto |
| 3 | Tabela de prioridade com base correta (demandas fechadas) | Consistência |
| 4 | Formatação condicional no SLA por Squad (verde/laranja/vermelho) | Alertas |
| 5 | Página Detalhe Squad com drill-through + SLA do squad | Drill-down |
| 6 | Página Visão por Squad com composição 100% empilhada | Densidade |
| 7 | Timestamp de atualização em todas as páginas | Rastreabilidade |
| 8 | Anotação de período parcial (Jun/25) | Freshness |
| 9 | Linha de média no gráfico de evolução | Contexto |
| 10 | Ordenação por criticidade (Crítica → Alta → Média → Baixa) | Clareza |

---

## 🧮 Medidas DAX — Time Intelligence

Camada de medidas do dashboard, construída sobre uma tabela Calendário
(`CALENDARAUTO()`) marcada como Tabela de Datas e relacionada a
`demandas[DataAbertura]` (1:*). Código completo em
[`medidas-dax-painel-produtividade.dax`](https://savas1986-cloud.github.io/portfolio-pmo-dados/Estudos/modulo-5-powerbi-dax.html).

| Medida | Função-chave | Entrega no painel |
|---|---|---|
| Total de Demandas | `COUNTROWS` | Contagem base (420) |
| Demandas YTD | `TOTALYTD` | Acumulado no ano (134 em 2025) |
| Demandas Período Anterior | `CALCULATE` + `DATEADD` | Comparação com o mês anterior |
| Variação % | `VAR` + `DIVIDE` | Crescimento mês a mês (blindado contra ÷0) |
| Desvio SLA Texto | `VAR` + `IF` + `FORMAT` | Subtítulo dinâmico do card: "▼ 9.25pp vs meta (85%)" |

**Destaque — medida de texto dinâmica:** `Desvio SLA Texto` não devolve
um número, e sim uma mensagem que interpreta o KPI para o gestor (seta,
desvio em pp e meta). É a medida por trás da melhoria #2 (delta de meta
nos KPIs de SLA) da V2.

📄 Estudo completo do módulo: [modulo-5-powerbi-dax.html][(https:/savas1986-cloud/portfolio-pmo-dados/main/Estudos/modulo-5-powerbi-dax.html])

---

## 🎯 Decisões técnicas que merecem destaque

**Base do cálculo de SLA:** o SLA usa demandas *fechadas* (301) como
denominador, não o total de demandas (420). Demandas em aberto não
podem ser avaliadas quanto ao cumprimento de prazo — incluí-las
distorceria o indicador.

**Cores invertidas por tipo de métrica:** para SLA (percentual),
maior é melhor → verde quando acima da meta. Para Tempo de Resolução
(dias), menor é melhor → verde quando abaixo da meta. A lógica de cor
acompanha a direção de cada indicador.

**Granularidade mínima por squad:** o dashboard nunca expõe dados
individuais de colaboradores — apenas agregados por squad. Aplicação
de Privacy by Design (LGPD).

---

*Análise e reformulação desenvolvidas no Módulo 2 do roteiro de
estudos PMO de Dados. Dashboard com dados sintéticos —
TechFinance S.A. (contexto fictício). Junho/2026*
