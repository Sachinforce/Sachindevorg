public class ParkLocator {
    
    public static String[] country(String countryName){
        ParkService.ParksImplPort objPark = new ParkService.ParksImplPort();
        return objPark.byCountry(countryName);
    }

}