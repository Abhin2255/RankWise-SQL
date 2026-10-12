# RankWise-SQL

## 📌 Project Overview

This project demonstrates how to use SQL to identify the **top 3 students from each course based on their marks**. It uses a Common Table Expression (CTE), the `RANK()` window function, and `PARTITION BY` to rank students within each course.

This project is designed to practice SQL concepts commonly asked in data analyst and data science interviews.

## 🎯 Project Objective

- Create a database and a Students table.
- Insert student records with details such as name, age, gender, course, marks, and city.
- Rank students separately within each course.
- Display the top 3 ranked students from every course.

## 🛠️ Technologies Used

- **Database:** MySQL
- **Language:** SQL
- **Concepts:** CTE, Window Functions, `PARTITION BY`, `RANK()`, `ORDER BY`

## 📂 Database Structure

**Table Name:** `Students11`

| Column | Data Type | Description |
|---|---|---|
| Student_id | INT | Unique student ID |
| NAME | VARCHAR(50) | Student name |
| age | INT | Student age |
| gender | VARCHAR(50) | Student gender |
| course | VARCHAR(50) | Course name |
| Mark | INT | Student marks |
| city | VARCHAR(50) | Student city |

## 💻 SQL Implementation

### 1. Create and Select Database

```sql
CREATE DATABASE project;
USE project;
```

### 2. Create Students Table

```sql
CREATE TABLE Students11 (
    Student_id INT PRIMARY KEY,
    NAME VARCHAR(50),
    age INT,
    gender VARCHAR(50),
    course VARCHAR(50),
    Mark INT,
    city VARCHAR(50)
);
```

### 3. Insert Sample Data

```sql
INSERT INTO Students11
(Student_id, NAME, age, gender, course, Mark, city)
VALUES
(1, 'Abhin', 21, 'male', 'Data Science', 78, 'Palakkad'),
(2, 'Messi', 34, 'male', 'Python', 87, 'Argentina'),
(3, 'Fathima PV', 20, 'female', 'MySQL', 69, 'Kozhikode'),
(4, 'Shakira', 26, 'female', 'MySQL', 88, 'Colombia'),
(5, 'Sainora', 19, 'female', 'MySQL', 89, 'Malappuram');
```

### 4. View Student Records

```sql
SELECT *
FROM Students11;
```

### 5. Find the Top 3 Students from Each Course

```sql
WITH StudentRank AS (
    SELECT
        Student_id,
        NAME,
        course,
        Mark,
        RANK() OVER (
            PARTITION BY course
            ORDER BY Mark DESC
        ) AS RankNo
    FROM Students11
)
SELECT
    Student_id,
    NAME,
    course,
    Mark,
    RankNo AS `Rank`
FROM StudentRank
WHERE RankNo <= 3
ORDER BY course, RankNo;
```

## 🧠 Key SQL Concepts Explained

**1. CTE (Common Table Expression)**

A CTE creates a temporary named result set using the `WITH` clause. Here, `StudentRank` stores the student records along with their calculated ranks.

**2. PARTITION BY**

`PARTITION BY course` divides students into separate groups based on their courses. Each course gets its own ranking sequence.

**3. RANK()**

`RANK()` assigns ranks according to marks in descending order. Students with the same marks receive the same rank, and the next rank is skipped.

**4. ORDER BY**

`ORDER BY Mark DESC` sorts student marks from highest to lowest within each course.

**5. WHERE RankNo <= 3**

This filters the ranked records to show students whose rank is 3 or better.

## 📊 Expected Output

| Student_id | NAME | course | Mark | Rank |
|---:|---|---|---:|---:|
| 5 | Sainora | MySQL | 89 | 1 |
| 4 | Shakira | MySQL | 88 | 2 |
| 3 | Fathima PV | MySQL | 69 | 3 |
| 2 | Messi | Python | 87 | 1 |
| 1 | Abhin | Data Science | 78 | 1 |

*Note: The exact row order depends on the final `ORDER BY` clause. Each course has its own ranking. Courses with fewer than three students return all their students.*

## 💡 Interview Question

**Question:** How can you find the top 3 students from each course based on marks?

**Answer:** Use a CTE with `RANK()` and `PARTITION BY course`, order marks in descending order, and filter the result using `WHERE RankNo <= 3`.

### Difference Between RANK(), DENSE_RANK(), and ROW_NUMBER()

| Function | Behaviour |
|---|---|
| `RANK()` | Ties receive the same rank; subsequent ranks are skipped. |
| `DENSE_RANK()` | Ties receive the same rank; subsequent ranks are not skipped. |
| `ROW_NUMBER()` | Assigns a unique sequential number to each row. |

## 🚀 Skills Demonstrated

- SQL database creation and table management
- Data insertion and retrieval
- Window functions
- Common Table Expressions (CTEs)
- Ranking and grouping
- SQL interview problem-solving

## 📌 Conclusion

This project demonstrates how SQL window functions can solve a practical student-ranking problem. The same approach can be adapted to identify top-performing employees, highest-selling products, or the best-performing candidates within different groups.

## 👨‍💻 Author

**Abhin Krishna**

Aspiring Data Scientist | BCA in Data Science

- GitHub: [Abhin2255](https://github.com/Abhin2255)
- LinkedIn: [Abhin Krishna](https://www.linkedin.com/in/abhin-krishna-852736370/)

---

⭐ If you find this project useful, feel free to star the repository!
