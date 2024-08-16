# SQL Project

## Geographical Data Integration

### **Overview**

This project involves the integration and consolidation of geographical data from multiple tables into a comprehensive and structured format. The goal is to generate a clean CSV file that can be uploaded to ServiceNow to enhance its geographical data repository.

### **Project Description**

The geographical data in this project includes various levels of administrative divisions such as countries, states, cities, and postal codes, as well as associated time zones. The data is spread across five different tables, each containing specific types of information:

1. **Countries Table:** Contains information about different countries including ISO codes and names.
2. **States Table:** Includes details about states or provinces within countries.
3. **Cities Table:** Holds data about cities and their corresponding regions.
4. **Postcodes Table:** Contains postal codes linked to cities and states.
5. **Time Zones Table:** Provides time zone information corresponding to geographical locations.
   
### **Objectives**

- **Data Consolidation:** Aggregate data from multiple tables into a single, coherent structure.
- **CSV Generation:** Export the consolidated data into a CSV file format.
- **ServiceNow Upload:** Ensure the CSV file is compatible for upload to ServiceNow.
   
### **SQL Queries**

The SQL queries in this repository perform the following tasks:

- **Data Selection:** Select necessary fields from each table and join them based on relationships.
- **Data Formatting:** Format date and time fields for consistency.
- **Data Filtering:** Apply necessary filters to ensure only relevant data is included in the output.
- **Distinct Selection:** Ensure distinct records are selected to avoid duplication.

### **How to Use**

1. **Review the Queries:** Check the SQL queries in this repository to understand the logic behind the data integration.
2. **Sample Data Only:** Note that the tables uploaded in this GitHub repository contain only a limited sample of the data.
3. **Export to CSV:** Use the output from the SQL queries to generate a CSV file.
4. **Upload to ServiceNow:** Import the CSV file into ServiceNow as per their data import guidelines.

### **Conclusion**

This project showcases my SQL capabilities in handling and transforming geographical data. By integrating and exporting data into a format suitable for ServiceNow, the project aims to streamline the process of updating geographical information in the platform.
