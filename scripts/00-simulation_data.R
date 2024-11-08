#### Preamble ####
# Purpose: Simulates a dataset of polls and relevant information about them
# Author: Prankit Bhardwaj, Veyasan Ragulan, Chris Yong Hong Sen
# Date: 4 November 2024
# Contact: prankit.bhardwaj@mail.utoronto.ca 
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(arrow)
set.seed(304)


#### Simulate data ####
# State names
states <- c(
  "Alabama",
  "Alaska",
  "Arizona",
  "California",
  "Colorado",
  "Conneticut",
  "Delware",
  "Florida",
  "Georgia",
  "Hawaii",
  "Idaho",
  "Illinois",
  "Indiana",
  "Iowa",
  "Kansas",
  "Kentucky",
  "Louisiana",
  "Maine",
  "Maryland",
  "Massachusetts",
  "Michigan",
  "Minnesota",
  "Mississippi",
  "Missouri",
  "Montana",
  "Nebraska",
  "Nevada",
  "New Hampshire",
  "New Jersey",
  "New Mexico",
  "New York",
  "North Carolina",
  "North Dakota",
  "Ohio",
  "Oklahoma",
  "Oregon",
  "Pennsylvania",
  "Rhode Island",
  "South Carolina",
  "South Dakota",
  "Tennessee",
  "Texas",
  "Utah",
  "Vermont",
  "Virginia",
  "Washington",
  "West Virginia",
  "Wisconsin",
  "Wyoming"
)

