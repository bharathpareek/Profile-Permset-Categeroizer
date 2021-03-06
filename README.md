Profile-Permset-Categorizer
============================

Categorizes Profiles and Permission sets in Salesforce based on the Region, Department and Size of the organization

### Tool Setup

1. Download the twitter bootstrap from here : http://bootstrapdocs.com/v3.0.0/docs/getting-started/
2. Upload the downloaded zip file on Salesforce
    - From the setup menu, type Static Resources
    - Upload the bootstrap zip file and make sure to name it as bootstrap
3. Copy the Apex Class and save
4. Copy the Visual Force page and save

### How to use the tool ?

1. Go to the Setup menu in Salesforce and type "Custom Permissions"
2. Create 9 custom permissions : America, Europe, Asia, IT, Healthcare, Education, Large, Medium, Small
3. Now, create new permission sets or assign the custom permissions to the existing permission sets to categorize them. Currently, the categories are : 
    - Department : IT, Education, Healthcare
    - Region : America, Europe, Asia
    - Size : Large, Small, Medium
4. Say, you have assigned the custom permissions IT, America, Large to a permission sets "Sales Perm Set"
5. Now, open the VF page and click preview. 
6. Select IT, America and Large under the categories and hit Find
7. Permission set "Sales Perm Set" should be displayed and you can navigate to the permission set by clicking on the name.
8. Button "Assigned Users" will display all the users assigned to the permission set. Button "Assign Users" will let you assign users to the permission set.
9. Users Column will display all the users belonging to the selected category. 


**Note**: With a small tweak in the Apex class, you can customize the categories. 

#### Contact Info:
 - Gmail : bharathpareek@gmail.com 
 - Twitter : @bharathpareek

#### Future Updates:
 - Custom Categories
 - Feel free to shoot me an email for any specific feature request
