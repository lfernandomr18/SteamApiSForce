public with sharing class Dota2APIController {
    
    public static String GetkeyfromOrg(){
        SteamApiKey__c apikey=[SELECT  ApiKeyDota2__c FROM SteamApiKey__c WHERE isActive__c=true LIMIT 1];
        return apikey.ApiKeyDota2__c;       
    }

    public static void getMatchInfo(String matchId){
        HttpRequest req = new HttpRequest();
        
        req.setEndpoint('https://api.opendota.com/api/matches/'+matchId);
        req.setMethod('GET');
        // Establece la API Key como una cabecera personalizada
        String apiKey = GetkeyfromOrg();
        req.setHeader('api_key', apiKey);

        Http http = new Http();
        HttpResponse res = http.send(req);

        // Verifica si la solicitud se realizó correctamente
        if (res.getStatusCode() == 200) {
            //convierte la respuesta en Objeto Apex
            Map<String, Object> responseValues = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            System.debug(responseValues);
            // Accede a los valores del objeto en este caso a players
            Object players = responseValues.get('players');
            //convierte players en una lista para poder iterar
            List<Object> playersList = (List<Object>) players;
            Integer i=0;
            for (Object player : playersList) {
                Map<String, Object> player1 = (Map<String, Object>) playersList.get(i);
                Integer hero_id = (Integer) player1.get('hero_id');    
                System.debug('hero ID: '+hero_id);
                i++;
               
            }
            
        } else {
            System.debug(res);
        }

    }

}
