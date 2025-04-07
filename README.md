# 🚀 Database Optimization Project with PostgreSQL & Node.js

## 📘 Project Overview

**Title**: Optimizing Database Performance with PostgreSQL and Node.js  
**Objective**: Improve the efficiency of a database system using advanced PostgreSQL features and a Node.js backend API. 
- This project uses a dataset from the [UCI Machine Learning Repository](https://archive.ics.uci.edu/).


## 🧠 Background

We are a team of database developers tasked with optimizing the performance of a PostgreSQL database built around a real-world dataset. The backend API is developed using Node.js, Express.js, and documented with Swagger. The system implements:

- Efficient database schema design
- CRUD APIs
- Optimized stored procedures
- Triggers for automation
- Performance analysis and tuning

---

## 📊 Dataset

We selected the **Bank Marketing** dataset from the UCI ML Repository, which contains information about marketing campaigns of a Portuguese banking institution.


## 🏗️ Project Structure

```
.
├── db/
│   ├── schema.sql
│   |-- procedures.sql
│   |── triggers.sql
│   └── seed_data.sql
├── docs/
│   |── swagger.js
│   └── images/
├── server/
│   ├── db.js
│   ├── server.js
│   └── routes/
│       ├── customers.js
│       ├── campaigns.js
├── package.json
|── .env
└── README.md
```

---

## ✅ Features

### 1. 📐 Schema Design & Data Population

- Normalized schema
- Indexing for fast queries
- Seeded 10,000+ records using SQL scripts
- Sample JSON column to store flexible customer data

### 2. 🔧 Backend API (Node.js + Express)

- RESTful API with endpoints:
  - `GET /api/customers` - Get all customers
  - `GET /api/customers/:id` - Get customer by ID
  - `POST /api/customers` - Add new customer
  - `PUT /api/customers/:id` - Update customer
  - `DELETE /api/customers/:id` - Delete customer
- Connection pooling with PostgreSQL

### 3. 📑 API Documentation

- Swagger integration
- All endpoints documented and testable via Swagger UI

![Swagger UI](docs/images/UI.png)

### 4. 🚀 Query Optimization

- **Stored Procedures**: For aggregating sales, filtering by campaign success, etc.
- **Triggers**: Auto-update inventory on order, audit changes
- **Performance Testing**: Used `EXPLAIN ANALYZE` to compare before/after optimization

![Explain Analyze](images/performance-compare.png)

---

## 📦 Installation & Usage

### Prerequisites

- Node.js
- PostgreSQL
- npm
- OCI Account (for deployment)

### Setup

1. Clone the repository:

```bash
git clone https://github.com/yourusername/db-optimization-project.git
cd db-optimization-project
```

2. Install dependencies:

```bash
npm install
```

3. Create and configure `.env` file:

```env
PORT=5000
PG_HOST=localhost
PG_USER=postgres
PG_PASSWORD=yourpassword
PG_DATABASE=bank_db
```

4. Initialize and seed database:

```bash
psql -U postgres -d bank_db -f db/init.sql
psql -U postgres -d bank_db -f db/seed_data.sql
psql -U postgres -d bank_db -f db/procedures.sql
psql -U postgres -d bank_db -f db/triggers.sql
```

5. Run the server:

```bash
npm start
```

6. Access API Docs:

```
http://localhost:8080/api-docs
```

---

## 📈 Performance Report

| Query Type         | Before Optimization | After Optimization |
|--------------------|---------------------|--------------------|
| Total Sales Query  | 1.2s                | 0.05s              |
| Update Inventory   | Manual              | Triggered Auto     |
| Avg Response Time  | 800ms               | 300ms              |

---

## 🎯 Deliverables

- ✅ Optimized PostgreSQL schema
- ✅ Node.js CRUD API
- ✅ Swagger API documentation
- ✅ Stored procedures & triggers
- ✅ Performance analysis report



## 📚 References

- [UCI Bank Marketing Dataset](https://archive.ics.uci.edu/ml/datasets/bank+marketing)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [Swagger OpenAPI Docs](https://swagger.io/docs/)
- [Node.js](https://nodejs.org/)
- [Express.js](https://expressjs.com/)

---

## ✍️ Authors

- Eric Nzyoka and Team  
- Backend Development by: Eric  
- Database & Optimization: Team effort  

---

## 📸 Screenshots

### 📊 ER Diagram
![ER Diagram](images/erd.png)

### 📋 Swagger API Docs
![Swagger UI](images/swagger-ui.png)

### 🔍 Query Performance Before/After
![Query Comparison](images/performance-compare.png)

---

## 💡 Future Improvements

- Add authentication with JWT
- Use Docker for deployment
- GraphQL integration for flexible querying