# Pollsters
pollsters <- c(
  "TIPP",                                                           
  "YouGov",                                                         
  "RMG Research",                                                   
  "ActiVote",                                                       
  "InsiderAdvantage",                                               
  "Morning Consult",                                                
  "Mitchell",                                                       
  "Patriot Polling",                                                
  "Emerson",                                                        
  "Redfield & Wilton Strategies",                                   
  "Cygnal",                                                         
  "Beacon/Shaw",                                                    
  "Quinnipiac",                                                     
  "SurveyUSA",                                                      
  "Fairleigh Dickinson",                                            
  "HarrisX/Harris Poll",                                            
  "SoCal Strategies",                                               
  "Ipsos",                                                          
  "Trafalgar Group",                                                
  "Elway",                                                          
  "HarrisX",                                                        
  "MRG (Marketing Resource Group)",                                 
  "Marist",                                                         
  "Siena/NYT",                                                      
  "UMass Amherst/YouGov",                                           
  "American Pulse",                                                 
  "University of Massachusetts Lowell/YouGov",                      
  "Marquette Law School",                                           
  "U. Houston",                                                     
  "Alaska Survey Research",                                         
  "Fabrizio/McLaughlin",                                            
  "Yale Youth Poll",                                                
  "co/efficient",                                                   
  "Torchlight Strategies",                                          
  "J.L. Partners",                                                  
  "Tarrance",                                                       
  "Hart/POS",                                                       
  "Change Research",                                                
  "Fabrizio/Impact",                                                
  "Fabrizio/GBAO",                                                  
  "Targoz Market Research",                                         
  "Research Co.",                                                   
  "The Washington Post",                                            
  "Hunt Research",                                                  
  "Noble Predictive Insights",                                      
  "Florida Atlantic University/Mainstreet Research",                
  "Arc Insights",                                                   
  "Pew",                                                            
  "Suffolk",                                                        
  "Big Village",                                                    
  "Glengariff Group Inc.",                                          
  "Mason-Dixon",                                                    
  "Christopher Newport U.",                                         
  "Data for Progress",                                              
  "Impact Research",                                                
  "St. Anselm",                                                     
  "YouGov/Center for Working Class Politics",                       
  "OnMessage Inc.",                                                 
  "Bullfinch",                                                      
  "UC Berkeley",                                                    
  "Susquehanna",                                                    
  "WPAi",                                                           
  "Leger",                                                          
  "HighGround",                                                     
  "National Research",                                              
  "Global Strategy Group/North Star Opinion Research",              
  "Winthrop U.",                                                    
  "High Point University",                                          
  "PPP",                                                            
  "UMBC" ,                                                          
  "McCourtney Institute/YouGov",                                    
  "Bowling Green State University/YouGov",                          
  "East Carolina University",                                       
  "Lake Research",                                                  
  "Outward Intelligence",                                           
  "Echelon Insights",                                               
  "Quantus Insights",                                               
  "ARW Strategies",                                                 
  "McLaughlin",                                                     
  "Victory Insights",                                               
  "CNN/SSRS",                                                       
  "AtlasIntel",                                                     
  "Benenson Strategy Group/GS Strategy Group",                      
  "Virginia Commonwealth U.",                                       
  "USC Dornsife/CSU Long Beach/Cal Poly Pomona",                    
  "Clarity",                                                        
  "University of Maryland/Washington Post",                         
  "Slingshot Strategies",                                           
  "Meredith College",                                               
  "Embold Research",                                                
  "Remington",                                                      
  "Muhlenberg",                                                     
  "University of Delaware",                                         
  "Texas Hispanic Policy Foundation",                               
  "MassINC Polling Group",                                          
  "Angus Reid",                                                     
  "U. New Hampshire",                                               
  "Capitol Weekly",                                                 
  "Siena",                                                          
  "Focaldata",                                                      
  "U. Georgia SPIA",                                                
  "Pan Atlantic Research",                                          
  "Franklin and Marshall College",                                  
  "Keating Research",                                               
  "Research & Polling",                                             
  "Elon U.",                                                        
  "Quantus Polls and News",                                         
  "GQR",                                                            
  "Selzer",                                                         
  "Data Orbital",                                                   
  "CWS Research",                                                   
  "Research America",                                               
  "PPIC",                                                           
  "Washington Post/George Mason University",                        
  "U. Rhode Island",                                                
  "Hendrix College",                                                
  "SurveyMonkey",                                                   
  "Kaiser Family Foundation",                                       
  "PRRI",                                                           
  "Big Data Poll",                                                  
  "Echelon Insights/GBAO",                                         
  "SoonerPoll.com",                                                 
  "Gonzales Research & Media Services",                             
  "Wick",                                                           
  "Global Strategy Group",                                          
  "Fabrizio/David Binder Research",                                 
  "EPIC/MRA",                                                       
  "Z to A Research",                                                
  "Survey Center on American Life",                                 
  "Cherry Communications",                                          
  "Kaplan Strategies",                                              
  "SurveyUSA/High Point University",                                
  "Fabrizio Ward",                                                  
  "BK Strategies",                                                  
  "Spry Strategies",                                                
  "Roanoke College",                                               
  "University of Houston/Texas Southern University" ,               
  "Strategies 360" ,                                                
  "YouGov Blue" ,                                                   
  "Navigator"  ,                                                    
  "Peak Insights" ,                                                 
  "Iron Light" ,                                                    
  "Fabrizio" ,                                                      
  "Trafalgar Group/InsiderAdvantage" ,                              
  "Civiqs",                                                         
  "YouGov/SNF Agora" ,                                              
  "Public Opinion Strategies",                                      
  "U. North Florida" ,                                              
  "SoCal Research"  ,                                               
  "Hoffman Research" ,                                              
  "North Star Opinion Research" ,                                   
  "Landmark Communications" ,                                       
  "Praecones Analytica" ,                                           
  "3W Insights" ,                                                   
  "DHM Research" ,                                                  
  "Manhattan Institute",                                            
  "Lord Ashcroft Polls" ,                                           
  "Bendixen & Amandi International" ,                               
  "PureSpectrum"                ,                                   
  "Split Ticket/Data for Progress" ,                                
  "National Public Affairs" ,                                       
  "1983 Labs"      ,                                                
  "1892 Polling"  ,                                                 
  "University of Texas at Tyler" ,                                  
  "P2 Insights" ,                                                   
  "Innovative Research Group" ,                                     
  "SSRS"  ,                                                         
  "The Tyson Group" ,                                               
  "KAConsulting LLC" ,                                              
  "Prime Group" ,                                                   
  "Digital Research",                                               
  "Meeting Street Insights",                                        
  "Faucheux Strategies",                                            
  "John Zogby Strategies" ,                                         
  "Texas Lyceum",                                                   
  "Hart Research Associates",                                       
  "RABA Research",                                                  
  "UpOne Insights/BSG" ,                                            
  "Split Ticket"   ,                                                
  "New Bridge Strategy/Aspect Strategic",                           
  "St. Pete Polls"    ,                                             
  "GS Strategy Group"  ,                                            
  "Axis Research",                                                  
  "Rasmussen" ,                                                     
  "The Citadel"  ,                                                  
  "Chism Strategies" ,                                              
  "Dan Jones"      ,                                                
  "Target Insyght" ,                                                
  "VCreek/AMG"     ,                                                
  "Cygnal/Aspect Strategic",                                        
  "Tulchin Research"  ,                                             
  "NORC"        ,                                                   
  "Abacus Data" ,                                                   
  "Let's Preserve the American Dream"   ,                           
  "Ohio Northern University Institute for Civics and Public Policy",
  "Murphy Nasica & Associates",                                     
  "Premise"       ,                                                 
  "Zogby" ,                                                         
  "Causeway Solutions" ,                                            
  "Data Viewpoint"    ,                                             
  "Gravis Marketing (post 2020)",                                   
  "ABC/Washington Post"    ,                                        
  "Project Home Fire" ,                                             
  "Cor Strategies"   ,                                              
  "Schoen Cooperman"  ,                                             
  "Opinion Diagnostics" ,                                           
  "VoteTXT"         ,                                               
  "Metropolitan Research",                                          
  "OH Predictive Insights / MBQF",                                  
  "Differentiators"  ,                                              
  "Blueprint Polling" ,                                             
  "U. Massachusetts - Lowell",                                      
  "Benenson",                                                       
  "Florida Atlantic University",                                    
  "Fleming & Associates",                                           
  "Probolsky Research",                                             
  "PEM Management Corporation",                                     
  "Harris Poll",                                                    
  "NewsNation/Decision Desk HQ",                                    
  "The Political Matrix/The Listener Group",                        
  "Cor Services, Inc."  
  )

# Create a dataset by randomly assigning states and parties to divisions
simulation_data <- tibble(
  state = sample(
    states,
    size = 1000,
    replace = TRUE 
  ),
  pollster = sample(
    pollsters,
    size = 1000,
    replace = TRUE,
    
  ),
  transparency_score = sample(
    0.0:10.0,
    size = 1000,
    replace = TRUE
  ),
  numeric_grade = sample(
    0.0:3.0,
    size = 1000,
    replace = TRUE
  ),
  pct = sample(
    0.0:100.0,
    size = 1000,
    replace = T
  ),
  candidate = sample(
    c("Kamala Harris",
      "Donald Trump"),
    size = 1000,
    replace  = TRUE
  ),
  end_date = sample(
    seq(as.Date('2024/07/21'), 
        as.Date('2024/11/02'), 
        by="day"), 
    size = 1000,
    replace = TRUE
    )
  )
  


#### Save data ####
write_parquet(simulation_data, "data/00-simulated_data/simulated_data.parquet")
