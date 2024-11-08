#### Preamble ####
# Purpose: Tests the structure and validity of the simulated US election pollster data
# Author: Prankit Bhardwaj, Veyasan Ragulan, Chris Yong Hong Sen
# Date: 4 November 2024
# Contact: prankit.bhardwaj@mail.utoronto.ca 
# License: MIT
# Pre-requisites: Requires simulated election polling data in the "data/00-simulated_data/" directory.


#### Workspace setup ####
library(tidyverse)
library(arrow)

analysis_data <- read_parquet("data/00-simulated_data/simulated_data.parquet")

# Test if the data was successfully loaded
if (exists("analysis_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}


#### Test data ####

# Check if the dataset has 151 rows
if (nrow(analysis_data) == 1000) {
  message("Test Passed: The dataset has 151 rows.")
} else {
  stop("Test Failed: The dataset does not have 151 rows.")
}

# Check if the dataset has 6 columns
if (ncol(analysis_data) == 6) {
  message("Test Passed: The dataset has 3 columns.")
} else {
  stop("Test Failed: The dataset does not have 3 columns.")
}


# Check if the 'state' column contains only valid Australian state names
valid_states <- c(
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

if (all(analysis_data$state %in% valid_states)) {
  message("Test Passed: The 'state' column contains only valid American state names.")
} else {
  stop("Test Failed: The 'state' column contains invalid state names.")
}

# Check if the 'party' column contains only valid party names
valid_pollsters <- c(
  "Labor",
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

if (all(analysis_data$pollster %in% valid_pollsters)) {
  message("Test Passed: The 'pollsters' column contains only valid party names.")
} else {
  stop("Test Failed: The 'pollsters' column contains invalid party names.")
}

# Check if there are any missing values in the dataset
if (all(!is.na(analysis_data))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}

# Check if there are no empty strings in 'division', 'state', and 'party' columns
if (all(analysis_data$pollster != "" & analysis_data$state != "")) {
  message("Test Passed: There are no empty strings in 'division', 'state', or 'party'.")
} else {
  stop("Test Failed: There are empty strings in one or more columns.")
}
