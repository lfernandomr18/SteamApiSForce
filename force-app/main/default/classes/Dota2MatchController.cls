public with sharing class Dota2MatchController {
    public static  Map<String, Object> getMatchInfo(String matchId){
        return Dota2APIController.makeGetApiCall('https://api.opendota.com/api','matches',matchId,'GET');
          
    }
    public static void getHeroPlayersFromMatch(String matchId){
        Map<String, Object>  responseValues=getMatchInfo(matchId);
        // Accede a los valores del objeto en este caso a players
        Object players = responseValues.get('players');
        //convierte Objeto players en una lista para poder iterar
        List<Object> playersList = (List<Object>) players;
        //itera playerList
        Integer i=0;
        for (Object player : playersList) {

            //Obtiene un solo objeto player de la lista y lo convierte a Map<String, Object>
            Map<String, Object> currentPlayer = (Map<String, Object>) playersList.get(i);
            Integer hero_id = (Integer) currentPlayer.get('hero_id');    
            System.debug('hero ID: '+hero_id);
            i++;   
        }

    }
}
