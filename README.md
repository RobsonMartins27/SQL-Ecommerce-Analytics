# 📊 Análise de Performance de Vendas e Retenção - TechStore

## 📝 Sobre o Projeto
Este projeto simula um cenário real de análise de dados para um E-commerce de eletrônicos (SaaS).
O objetivo foi atuar como Analista de Dados para responder a perguntas estratégicas da diretoria sobre performance de produtos, sazonalidade de faturamento e comportamento de retenção dos clientes.

**Ferramentas utilizadas:**
* **SQL (MySQL)**
* **Técnicas:** Window Functions (`LAG`, `OVER`), CTEs (`WITH`), Joins e Agregações.

---

## 🎯 Perguntas de Negócio Resolvidas

### 1. Quais são os produtos campeões de vendas (Volume)?
O time de estoque precisava identificar a Curva ABC de produtos.
* **Insight:** O item "Mouse Sem Fio" representa o maior volume de vendas, porém possui ticket médio baixo.

### 2. Como está a saúde financeira mensal (Sazonalidade)?
A diretoria precisava entender a tendência de faturamento no Q1 de 2023.
* **Insight:** Houve um pico de vendas em Janeiro (provável efeito pós-natal), seguido de uma queda abrupta em Fevereiro e Março, indicando necessidade de novas campanhas de marketing.

### 3. Qual o tempo médio para um cliente comprar novamente (Retenção)?
Para definir a cadência de e-mails marketing, precisávamos calcular o "Lag Time" (tempo entre compras).
* **Técnica:** Utilizei **Window Functions (LAG)** para comparar a data da compra atual com a anterior de cada cliente individualmente.
* **Resultado:** O tempo médio de recompra identificado foi de **27 dias**.
* **Ação Recomendada:** Configurar disparos automáticos de ofertas no 20º dia após a compra.

---

## 🛠️ Estrutura do Código

O projeto foi dividido em duas etapas principais:

1.  **Engenharia de Dados (`schema.sql`):**
    * Modelagem do Banco de Dados (Tabelas `products`, `orders`, `order_items`).
    * Normalização e criação de relacionamentos (PK/FK).
    * Inserção de massa de dados para testes.

2.  **Análise de Dados (`queries.sql`):**
    * Queries ad-hoc para responder às perguntas de negócio.
    * Uso de `CTE` para limpeza e preparação prévia dos dados.
    * Cálculo de métricas complexas (KPIs) com funções de janela.

---

## 🚀 Como executar
Para reproduzir este projeto:
1.  Clone este repositório.
2.  Abra o arquivo `schema.sql` no seu banco de dados MySQL para criar a estrutura.
3.  Execute as queries do arquivo `queries.sql` para ver os resultados.

---
*Autor: Robson Martins*
