# Eco-Friendly-Furniture-Company
✅ Project Summary: SQL Queries and Stored Procedure Development
1. Requirement Gathering
Identified the key business needs:

Viewing customer and order data

Tracking product sales

Calculating sales commissions

Updating store and salesperson data

Analyzing product attributes (color, material, size)

2. Database Schema Understanding
Reviewed and mapped relationships between tables:

Customer, Orders, OrderDetails, Product

Salesperson, Store, ProductColors, ProductMaterials, etc.

Identified primary and foreign keys to perform correct joins.

3. Query Design and Testing
Select Queries:

Used JOIN, LEFT JOIN to connect related tables.

Used GROUP BY, SUM, and COUNT for aggregation (e.g., total sales).

Used LIKE for pattern matching in product search.

Included conditional filters (WHERE, HAVING) for targeted results.

Update Queries:

Updated data in Orders and Store tables based on criteria.

4. Stored Procedure Creation
Wrote a stored procedure UpdateSalespersonForStore:

Designed to update SalesPersonID dynamically using parameters.

Used DELIMITER to define the block and BEGIN...END for logic.

Ensured procedure is reusable and parameterized for maintainability.

5. Testing & Validation
Ran each query on sample data.

Verified:

Correctness of joins and aggregations.

That update statements affected only the intended rows.

Stored procedure worked with various input values.

6. Documentation
Organized queries with comments and titles for each use case.

Structured logic for easy review and reuse.
