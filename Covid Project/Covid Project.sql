--- Visualizing Complete data of CovidDeaths and CovidVaccinations
Select * from CovidDeaths
Select * from CovidVaccinations 
 
--- Data about total cases, total deaths and population
Select Location,date,total_cases,new_cases,total_deaths,population
from CovidDeaths
where continent is not null
order by 1,2

--- Death Percentage of Germany and India 
Select Location,date,total_cases,total_deaths,
(total_deaths/total_cases)* 100 as Death_Percentage
from CovidDeaths
where location=  'Germany' OR location=  'India' and  continent is not null
order by 1,2

--- Infected Percentage of Germany and India 
Select Location,date,total_cases,Population,
(total_cases/Population)* 100 as Infected_Percentage
from CovidDeaths
where continent is not null
where location=  'Germany' OR location=  'India'
order by 1,2

--- Highest Infected Countries
Select Location,Population,MAX(total_cases) as Highest_Infection_Count,
MAX((total_cases/Population))* 100 as Infected_Percentage
from CovidDeaths
where continent is not null
Group by location, Population
order by Infected_Percentage desc

--- Highest Death rate by Countries
Select Location,MAX(cast(total_deaths as int)) as Highest_Death_Count
from CovidDeaths
where continent is not null
Group by location
order by Highest_Death_Count desc


--- Highest Death rate by Continent
Select continent,MAX(cast(total_deaths as int)) as Highest_Death_Count
from CovidDeaths
where continent is not null
Group by continent
order by Highest_Death_Count desc

--- Global Numbers
Select SUM(new_cases) as Total_newCase, SUM(cast(new_deaths as int)) as Total_newDeaths,
SUM(cast(new_deaths as int))/SUM(new_cases)*100 as Deaths_per_Newcase_Percentage
from CovidDeaths
where continent is not null
--group by date
order by 1,2 


--- Total vaccination 
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(cast(vac.new_vaccinations as int)) OVER 
(partition by dea.location order by dea.location, dea.date) as Rolling_people_vaccinated,
--(Rolling_people_vaccinated)
from CovidDeaths dea
Join CovidVaccinations as vac
on dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null
order by 2,3

---Common Table Expression (CTE)
With PopVsVac (Continent, location, date, population,new_vaccinations,
Rolling_people_vaccinated)
as

(Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(cast(vac.new_vaccinations as int)) OVER 
(partition by dea.location order by dea.location, dea.date) as Rolling_people_vaccinated
from CovidDeaths dea
Join CovidVaccinations as vac
on dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null)
Select * , (Rolling_people_vaccinated/Population)*100 as Rolling_people_vaccinated_Percentage
from PopVsVac

--- Temp Table
Drop table if exist #Percentage_Vaccinated_People

Create table #Percentage_Vaccinated_People
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
Rolling_people_vaccinated numeric
)

Insert into #Percentage_Vaccinated_People
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(cast(vac.new_vaccinations as int)) OVER 
(partition by dea.location order by dea.location, dea.date) as Rolling_people_vaccinated
from CovidDeaths dea
Join CovidVaccinations as vac
on dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null

Select * , (Rolling_people_vaccinated/Population)*100 as Rolling_people_vaccinated_Percentage
from #Percentage_Vaccinated_People

---Create View to store data in visualization 

Create View Percentage_Vaccinated_People as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(cast(vac.new_vaccinations as int)) OVER 
(partition by dea.location order by dea.location, dea.date) as Rolling_people_vaccinated
from CovidDeaths dea
Join CovidVaccinations as vac
on dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null


select * 
from Percentage_Vaccinated_People