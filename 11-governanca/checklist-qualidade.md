# Checklist de Qualidade de Dados — PMO de Dados

**Objetivo:** Validar a qualidade de uma base antes de publicar 
relatórios ou dashboards executivos.  
**Aplicar em:** Toda nova fonte de dados ou atualização significativa.  
**Responsável:** Data Steward / PMO de Dados  

---

## 1. Completude
- [ ] Todas as colunas obrigatórias estão preenchidas?
- [ ] O percentual de nulos está dentro do limite aceitável (< 5%)?
- [ ] Campos opcionais com ausência têm justificativa documentada?

## 2. Acurácia
- [ ] Os valores estão dentro dos domínios esperados?
- [ ] Datas de fechamento são posteriores às datas de abertura?
- [ ] IDs de referência existem nas tabelas dimensão correspondentes?

## 3. Consistência
- [ ] O mesmo indicador tem o mesmo valor em sistemas diferentes?
- [ ] As categorias seguem o mesmo vocabulário controlado?
- [ ] Não há conflito entre StatusID e DataFechamento 
      (ex: Status=Aberto mas DataFechamento preenchida)?

## 4. Atualidade
- [ ] A data da última atualização está documentada?
- [ ] O dado reflete o período correto para a análise?
- [ ] Existe processo definido de atualização periódica?

## 5. Unicidade
- [ ] A chave primária (ex: DemandaID) é única por linha?
- [ ] Não há registros duplicados para o mesmo evento?

## 6. Validade
- [ ] Datas estão no formato correto (YYYY-MM-DD)?
- [ ] Valores numéricos estão dentro dos limites possíveis?
- [ ] Textos livres não contêm caracteres inválidos ou encoding errado?

---

## Resultado da Validação

| Dimensão | Status | Observação |
|----------|--------|------------|
| Completude | | |
| Acurácia | | |
| Consistência | | |
| Atualidade | | |
| Unicidade | | |
| Validade | | |

**Aprovado para publicação?** [ ] Sim [ ] Não  
**Data da validação:**  
**Validado por:**
