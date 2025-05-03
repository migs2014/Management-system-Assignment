# Management-system-Assignment
##    QUESTION 1
##  School Record Database System  

### **Project Title:**  
**School Database System**  

### **Description:**  
This project defines a structured relational database system for managing students, parents, academic pathways, subjects, and administrative organization within a school. It includes tables such as **class (Grade levels), streams (NORTH, EAST, WEST, SOUTH), student records, parental information, academic pathways, subjects, and counties**. The database integrates foreign key constraints and cascading delete operations to maintain referential integrity.  

### **How to Run / Setup the Project:**  
#### **Prerequisites:**  
- Install MySQL Server ([Download MySQL](https://dev.mysql.com/downloads/))  
- Install MySQL Workbench or another SQL client  
- Ensure you have administrative privileges to create databases and tables  

#### **Setup Instructions:**  
1. **Create a new database:**  
   ```sql
   CREATE DATABASE schoolDB;
   USE schoolDB;
   ```

2. **Execute SQL table creation scripts:**  
   - Run the `CREATE TABLE` statements sequentially starting with `class`, `streams`, `student`, `parent`, `county`, `pathways`, and `subjects`.  
   - Each table follows foreign key dependencies, so execute in the correct order.  

3. **Insert Sample Data:**  
   - Use the `INSERT INTO` commands provided above to populate the tables with sample data.  
   - Ensure referenced foreign keys exist before inserting dependent records.  

4. **Verify Data Integrity:**  
   - Check each table using:  
     ```sql
     SELECT * FROM table_name;
     ```
   - Example:  
     ```sql
     SELECT * FROM student;
     ```

5. **Test Relationships:**  
   - Ensure foreign key constraints are working as expected.  
   - Test **ON DELETE CASCADE** behavior by deleting parent records and verifying dependent records are also removed:  
     ```sql
     DELETE FROM student WHERE studentID = 1;
     ```

 



# ERD LINK
https://viewer.diagrams.net/?tags=%7B%7D&lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1&dark=auto#G1A-f6MeMkyokrj4d4annBjEkYmcF8mnIY