@RestResource(urlMapping='/v1/Case/*') 
global class CustomCaseRestAPI {	
    @HttpGet 
    global static List<Case> doGet() { 
        RestRequest req = RestContext.request;
        
        //Integer limitNumber = Integer.valueOf(req.params.get('limitnumber'));
        
        System.debug('req.params =>' + req.params);
        System.debug('req.httpMethod =>' + req.httpMethod);
        System.debug('req.remoteAddress =>' + req.remoteAddress);
        System.debug('req.requestBody =>' + req.requestBody);
		System.debug('req.requestURI =>' + req.requestURI);
		System.debug('req.resourcePath =>' + req.resourcePath);
        
        String CaseNumber = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1); 
        List<Case> results = [SELECT Id, Status, Origin, CaseNumber FROM Case 
                          WHERE  CaseNumber = :CaseNumber]; 
        // CaseNumber la autonumber nhung compare lai la kieu String? Nhu vay Autonumber la String type a?
        return results; 
    }	
    
    @HttpPost 
    global static Case doPost() {        
        RestRequest req = RestContext.request;           
        CaseWrapper caseData = (CaseWrapper)JSON.deserialize(req.requestBody.tostring(), CaseWrapper.class);
        Case kase = new Case(); 
        kase.Status = caseData.Status;
        kase.Origin = caseData.Origin;
        insert kase; 
        return kase;
    }
    
    @HttpPut
    global static Case doPut() { 
        RestRequest req = RestContext.request; 
        RestResponse res = RestContext.response; 
        String CaseNumber = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1); 
        String status =  (String)req.params.get('status');
        String origin =  (String)req.params.get('origin');
        
        Case kase = [SELECT Id, Status, Origin, CaseNumber FROM Case 
                       WHERE  CaseNumber = :CaseNumber ]; 
        if(kase != null){            
            kase.Status = status; 
            kase.Origin = origin; 
            update kase; 
            return kase;
        }else{
            // code dang khong chay block nay, truong hop danh sai CaseNumber
            Case newCase = new Case(); 
            newCase.Status = status; 
            newCase.Origin = origin;
            insert newCase;
            return newCase;
        }
        
    }
    
    @HttpPatch 
    global static Case doPatch() { 
        RestRequest req = RestContext.request; 
        RestResponse res = RestContext.response; 
        String CaseNumber = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1); 
        String status =  (String)req.params.get('status');
        String origin =  (String)req.params.get('origin');
        
        Case result = [SELECT Id, Status, Origin, CaseNumber FROM Case 
                       WHERE  CaseNumber = :CaseNumber ]; 
        result.Status = status;
        result.Origin = origin;
        // can 1 logic khac de xu ly viec update du lieu, kha nang dung map, vi neu update kieu nay se mat gia tri neu khong nhap 1 trong 2 param
        
        update result; 
        return result;
    }
    
    @HttpDelete 
    global static Case doDelete() { 
        RestRequest req = RestContext.request; 
        RestResponse res = RestContext.response; 
        String CaseNumber = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1); 
        Case result = [SELECT Id, Status, Origin, CaseNumber FROM Case 
                          WHERE  CaseNumber = :CaseNumber ]; 
        delete result; 
        return result;
    }


}