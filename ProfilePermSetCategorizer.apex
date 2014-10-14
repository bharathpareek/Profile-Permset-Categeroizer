public class ProfilePermSetCategorizer {
    
    public string selectedDepartmentValue{get;set;}
    public string selectedRegionValue{get;set;}
    public string selectedSizeValue{get;set;}
     
    public ProfilePermSetCategorizer () {
        selectedDepartmentValue='IT';
        selectedRegionValue='America';
        selectedSizeValue='Large';
    }

    public List<SelectOption> getDepartmentList() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('--Select--','--Select--'));
        options.add(new SelectOption('IT','IT'));
        options.add(new SelectOption('Healthcare','Healthcare'));
        options.add(new SelectOption('Education','Education'));
        return options;
    }
    
    public List<SelectOption> getRegionList() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('--Select--','--Select--'));
        options.add(new SelectOption('Europe','Europe'));
        options.add(new SelectOption('America','America'));
        options.add(new SelectOption('Asia','Asia'));
        return options;
    }
    
    public List<SelectOption> getSizeList() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('--Select--','--Select--'));
        options.add(new SelectOption('Large','Large'));
        options.add(new SelectOption('Medium','Medium'));
        options.add(new SelectOption('Small','Small'));
        return options;
    }
    
    public List<PermissionSet> permSetName;
    public List<PermissionSet> getpermSetName(){
       return permSetName;
    }
   
    public List<Profile> profileName;
    public List<Profile> getProfileName(){
       return profileName;
    }
   
    public void categorizePermSet() {
        permSetName = new List<PermissionSet>();
        profileName = new List<Profile>();
        List<String> profileIds = new List<String>(); 
        
        List<PermissionSet> permSetNameOwnedByProfile = new List<PermissionSet>();
        
        List<PermissionSet> departmentPerms = new List<PermissionSet>();
        List<PermissionSet> regionPerms = new List<PermissionSet>();
        List<PermissionSet> sizePerms = new List<PermissionSet>();
        
        Map<String, PermissionSet> map1 = new Map<String, PermissionSet>();
        Map<String, PermissionSet> map2 = new Map<String, PermissionSet>();
        Map<String, PermissionSet> map3 = new Map<String, PermissionSet>();
        
        Integer i =0;
        
        List<CustomPermission> sector = [SELECT Id from CustomPermission WHERE DeveloperName = :selectedDepartmentValue];
        List<CustomPermission> region = [SELECT Id from CustomPermission WHERE DeveloperName = :selectedRegionValue];
        List<CustomPermission> size   = [SELECT Id from CustomPermission WHERE DeveloperName = :selectedSizeValue];
        
        departmentPerms = [Select Label, IsOwnedByProfile, ProfileId FROM PermissionSet WHERE Id IN (Select ParentId from SetupEntityAccess WHERE SetupEntityId in :sector)];
        regionPerms = [Select Label, IsOwnedByProfile, ProfileId FROM PermissionSet WHERE Id IN (Select ParentId from SetupEntityAccess WHERE SetupEntityId in :region)];
        sizePerms = [Select Label, IsOwnedByProfile, ProfileId FROM PermissionSet WHERE Id IN (Select ParentId from SetupEntityAccess WHERE SetupEntityId in :size)];
        
        for(PermissionSet p : departmentPerms){
            map1.put(p.Label, p);
        }
        
        for(PermissionSet q : regionPerms){
            map2.put(q.Label, q);
        }
        
        for(PermissionSet r : sizePerms){
            map3.put(r.Label, r);
        }
        
        for(i=0; i<regionPerms.size(); i++){
          if(map1.containsKey(regionPerms[i].Label) && map3.containsKey(regionPerms[i].Label)){
              if (regionPerms[i].IsOwnedByProfile == false) {
                  permSetName.add(regionPerms[i]);
              }
              else {
                  profileIds.add(regionPerms[i].ProfileId);
              }
          }
              
        }
        
        profileName = [Select Name from Profile Where Id IN :profileIds];   
    }
}
