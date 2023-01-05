public with sharing class Dota2APIController {
    
    public static String GetkeyfromOrg(){
        SteamApiKey__c apikey=[SELECT  ApiKeyDota2__c FROM SteamApiKey__c WHERE isActive__c=true LIMIT 1];
        return apikey.ApiKeyDota2__c;       
    }

    public static Map<String, Object> makeGetApiCall(String baseUrl,String resource,String pathParams,String method){
        HttpRequest req = new HttpRequest();
        String endpoint=baseUrl+'/'+resource+'/'+pathParams;
        String apiKey = GetkeyfromOrg();
        Map<String, Object> responseValues ;
        req.setEndpoint(endpoint);
        req.setMethod(method.toUpperCase());
        req.setHeader('api_key', apiKey);
        Http http = new Http();
        HttpResponse res = http.send(req);
        if (res.getStatusCode() == 200) {
            return responseValues = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());   
        }
        else{
            return responseValues;      
        }  
    }
    public static List< Object> makeGetApiCall(String baseUrl,String resource,String method){
        HttpRequest req = new HttpRequest();
        String endpoint=baseUrl+'/'+resource;
        String apiKey = GetkeyfromOrg();
        List< Object> responseValues ;
        req.setEndpoint(endpoint);
        req.setMethod(method.toUpperCase());
        req.setHeader('api_key', apiKey);
        Http http = new Http();
        HttpResponse res = http.send(req);
        if (res.getStatusCode() == 200) {
            return responseValues = (List< Object>) JSON.deserializeUntyped(res.getBody());   
        }
        else{
            return responseValues;      
        }  
    }
}
