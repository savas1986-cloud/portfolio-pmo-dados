# Checklist de Viabilidade Técnica — Demandas de Dados
**Autora:** Patricia Vasconcelos · **Contexto:** TechFinance S.A.
**Aplicação:** Gate de aprovação para demandas de dados
**Data:** Junho/2026

> Sete perguntas a responder antes de aprovar qualquer demanda
> de dados — dashboard, pipeline, relatório ou análise.
> Uma resposta vermelha bloqueia o avanço. O bloqueio protege
> o time, o prazo e a credibilidade do dado entregue.

---

## Como usar este checklist

```
1. Receber a demanda do solicitante
2. Agendar sessão de 30 min com o solicitante e o lead técnico
3. Percorrer as 7 perguntas em conjunto
4. Registrar classificação e evidência para cada pergunta
5. Decisão final: Aprovar / Aprovar com ressalvas / Devolver
```

**Legenda de classificação:**
🟢 Verde → pré-requisito atendido, avança
🟡 Amarelo → atenção, avança com plano de ação
🔴 Vermelho → bloqueador, demanda retorna ao solicitante

---

## As 7 Perguntas

---

### Pergunta 1 — Os dados existem e são acessíveis?

**O que investigar:**
- Os dados necessários estão em algum sistema (Jira, ServiceNow,
  ERP, CRM, planilha)?
- O time de dados tem acesso a essa fonte?
- Se não tem acesso, qual é o prazo e esforço para obtê-lo?

**Bloqueador:** dado não existe em nenhuma fonte conhecida.

**Critério de classificação:**

| Situação | Classificação |
|---|---|
| Dado existe e está acessível no Databricks | 🟢 Verde |
| Dado existe mas precisa de ingestão (prazo estimado < 2 semanas) | 🟡 Amarelo |
| Dado existe mas acesso depende de terceiro sem prazo definido | 🔴 Vermelho |
| Dado não existe em nenhuma fonte conhecida | 🔴 Vermelho |

> **Por que esta pergunta vem primeiro:** não adianta validar
> nada mais se o dado não existe. É o bloqueador mais frequente
> e mais subestimado pelos solicitantes.

---

### Pergunta 2 — A qualidade dos dados é suficiente?

**O que investigar:**
- Qual o percentual de valores nulos nas colunas principais?
- Há registros duplicados, datas inconsistentes ou valores fora
  do intervalo esperado?
- O dado foi atualizado recentemente? Com que frequência é atualizado?

**Bloqueador:** coluna principal com mais de 30% de nulos ou
inconsistências que inviabilizam o cálculo do KPI solicitado.

**Critério de classificação:**

| Situação | Classificação |
|---|---|
| Dados completos, consistentes e atualizados | 🟢 Verde |
| Problemas pontuais com plano de tratamento mapeado | 🟡 Amarelo |
| Dado com mais de 30% de nulos nas colunas-chave | 🔴 Vermelho |
| Inconsistências que impossibilitam o cálculo do KPI | 🔴 Vermelho |

> **Por que esta pergunta é crítica:** dado ruim produz KPI errado.
> KPI errado apresentado à liderança é pior do que não ter o
> dashboard — destrói a credibilidade do time de dados.

---

### Pergunta 3 — A demanda envolve dados pessoais (LGPD)?

**O que investigar:**
- Os dados envolvem CPF, nome, e-mail, telefone ou qualquer
  informação que identifique um indivíduo?
- Qual é a granularidade mínima necessária (individual ou squad)?
- Há necessidade de consentimento do titular?
- O dado é de colaborador interno ou de cliente externo?

**Bloqueador:** dado pessoal sem plano de tratamento aprovado
pelo DPO (Data Protection Officer).

**Critério de classificação:**

| Situação | Classificação |
|---|---|
| Dados sem identificação pessoal | 🟢 Verde |
| Dado pessoal com anonimização já planejada | 🟡 Amarelo |
| Dado pessoal sem avaliação do DPO | 🔴 Vermelho |
| Dado de cliente externo sem base legal LGPD definida | 🔴 Vermelho |

> **Regra aplicada neste projeto:** granularidade mínima = squad.
> Dados no nível individual não entram no painel — Privacy by Design.

---

### Pergunta 4 — Temos viabilidade técnica com as ferramentas disponíveis?

**O que investigar:**
- O que foi pedido pode ser construído com Power BI + Databricks + SQL?
- Existe algum requisito técnico fora do stack atual
  (ex: ML, streaming, API externa)?
- O volume de dados está dentro da capacidade do ambiente?

**Bloqueador:** requisito técnico que exige ferramenta ou
infraestrutura fora do stack atual sem previsão de aquisição.

**Critério de classificação:**

| Situação | Classificação |
|---|---|
| 100% viável com o stack atual | 🟢 Verde |
| Viável com adaptação ou limitação documentada | 🟡 Amarelo |
| Requer ferramenta fora do stack (ML, streaming, API paga) | 🔴 Vermelho |
| Volume de dados incompatível com a infraestrutura atual | 🔴 Vermelho |

> **Exemplo real:** solicitante pede "previsão do próximo trimestre"
> — isso é Machine Learning, não BI. A demanda retorna com
> escopo reescrito para análise descritiva histórica.

---

### Pergunta 5 — O objetivo da demanda está claro?

**O que investigar:**
- Qual decisão de negócio este dashboard ou relatório vai apoiar?
- Há um OKR ou KPI estratégico associado a esta demanda?
- O solicitante consegue descrever o caso de uso em uma frase?

