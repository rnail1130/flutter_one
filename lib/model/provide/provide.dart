import 'package:phone_yiyang/utiles/net/api.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:phone_yiyang/utiles/getHost.dart';

class UserDataModel extends Model {

  getUserLoginStatus(String phone, String pwd) async {
    await Future.delayed(Duration(milliseconds: 1500), () async{
      var res = await httpManager.netFetch(hostAddres.getLoginUrl(),{"mobile":phone.toString().trim(),"passWord":pwd.toString().trim()}, null,  null);
      String resz = res.data.toString();

    });

  }
}