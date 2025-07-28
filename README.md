# 🧬 Pathology Lab Management System (DBMS Mini Project)

This is a mini DBMS project built using **MySQL** that simulates the internal database operations of a pathology laboratory. It demonstrates how to design, implement, and manage a relational database system using core SQL concepts.

---

## 🎯 Project Objective

To design and develop a relational database that efficiently manages patient records, lab tests, doctors, test results, and staff information for a pathology lab. The system is intended for academic purposes to showcase skills in SQL, relational design, and query operations.

---

## 💡 Key Features

- Relational schema with primary and foreign keys
- Data validation using `CHECK`, `ENUM`, and `NOT NULL`
- Data insertion with sample records
- Joins (INNER, LEFT, RIGHT, SELF, FULL OUTER via UNION)
- String, arithmetic, aggregate, and date/time functions
- Views for simplifying complex queries
- Conditional logic using `CASE`
- Access control via user and privilege management
- Implicit cursor simulation
- Set operators like `UNION`, `INTERSECT` (via `IN`)
- ER Diagram included

---

## 📁 Contents

- `schema.sql` – DDL scripts to create the database and tables with constraints
- `data_inserts.sql` – DML insert queries with sample data for all entities
- `queries.sql` – Demonstrates string functions, aggregate queries, joins, CASE statements, set operators, etc.
- `views.sql` – SQL view(s) to simplify and format test result outputs
- `users_and_privileges.sql` – User creation and access control using DCL statements
- `ER_Diagram.png` – Entity-Relationship Diagram illustrating the database structure and table relationships
- `README.md` – Project overview, usage instructions, and learning outcomes

---

## 🛠 Technologies Used

- **Database:** MySQL 8+
- **Tool:** MySQL Workbench
- **Language:** SQL (DDL, DML, DCL, TCL, DQL)

---

## 📚 Learning Outcomes

- Understand and apply relational DBMS design
- Practice SQL queries (simple and advanced)
- Build normalized schemas with integrity constraints
- Perform CRUD operations and implement access control
- Generate meaningful data insights using SQL

---

## 🚀 How to Run the Project

1. **Open MySQL Workbench** or any SQL client.
2. Run `schema.sql` to create the database and all tables.
3. Run `data_inserts.sql` to populate the tables with sample data.
4. Explore `queries.sql` to see different SQL operations in action.
5. Use `views.sql` to create and query a simplified view.
6. Run `users_and_privileges.sql` to create users and assign permissions (optional).
7. Refer to `ER_Diagram.png` for a quick understanding of schema design.

---

## 🔐 Optional Enhancements

- Add triggers for logging test updates or salary changes
- Build a simple frontend using HTML + PHP or Python Flask
- Connect with real-world data or simulated form inputs

---

## 📄 License

This project is intended for educational use only and is not production-ready. You are free to use, modify, and extend it for learning purposes.

---

## 👩‍💻 Author

Designed and developed by Anuja 
💬 Feel free to fork or star the repo if you found it useful!

