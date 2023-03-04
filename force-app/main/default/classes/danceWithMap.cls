public with sharing class DanceWithMap {
    public DanceWithMap() {
        Map<String, Integer> newMap = new Map<String, Integer>(); 
        newMap.put('Opportunity',10);
        newMap.put('Account',20);
        newMap.put('Contact',15);
        newMap.put('Case',40);

        // get listKey of newMap
        Set<String> newSet = newMap.keySet();
        List<String> listKey = new List<String>();
        listKey.addAll(newSet);

        // get listValue of newMap
        List<Integer> listValue = new List<Integer>();
        listValue = newMap.values();

        // Using System.debug() to show message with structure "Key=>Value"
        for (String key : listKey){
            System.debug(key + '=>' + newMap.get(key));
        }

        // Find Max and Min value
        listValue.sort();
        Integer max = newMap.size() - 1;
        Integer maxValue = listValue[max];
        Integer minValue = listValue[0];

        // Find Max and Min key
        String maxKey; 
        String minKey;
        for (String key : newMap.keySet()){
            if(newMap.get(key) == maxValue){
                maxKey = key;
            }
            if(newMap.get(key) == minValue){
                minKey = key;
            }
        }
        System.debug('The key have the maximum value is: ' + maxKey);
        System.debug('The key have the minimum value is: ' + minKey);

        // Find value of key "Opportunity"
        System.debug('Value of key "Opportunity": '+ newMap.get('Opportunity'));
    }
}