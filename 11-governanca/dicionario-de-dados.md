# Dicionário de Dados — Painel de Produtividade

**Base:** demandas.csv  
**Atualização:** Mensal  
**Data Owner:** Squad Dados  
**Data Steward:** PMO de Dados  

| Coluna | Tipo | Descrição | Valores Possíveis | Exemplo | Obrigatório |
|--------|------|-----------|-------------------|---------|-------------|
| DemandaID | Inteiro | Identificador único da demanda | 1 a N | 1 | Sim |
| Titulo | Texto | Nome descritivo da demanda | Texto livre | Pipeline de dados #0001 | Sim |
| SquadID | Inteiro | Código do squad responsável | 1 a 8 | 5 | Sim |
| StatusID | Inteiro | Situação atual da demanda | 1=Aberto, 2=Em Andamento, 3=Concluído, 4=Bloqueado, 5=Cancelado | 3 | Sim |
| PrioridadeID | Inteiro | Nível de urgência | 1=Crítica(5d), 2=Alta(10d), 3=Média(20d), 4=Baixa(30d) | 2 | Sim |
| CategoriaID | Inteiro | Tipo da demanda | 1=Desenvolvimento, 2=Manutenção, 3=Melhoria, 4=Bug, 5=Infraestrutura, 6=Compliance | 1 | Sim |
| ResponsavelID | Inteiro | Código do analista responsável | 1 a 24 | 13 | Sim |
| DataAbertura | Data | Data de criação da demanda | YYYY-MM-DD | 2024-03-15 | Sim |
| DataPrazo | Data | Prazo de entrega conforme SLA | YYYY-MM-DD | 2024-03-25 | Sim |
| DataFechamento | Data | Data de conclusão ou cancelamento | YYYY-MM-DD ou vazio | 2024-03-22 | Não |
