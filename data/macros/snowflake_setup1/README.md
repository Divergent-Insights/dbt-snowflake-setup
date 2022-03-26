Snowflake Setup 1
Storage: decentralised where each database represents a source system
Compute: 
  - Centralised: there are two types of warehouses for the whole organization: nonprod and prod
  - More warehouses can be added as required to cope with demand e.g. nonprod_warehouse1, nonprod_warehouse2, prod_warehouse1
  - Specialised warehouse can added ondemand for teams with their own budget e.g. nonprod_team1_warehouse1 and prod_team1_warehouse1
  - The first non production warehouse is also used for administrative purposes 
    (Note: most of the time admin queries are not charged and do not require a warehouse anyway)