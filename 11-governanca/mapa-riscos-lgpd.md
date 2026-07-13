# Mapa de Riscos LGPD — Cenário Fictício

## Cenário
Projeto: Cruzar dados de transações de cartão com dados de navegação 
no app para identificar padrão de comportamento de clientes.

## Análise LGPD

| Item | Análise |
|------|---------|
| Tipo de dado | Pessoal (transações) + Comportamental (navegação no app) |
| Base legal aplicável | Consentimento ou Legítimo Interesse |
| Dado sensível envolvido? | Não diretamente — verificar se há inferência de saúde ou religião pelo padrão de compras |
| Risco de reidentificação | Alto — cruzamento aumenta granularidade |
| Necessidade de anonimização | Sim — em ambiente de dev e testes |
| DPO deve ser consultado? | Sim — novo cruzamento de dados requer análise |
| Privacy by Design aplicado? | Verificar se dado agregado resolve o objetivo antes de usar dados individuais |

## Controles Propostos
- Pseudonimizar CPF antes do cruzamento
- Manter log de acesso aos dados cruzados
- Definir prazo de retenção máximo para a base gerada
- Comunicar ao DPO antes do início do projeto
- Registrar base legal no catálogo de dados
