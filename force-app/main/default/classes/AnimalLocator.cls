public class AnimalLocator {
    
    public static String getAnimalNameById(Integer AnimalId){
        String animalName = '';
        HttpRequest req = new HttpRequest();
        Http httpObj = new Http();
        string endPoint = 'https://th-apex-http-callout.herokuapp.com/animals/'+AnimalId;
        req.setEndpoint(endpoint);
        req.setHeader('Content-Type', 'application/json;charset=UTF-8');
        req.setMethod('GET');
        HttpResponse response = httpObj.send(req);
            if (response.getStatusCode() == 200) {
              JSON2Apex objJSON2Apex = (JSON2Apex) System.JSON.deserialize(response.getBody(), JSON2Apex.class);
                animalName = objJSON2Apex.Animal.name;
          }
        return animalName;
    }
    public class JSON2Apex {
		public Animal animal;
	}

	public class Animal {
		public Integer id;
		public String name;
		public String eats;
		public String says;
	}
 

}