import 'package:http/http.dart';
import 'package:memes_app/view/model/meme_generator_model.dart';

class NetworkRequester{
  Future<List<Meme>>getMemes()async{
    try{
      print("-------Request \n Method:Get\n Url: https://api.imgflip.com/get_memes");
      Response response=await get(Uri.parse("https://api.imgflip.com/get_memes"),);
      print("----------Response \n${response.body}");
      if(response.statusCode==200){
        MemeGenerateModel data=memeGenerateModelFromJson(response.body);
        return data.data?.memes ?? [];


      }
      return  throw Exception("API call not successful: ${response.statusCode}");



    }catch(error){
      throw Exception("---------error \n${error.toString()}");


    }

  }


}

