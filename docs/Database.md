✅ Great! Based on **Section 2**, here’s a clear **schema design** for optimizing the **Bank Marketing** dataset using **PostgreSQL**. We'll use **normalization** to split the data into multiple related tables for better performance, readability, and easier maintenance.

---

### 🔧 **1. Optimized PostgreSQL Schema Design**

#### 🧑‍💼 `customers`  
Stores client personal information.

```sql
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    age INT,
    job VARCHAR(50),
    marital VARCHAR(20),
    education VARCHAR(50),
    default_credit VARCHAR(10),
    housing VARCHAR(10),
    loan VARCHAR(10)
);
```

#### ☎️ `contacts`  
Stores info about last contact.

```sql
CREATE TABLE contacts (
    contact_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    contact_type VARCHAR(20),
    month VARCHAR(10),
    day_of_week VARCHAR(10),
    duration INT  -- Use for benchmarking only
);
```

#### 📞 `campaigns`  
Tracks campaign interaction details.

```sql
CREATE TABLE campaigns (
    campaign_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    campaign INT,
    pdays INT,
    previous INT,
    poutcome VARCHAR(20)
);
```

#### 📊 `economics`  
Holds macroeconomic context data.

```sql
CREATE TABLE economics (
    econ_id SERIAL PRIMARY KEY,
    emp_var_rate NUMERIC,
    cons_price_idx NUMERIC,
    cons_conf_idx NUMERIC,
    euribor3m NUMERIC,
    nr_employed NUMERIC
);
```

#### ✅ `subscriptions`  
Links the customer to subscription outcome + economics.

```sql
CREATE TABLE subscriptions (
    subscription_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    econ_id INT REFERENCES economics(econ_id),
    subscribed VARCHAR(5)  -- 'yes' or 'no'
);
```

---

### 🔄 **2. Relationships Overview**

| Table        | Key                      | Foreign Key Reference        |
|--------------|--------------------------|------------------------------|
| `contacts`   | `customer_id`            | `customers(customer_id)`     |
| `campaigns`  | `customer_id`            | `customers(customer_id)`     |
| `subscriptions` | `customer_id`, `econ_id` | `customers`, `economics` |

---

### 📥 **Next Step: Data Population**
Write data population scripts using PostgreSQL `COPY` or `INSERT` with at least 10,000 records.

  - A CSV template for each table..
    - A Node.js script to populate the tables...