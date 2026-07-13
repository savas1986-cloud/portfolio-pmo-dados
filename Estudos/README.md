# 📚 Estudos — Roteiro PMO de Dados 2026

Módulos de estudo desenvolvidos durante o roteiro de
transição para PMO de Dados.

Cada módulo contém:
- Conceitos-chave com exemplos reais
- Comparativos e tabelas de referência
- Exercícios práticos concluídos
- Insights e reflexões de aplicação

---

## Módulos

| Módulo | Tema | Carga | Status |
|--------|------|-------|--------|
| [Módulo 0](https://savas1986-cloud.github.io/portfolio-pmo-dados/Estudos/modulo-0-fundamentos.html) | Fundamentos de Dados & BI | ~12h | ✅ Concluído |
| [Módulo 1](https://savas1986-cloud.github.io/portfolio-pmo-dados/Estudos/modulo-1-sql.html) | SQL — A Linguagem dos Dados | ~20h | ✅ Concluído |
| [Módulo 2](https://savas1986-cloud.github.io/portfolio-pmo-dados/Estudos/modulo-2-powerbi.html) | Power BI Básico + Intermediário | ~25h |  ✅ Concluído |
| [Módulo 3](https://savas1986-cloud.github.io/portfolio-pmo-dados/Estudos/modulo-3-excel.html)| Excel Avançado (Power Query) | ~10h | ✅ Concluído |
| Módulo 4 (https://savas1986-cloud.github.io/portfolio-pmo-dados/Estudos/modulo-3-excel.html)| Governança de Dados & LGPD | ~20h | ✅ Concluído |
| Módulo 5 | Power BI Avançado (DAX) | ~20h | 🔵 Em Andamento |
| Módulo 6 | Python para Análise (Pandas) | ~10h | ⏳ Programado |
| Módulo 7 | IA Prática para PMO | ~15h | ⏳ Programado |

**Total planejado:** ~155 horas · 4 meses · 1 hora por dia

---

## O que cada módulo entrega

**Módulo 0 — Fundamentos** ✅
- Glossário com 23 termos (disponível em `08-glossario/`)
- Diagrama do pipeline de dados do Painel de Produtividade, aplicado
  ao contexto de empresa de tecnologia no setor financeiro regulado
- 5 KPIs classificados com dimensões e granularidade
- Demanda real reescrita com vocabulário técnico

**Módulo 1 — SQL** ✅
- Queries documentadas nas 4 aulas (disponível em `exercicios/sql/`)
- Aula 1: SELECT, WHERE, ORDER BY, LIMIT
- Aula 2: GROUP BY, agregações, WHERE vs HAVING
- Aula 3: INNER JOIN, LEFT JOIN, detecção de órfãos (IS NULL)
- Aula 4: Subqueries (IN, escalar, FROM)
- Base utilizada: Northwind (SQLite)

**Módulo 2 — Power BI** ✅
- Dashboard "Painel de Produtividade" publicado (4 páginas interativas)
- Star Schema com modelagem dimensional
- Medidas DAX: SLA Cumprido %, Demandas no Prazo/Atraso, Tempo Médio
  de Resolução, com delta de meta e formatação condicional
- Drill-through por squad e segmentadores
- Análise crítica do próprio dashboard (disponível em `03-dashboard-critico/`)

**Módulo 3 — Excel Avançado** ✅
- Tabela Dinâmica com % do Total da Linha e slicers interativos
  (PrioridadeID + Timeline de DataAbertura por trimestre)
- Power Query no Excel — merge de 3 tabelas (demandas + squads + status)
- PROCX e PROCV para resolução de IDs em nomes reais
- Macro `FormatarRelatorio` (Ctrl+Shift+F) — formata cabeçalho,
  ajusta colunas e congela linha superior automaticamente
- Arquivo: `painel-produtividade-excel.xlsm`
  (disponível em `10-excel-avancado/`)

  **Módulo 4 — Governança de Dados + LGPD** ✅
- Dicionário de dados com 10 colunas + classificação LGPD
- Avaliação de qualidade nas 6 dimensões (Completude, Acurácia, 
  Consistência, Atualidade, Unicidade, Validade)
- Mapa de riscos LGPD — cenário fictício de cruzamento de dados
- Checklist de qualidade para validação pré-publicação
- Mapa de fluxo de dados do pipeline completo
  (disponível em `11-governanca/`)
---

*Roteiro completo disponível em [`roteiro/`](../roteiro/)*
