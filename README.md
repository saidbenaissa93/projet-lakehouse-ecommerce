# 🏗️ Lakehouse E-commerce — Olist

Projet end-to-end de Data Engineering : infrastructure as code, modélisation dimensionnelle, transformation de données et visualisation BI, à partir du dataset public [Olist Brazilian E-Commerce](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce).

## 🎯 Objectif

Reproduire un pipeline de données moderne type ELT, de l'infrastructure cloud jusqu'au dashboard, en appliquant les bonnes pratiques d'un environnement Data Engineering en entreprise.

## 🏛️ Architecture

```
Terraform  →  Provisionne l'infrastructure Snowflake (warehouse, database, schémas)
    ↓
Snowflake  →  Data warehouse cloud (RAW → STAGING → MARTS)
    ↓
dbt        →  Transformation et modélisation dimensionnelle (schéma en étoile)
    ↓
Power BI   →  Dashboards et analyse des ventes
```



## 🛠️ Stack technique

| Domaine | Outil |
|---|---|
| Infrastructure as Code | Terraform |
| Data Warehouse | Snowflake (AWS) |
| Transformation | dbt |
| Visualisation | Power BI |
| Versioning | Git / GitHub |
| Langage | SQL, Python (exploration) |

## 📊 Modélisation dimensionnelle

Schéma en étoile construit à partir de 9 tables sources brutes :

**Table de faits**
- `fact_ventes` (grain : un article vendu dans une commande) — mesures : prix, frais de port, montant payé

**Dimensions**
- `dim_client` — clients uniques (déduplication sur `customer_unique_id`)
- `dim_produit` — produits et catégories (traduction EN incluse)
- `dim_seller` — vendeurs
- `dim_date` — calendrier généré

## ✅ Qualité des données

Tests dbt automatisés sur les clés de dimension :
- Unicité (`unique`)
- Non-nullité (`not_null`)

```bash
dbt test
```

## 📁 Structure du projet

```
├── terraform/            # Infra as code (warehouse, database, schémas Snowflake)
├── lakehouse_dbt/         # Projet dbt (staging + marts)
│   ├── models/
│   │   ├── staging/       # Nettoyage et typage des sources brutes
│   │   └── marts/         # Schéma en étoile (fact + dimensions)
├── tables_explore.ipynb   # Exploration initiale des données (pandas)
└── README.md
```