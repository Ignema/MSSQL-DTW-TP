INSERT INTO LIGHTADVENTUREWORKSDW.dbo.Customers(
    CustomerDwKey,  
    CustomerKey,  
    FullName,  
    EmailAddress,  
    Birthdate, 
    MaritalStatus,   
    Gender, 
    Education, 
    Occupation, 
    City, 
    StateProvince, 
    CountryRegion
)

SELECT 
    NEXT VALUE FOR LIGHTADVENTUREWORKSDW.dbo.SeqCustomerDwKey AS CustomerDwKey,
    C.CustomerKey,  
    C.FirstName  +  '  '  +  C.LastName  AS  FullName,    
    C.EmailAddress,  
    C.BirthDate, 
    C.MaritalStatus, 
    C.Gender, 
    C.EnglishEducation, 
    C.EnglishOccupation, 
    G.City, 
    G.StateProvinceName, 
    G.EnglishCountryRegionName 
    
FROM AdventureWorksDW2012.dbo.DimCustomer AS C
INNER JOIN AdventureWorksDW2012.dbo.DimGeography AS G
ON C.GeographyKey = G.GeographyKey

GO