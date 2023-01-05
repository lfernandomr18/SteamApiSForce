public with sharing class Dota2MatchController {
    public static  Map<String, Object> getMatchInfo(String matchId){
        return Dota2APIController.makeGetApiCall('https://api.opendota.com/api','matches',matchId,'GET');
          
    }
    public static void getHeroesPlayedFromMatch(String matchId){
        Map<String, Object>  responseValues=getMatchInfo(matchId);
        // Accede a los valores del objeto en este caso a players
        //convierte Objeto players en una lista para poder iterar
        List<Object> playersList = (List<Object>) responseValues.get('players');
        //itera playerList
        Integer i=0;
        for (Object player : playersList) {

            //Obtiene un solo objeto player de la lista y lo convierte a Map<String, Object>
            Map<String, Object> currentPlayer = (Map<String, Object>) playersList.get(i);
            //obtiene el hero_id del currentplayer en la iteración
            Integer hero_id = (Integer) currentPlayer.get('hero_id');    
            
            String hero=Dota2HeroesController.getSpecificHero(String.valueOf(hero_id));
            System.debug(hero);
            i++;   
        }

    }
}
