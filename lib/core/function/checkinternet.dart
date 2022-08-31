
import 'dart:io';

Future<bool> checkInternet()async{
  try{
    var result =await InternetAddress.lookup('google.com');
    if(result.isNotEmpty&&result[0].rawAddress.isNotEmpty){
      return true;
    }else{
      return false;
    }
  }on SocketException catch(e){
    return false;
  }

}