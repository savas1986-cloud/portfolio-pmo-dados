# Comunicação de Risco para Stakeholders
**Autora:** Patricia Vasconcelos · **Contexto:** TechFinance S.A.
**Projeto:** Painel de Produtividade · **Data:** Junho/2026

> Exemplo de comunicação executiva de um risco real do projeto —
> o atraso do pipeline ITSM — para a Diretoria de Tecnologia.
> Demonstra como reportar um problema sem gerar pânico, com
> impacto quantificado e alternativas prontas para decisão.

---

## O princípio da comunicação executiva

Um diretor recebe dezenas de e-mails por dia. A comunicação de
risco precisa ser lida em 90 segundos e terminar com uma decisão
clara a tomar. Por isso este e-mail segue a estrutura **SCQA**:

| Elemento | O que responde | Função |
|---|---|---|
| **S**ituação | O que já sabemos e concordamos | Terreno comum |
| **C**omplicação | O que mudou / o problema | Cria a tensão |
| **Q**uestão | Qual decisão precisa ser tomada | Foca o leitor |
| **R**esposta | Recomendação + alternativas | Resolve a tensão |

**Três regras aplicadas:**
1. Sem jargão técnico — o diretor não precisa saber o que é "pipeline ELT"
2. Impacto em linguagem de negócio — prazo e entrega, não tecnologia
3. Solução pronta — nunca levar um problema sem opções

---

## O e-mail

---

**Para:** Diretoria de Tecnologia
**De:** Patricia Vasconcelos — PMO de Dados
**Assunto:** Painel de Produtividade — risco no prazo e plano de ação

---

Prezada [Diretora],

**Situação**
O Painel de Produtividade segue conforme planejado. A modelagem
de dados e as fontes principais (Jira e gestão de projetos) estão
no cronograma para a entrega de 15/07.

**Complicação**
A integração da terceira fonte de dados — o sistema de chamados —
depende de uma entrega de um fornecedor externo, prevista para
30/06. Recebemos a sinalização de que essa entrega pode atrasar.
Sem ela, os indicadores de chamados não estarão disponíveis na
data de publicação.

**Questão**
Diante desse risco, precisamos decidir: aguardamos a integração
completa antes de publicar, ou publicamos uma primeira versão
sem os dados de chamados?

**Resposta — recomendação**
Recomendo **publicar a versão inicial em 15/07 com as duas fontes
já disponíveis** (Jira e gestão de projetos), e integrar os dados
de chamados em uma segunda fase, assim que o fornecedor entregar.

Isso garante que a liderança tenha visibilidade da produtividade
das squads na data prevista, sem depender de um fator externo fora
do nosso controle.

**Alternativas avaliadas:**

| Opção | Prazo | Trade-off |
|---|---|---|
| A — Publicar versão inicial em 15/07 (recomendada) | No prazo | Dados de chamados entram na fase 2 |
| B — Aguardar integração completa | Indefinido | Depende do fornecedor — sem data garantida |

Permaneço à disposição para detalhar qualquer ponto.

Atenciosamente,
Patricia Vasconcelos
PMO de Dados — Painel de Produtividade

---

## Análise da comunicação — por que funciona

**Abre com o que está bom**
O e-mail não começa com o problema. Começa estabelecendo que o
projeto está no caminho. Isso evita o pânico inicial e mostra
controle da situação.

**Quantifica sem tecnicalidade**
"A terceira fonte depende de um fornecedor externo" comunica o
risco sem mencionar pipeline, ELT ou Databricks. O diretor entende
o impacto (dados de chamados ausentes) sem precisar do detalhe técnico.

**A questão foca a decisão**
Em vez de deixar o diretor formular a pergunta, o e-mail já a
apresenta: "aguardar ou publicar parcial?". Isso acelera a decisão.

**A recomendação vem com justificativa**
Não é só "recomendo a opção A" — é "recomendo A porque garante
visibilidade na data sem depender de fator externo". O raciocínio
está explícito.

**As alternativas mostram que houve análise**
A tabela de opções com trade-offs prova que a recomendação não é
arbitrária — outras opções foram consideradas e descartadas por
motivos claros.

---

## Erros comuns que este e-mail evita

| Erro comum | Por que prejudica | Como o e-mail evita |
|---|---|---|
| Começar pelo problema | Gera pânico antes do contexto | Abre com o que está no prazo |
| Usar jargão técnico | Diretor não entende o impacto | Linguagem de negócio |
| Reportar sem solução | Transfere o problema para o diretor | Recomendação pronta |
| Não mostrar alternativas | Parece decisão impulsiva | Tabela de opções com trade-offs |
| Texto longo | Não é lido | 90 segundos de leitura |

---

## Quando usar esta estrutura

A estrutura SCQA serve para qualquer comunicação de risco ou
mudança a stakeholders:
- Atraso de entrega
- Mudança de escopo
- Estouro de orçamento
- Risco de qualidade identificado
- Necessidade de recurso adicional

O padrão é sempre o mesmo: contexto → problema → decisão necessária
→ recomendação com alternativas.

---

*Documento elaborado com os conceitos de comunicação executiva,
estrutura SCQA, gestão de stakeholders e gestão de riscos aplicados
ao contexto de empresa de tecnologia no setor financeiro regulado.
Junho/2026*
