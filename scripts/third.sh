#!/bin/bash

# Configure Katello / Foreman
# Third Step
# Perform after Syncrhonizing the repositories

# Add Content Views
echo Puppet Content View
hammer -u admin -p changeme content-view create --description "Puppet View" --name "Puppet" --organization Test_Cloud7 --repository-ids 1
echo CentOS Content View
hammer -u admin -p changeme content-view create --description "CentOS Base View" --name "CentOS Base" --organization Test_Cloud7 --repository-ids 2,3
echo Foreman Content view
hammer -u admin -p changeme content-view create --description "Foreman View" --name "Foreman" --organization Test_Cloud7 --repository-ids 4


# Create a Version the Views
#
# hammer -u admin -p changeme content-view list --organization Test_Cloud7
#----------------|---------------------------|---------------------------|-----------|---------------
#CONTENT VIEW ID | NAME                      | LABEL                     | COMPOSITE | REPOSITORY IDS
#----------------|---------------------------|---------------------------|-----------|---------------
#3               | Puppet                    | Puppet                    |           | 1             
#2               | Default Organization View | Default_Organization_View |           |               
#5               | Foreman                   | Foreman                   |           | 4             
#4               | CentOS Base               | CentOS_Base               |           | 3, 2          
#----------------|---------------------------|---------------------------|-----------|---------------

echo Puppet Content View Publish version 1
hammer -u admin -p changeme content-view publish --id 3
echo CentOS Content View Publish version 1
hammer -u admin -p changeme content-view publish --id 4
echo Foreman Content view Publish version 1
hammer -u admin -p changeme content-view publish --id 5

# Promote the View
# hammer -u admin -p changeme lifecycle-environment list --organization Test_Cloud7
#---|---------|--------
#ID | NAME    | PRIOR  
#---|---------|--------
#2  | Library |        
#4  | Prod    | Test   
#3  | Test    | Library
#---|---------|--------

#hammer -u admin -p changeme content-view version list --content-view-id 3
#---|----------|---------|-----------------|-------------------|-------------------
#ID | NAME     | VERSION | CONTENT VIEW ID | CONTENT VIEW NAME | CONTENT VIEW LABEL
#---|----------|---------|-----------------|-------------------|-------------------
#3  | Puppet 1 | 1       | 3               | Puppet            | Puppet            
#---|----------|---------|-----------------|-------------------|-------------------

echo Puppet View -> Test -> Prod
hammer -u admin -p changeme content-view version promote --environment-id 3 --id 3
hammer -u admin -p changeme content-view version promote --environment-id 4 --id 3
echo CentOS View -> Test -> Prod
hammer -u admin -p changeme content-view version promote --environment-id 3 --id 4
hammer -u admin -p changeme content-view version promote --environment-id 4 --id 4
echo Foreman View -> Test -> Prod
hammer -u admin -p changeme content-view version promote --environment-id 3 --id 5
hammer -u admin -p changeme content-view version promote --environment-id 4 --id 5




