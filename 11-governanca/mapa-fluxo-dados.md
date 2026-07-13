# Mapa de Fluxo de Dados — Painel de Produtividade

**Domínio:** Gestão de Demandas de TI  
**Data Owner:** Squad Dados  
**Data Steward:** PMO de Dados  
**Última atualização:** Jun/2025  

---

## Fluxo de Dados

```
[Origem]          [Ingestão]        [Armazenamento]    [Consumo]
Jira (demandas)  →  ELT             →  Databricks      →  Power BI
ServiceNow       →  Time de Domínio →  Lakehouse        →  Dashboard
Excel (manual)   →                  →  (camada Gold)    →  CIO Office
```

## Detalhamento por Etapa

| Etapa | Sistema | Responsável | Frequência | Dado Tratado |
|-------|---------|-------------|------------|--------------|
| Origem | Jira / ServiceNow | Times de squad | Tempo real | Demandas, status, datas |
| Ingestão (ELT) | Databricks Pipelines | Time de Engenharia | Diária | Extração e transformação |
| Armazenamento | Databricks Lakehouse | Time de Domínio | Diária | Tabelas Gold estruturadas |
| Visualização | Power BI | PMO de Dados | Mensal | KPIs, SLA, backlog |
| Consumo | Dashboard publicado | CIO Office / Gestores | Sob demanda | Indicadores executivos |

## Pontos de Controle de Qualidade

| Ponto | Controle | Responsável |
|-------|----------|-------------|
| Entrada no ELT | Validação de schema e tipos | Engenharia de Dados |
| Camada Gold | Checklist de qualidade (6 dimensões) | PMO de Dados |
| Publicação Power BI | Revisão de KPIs com Data Owner | PMO de Dados |
| Acesso ao Dashboard | Controle por perfil (RLS) | TI / Segurança |

## Riscos Identificados

| Risco | Probabilidade | Impacto | Mitigação |
|-------|---------------|---------|-----------|
| Entrada manual via Excel sem validação | Alta | Alto | Substituir por integração direta |
| Dado desatualizado no dashboard | Média | Alto | Alertar quando atualização > 30 dias |
| Acesso não autorizado a dados de squads | Baixa | Alto | Implementar RLS por área |