**Bloqueador:** solicitante não consegue articular a decisão que
o dado vai apoiar.

**Critério de classificação:**

| Situação | Classificação |
|---|---|
| Objetivo claro com caso de uso e decisão associada | 🟢 Verde |
| Objetivo parcialmente claro — sessão de refinamento necessária | 🟡 Amarelo |
| Solicitante não sabe articular o que precisa ou por quê | 🔴 Vermelho |
| Demanda duplica algo que já existe no catálogo de dados | 🔴 Vermelho |

> **Por que esta pergunta protege o time:** demanda vaga gera
> retrabalho. "Faz um dashboard de vendas" sem mais detalhes
> é garantia de "não era isso que eu queria" na entrega.

---

### Pergunta 6 — O time tem capacidade para executar no prazo?

**O que investigar:**
- Qual é o esforço estimado em dias de trabalho?
- O time de engenharia tem bandwidth disponível no período?
- Esta demanda compete com Must Haves já no backlog?
- Qual é a prioridade desta demanda no MoSCoW atual?

**Bloqueador:** esforço estimado superior à capacidade disponível
do time no período solicitado, sem negociação de prazo ou escopo.

**Critério de classificação:**

| Situação | Classificação |
|---|---|
| Esforço estimado dentro da capacidade disponível | 🟢 Verde |
| Capacidade apertada — prazo negociável com o solicitante | 🟡 Amarelo |
| Backlog cheio — demanda entra na fila sem prazo definido | 🔴 Vermelho |
| Prazo exigido pelo solicitante tecnicamente impossível | 🔴 Vermelho |

> **Papel do PMO aqui:** o time de engenharia raramente diz não.
> O PMO existe para proteger o time da sobrecarga e o solicitante
> da expectativa errada.

---

### Pergunta 7 — O critério de aceite está definido?

**O que investigar:**
- O solicitante consegue descrever como vai validar a entrega?
- Há métricas ou visuais específicos que precisam estar presentes?
- Quem é o responsável pelo aceite formal?
- Há prazo para o aceite após a entrega?

**Bloqueador:** nenhum critério de aceite definido antes do
início do desenvolvimento.

**Critério de classificação:**

| Situação | Classificação |
|---|---|
| Critérios de aceite documentados e acordados | 🟢 Verde |
| Critérios parciais — complementar antes do desenvolvimento | 🟡 Amarelo |
| Solicitante não sabe o que vai validar na entrega | 🔴 Vermelho |
| Nenhum responsável pelo aceite formal identificado | 🔴 Vermelho |

> **Por que esta pergunta fecha o ciclo:** sem critério de aceite,
> o desenvolvimento não tem destino definido. Quando o dashboard
> fica pronto, o solicitante pode dizer "não era o que esperava"
> sem que o time tenha como contestar.

---

## Resultado da Avaliação

Após percorrer as 7 perguntas, registre o resultado:

| # | Pergunta | Classificação | Evidência / Observação |
|---|---|---|---|
| 1 | Dados existem e acessíveis? | 🟢🟡🔴 | |
| 2 | Qualidade dos dados suficiente? | 🟢🟡🔴 | |
| 3 | Conformidade LGPD verificada? | 🟢🟡🔴 | |
| 4 | Viabilidade técnica confirmada? | 🟢🟡🔴 | |
| 5 | Objetivo da demanda claro? | 🟢🟡🔴 | |
| 6 | Capacidade do time disponível? | 🟢🟡🔴 | |
| 7 | Critério de aceite definido? | 🟢🟡🔴 | |

**Decisão final:**

| Resultado | Decisão |
|---|---|
| Todas 🟢 | ✅ Aprovado — entra no backlog |
| Alguma 🟡, nenhuma 🔴 | ⚠️ Aprovado com plano de ação documentado |
| Qualquer 🔴 | ❌ Devolvido — solicitante recebe orientação de resolução |

---

## Exemplo de aplicação — Demanda fictícia

**Demanda recebida:**
*"Preciso de um dashboard com o histórico de chamados dos
últimos 3 anos por colaborador para avaliação de performance."*

| # | Pergunta | Resultado | Motivo |
|---|---|---|---|
| 1 | Dados existem? | 🟡 Amarelo | ITSM tem os dados mas pipeline ainda não está em produção |
| 2 | Qualidade suficiente? | 🟡 Amarelo | Dados de 3 anos atrás com lacunas — investigar |
| 3 | LGPD verificada? | 🔴 Vermelho | **Bloqueador:** dado por colaborador individual viola Privacy by Design |
| 4 | Viabilidade técnica? | 🟢 Verde | Databricks + Power BI conseguem entregar |
| 5 | Objetivo claro? | 🟡 Amarelo | "Avaliação de performance" — vago, precisa de refinamento |
| 6 | Capacidade disponível? | 🟡 Amarelo | Backlog atual tem Must Haves ativos |
| 7 | Critério de aceite? | 🔴 Vermelho | **Bloqueador:** não definido |

**Resultado: ❌ Devolvido**

**Orientação ao solicitante:**
1. Granularidade precisa mudar de individual para squad (LGPD)
2. Definir critério de aceite antes da próxima sessão
3. Aguardar pipeline ITSM em produção

---

*Documento elaborado com os conceitos de governança de dados,
LGPD (Privacy by Design), gestão de backlog e interface
PMO–Engenharia aplicados ao contexto de empresa de tecnologia
no setor financeiro regulado. Junho/2026*
