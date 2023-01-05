public with sharing class Dota2HeroesController {
    public static  List< Object> getHeroesInfo(){
        return Dota2APIController.makeGetApiCall('https://api.opendota.com/api','heroes','GET');
          
    }
    
    public static String getSpecificHero(String hero_id){
       //obtiene la Lista de heroes como objetos
        List<Object> heroesListObject=getHeroesInfo();
        //itera heroesListObject
        Integer i=0;
        for (Object hero : heroesListObject) {
            //Obtiene un solo objeto hero de la lista y lo convierte a Map<String, Object>
            Map<String, Object> currentHero = (Map<String, Object>) heroesListObject.get(i);
            //obtiene el hero_id del currentHero en la iteración
            Integer currentId=(Integer) currentHero.get('id');
            //compara si el valor id es igual al parametro del metodo
            if(hero_id== String.valueOf(currentId)){
                String heroName = (String) currentHero.get('localized_name'); 
                return heroName;
            }
            i++; 
        }
        return 'No Hero Data';

    }





}
