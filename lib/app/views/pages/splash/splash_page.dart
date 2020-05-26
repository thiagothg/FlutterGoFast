import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../app_controller.dart';
import '../../../controllers/splash/splash_controller.dart';

import '../../../core/localization/app_translate.dart';
import '../../../models/client_model.dart';
import '../../../repositories/client_repository.dart';


class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  ClientRepository clientRepository;
  String id;

  @override
  void initState() { 
    clientRepository = Modular.get<ClientRepository>();
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        title: Text(AppTranslate(context).text('splash.welcome')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RaisedButton(
              onPressed: (){
                  Modular.get<AppController>().setThemeData(ThemeMode.dark);
              },
              child: Text('Theme dark'),
            ),
            RaisedButton(
              onPressed: (){
                Modular.get<AppController>().setThemeData(ThemeMode.light);
              },
              child: Text('Theme light'),
            ),





             RaisedButton(
                    child: Text('Add User'),
                    onPressed: () async {
                      var user = Client(
                          name: 'Renato Mota',
                          cpf: '1121651266',
                          email: 'renato@renato.com',
                          );
                      id = await clientRepository.add(user);
                      print(id);
                    },
                  ),
                  RaisedButton(
                    child: Text('Update User'),
                    onPressed: () async {
                      var user = await clientRepository.getById(id);
                      user.name = 'Renato Mota 2';
                      clientRepository.update(user);
                      print(user.name);
                    },
                  ),
                  RaisedButton(
                    child: Text('Disable User'),
                    onPressed: () async {
                      var user = await clientRepository.getById(id);
                      clientRepository.disable(user);
                    },
                  ),
                  RaisedButton(
                    child: Text('Enable User'),
                    onPressed: () async {
                      var user = await clientRepository.getById(id);
                      clientRepository.enable(user);
                    },
                  ),
                  RaisedButton(
                    child: Text('Delete User'),
                    onPressed: () async {
                      await clientRepository.delete(id);
                    },
                  ),
                  RaisedButton(
                    child: Text('Get All'),
                    onPressed: () async {
                      var list = await clientRepository.getAll();

                      print(list[0].name);
                    },
                  ),
                  RaisedButton(
                    child: Text('Get Filter'),
                    onPressed: () async {
                      var list = await clientRepository
                          .filter()
                          .where('name', isEqualTo: 'Renato Mota2')
                          .where('email', isEqualTo: 'renato@renato.com')
                          .orderBy('name', descending: true)
                          .getDocuments()
                          .then((value) => value.documents);
                      clientRepository.fromSnapshotToModelList(list);
                    },
                  ),



          ],
        ),
      ),
    );
  }
}
