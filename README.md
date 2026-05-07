# AASTU-DB-Project-Group--4-

---

## 🗄️ Database Design (ERD Summary)

Our ERD consists of the following main entities:

### **USER**
- `user_id` (PK)
- `full_name`, `email`, `phone`, `password`
- `role` – either `owner` or `tenant`

### **PROPERTY**
- `property_id` (PK)
- `title`, `description`, `property_type`
- `price`, `bedrooms`, `area_size` (sq ft)
- `status` – `available`, `rented`, or `not_available`
- Foreign key to `USER` (owner who lists the property)
- Foreign key to `LOCATION`

### **LOCATION**
- `location_id` (PK)
- `city`, `subcity`

### **PROPERTY_PHOTO**
- `photo_id` (PK)
- `photo_url`
- Foreign key to `PROPERTY`

### Relationships:
- A **USER** can *list* many **PROPERTIES** (owner role)
- A **PROPERTY** is *located in* one **LOCATION**
- A **PROPERTY** can *have* many **PHOTOS**

The design is normalized up to **BCNF** (Boyce–Codd Normal Form).

---

## ⚙️ Technologies Used

| Tool | Purpose |
|------|---------|
| MySQL Workbench | Relational database implementation |
| MongoDB Compass | NoSQL document database |
| draw.io | ER diagram creation |
| GitHub | Version control & collaboration |
| Google Docs | Report writing & formatting |

---
How to Run This Project
MySQL:
Open MySQL Workbench

Run /mysql/schema.sql to create tables

Run /mysql/sample_data.sql to insert sample records

Run /mysql/queries.sql to test queries

MongoDB:
Open MongoDB Compass or shell

Create a new database named property_management

Import collections from /mongodb/collections.json

Insert documents from /mongodb/sample_documents.json

Run queries from /mongodb/queries.js

#Lessons Learned 

Normalization improves data integrity but increases joins in MySQL.

MongoDB offers flexibility for nested structures (e.g., photos embedded in property documents).

GitHub collaboration requires discipline with branches and pull requests.

Instructor: [yaynshet medhin(mr.)]
Course: Database Systems
