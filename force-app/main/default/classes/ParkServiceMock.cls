@isTest
global class ParkServiceMock implements WebServiceMock {
   global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
        // start - specify the response you want to send
        ParkService.byCountryResponse  response_x = new ParkService.byCountryResponse();
			String[] parkLst = new List<String>();
			parkLst.add('Anamudi Shola National Park');
			parkLst.add('Anshi National Park');
        response_x.return_x = parkLst;
        // end
        response.put('response_x', response_x); 
   }
}