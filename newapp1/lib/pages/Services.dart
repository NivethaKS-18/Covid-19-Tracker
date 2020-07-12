import 'package:http/http.dart'as http;
import 'TnDistrict.dart';


class Services{
  static const String url = 'https://api.covid19india.org/v2/state_district_wise.json';

  static Future<List<TnDistrict>> getData() async{
    try{
      final response = await http.get(url);
      if(200==response.statusCode)
      {
        final List<TnDistrict> data =tnDistrictFromJson(response.body);
        return data;
      }
      else
      {
        return List<TnDistrict>();
      }

    }
    catch(e)
    {
      return List<TnDistrict>();
    }
  }

  
  
  
}