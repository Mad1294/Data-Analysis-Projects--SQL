# COVID Data Exploration Project

This project involves exploring COVID-19 data using SQL queries in SQL Server Management Studio (SSMS).
The dataset used contains information about COVID deaths and COVID vaccinations. Below is a description of the queries performed in this project:

## Description of Queries

1. **Visualizing Complete Data of CovidDeaths and CovidVaccinations**: This query retrieves all the data from the `CovidDeaths` and `CovidVaccinations` tables.

2. **Data about Total Cases, Total Deaths, and Population**: This query selects specific columns from the `CovidDeaths` table, including location, date, total cases, new cases, total deaths, and population. It orders the results by location and date.

3. **Death Percentage of Germany and India**: This query calculates the death percentage for Germany and India based on the total cases and total deaths.

4. **Infected Percentage of Germany and India**: This query calculates the infected percentage for Germany and India based on the total cases and population.

5. **Highest Infected Countries**: This query identifies the countries with the highest infection count and calculates the infected percentage for each country.

6. **Highest Death Rate by Countries**: This query identifies the countries with the highest death count.

7. **Highest Death Rate by Continent**: This query identifies the continents with the highest death count.

8. **Global Numbers**: This query calculates the total new cases, total new deaths, and the percentage of deaths per new case globally.

9. **Total Vaccination**: This query retrieves data about total vaccination, including new vaccinations and rolling people vaccinated, from both the `CovidDeaths` and `CovidVaccinations` tables.

10. **Common Table Expression (CTE)**: This query uses a Common Table Expression (CTE) to calculate the percentage of rolling people vaccinated based on population.

11. **Temp Table**: This query creates a temporary table to store data about the percentage of vaccinated people and calculates the rolling people vaccinated percentage.

12. **Create View to Store Data in Visualization**: This query creates a view named `Percentage_Vaccinated_People` to store data for visualization purposes.

## Conclusion

These SQL queries provide valuable insights into various aspects of the COVID-19 pandemic, including cases, deaths, vaccinations, and related percentages. The results obtained from these queries can be further analyzed and visualized to gain a better understanding of the global COVID-19 situation.

