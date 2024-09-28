import 'package:flutter/cupertino.dart';
import 'package:memes_app/view/network_requester/network_requester.dart';

import '../model/meme_generator_model.dart';

class MemesProvider with ChangeNotifier {
  int _memesCount=0;
  int get memesCount=>_memesCount;

  List<Meme> _memeList = [];

  List<Meme> get memeList => _memeList;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  setLoading(bool loadingValue) {
    _isLoading = loadingValue;
    notifyListeners();
  }
  void setMemesCount(){
    _memesCount++;
    notifyListeners();
  }
  void resetMemeCount(){
    _memesCount=0;
    notifyListeners();
  }

  Future<void> getMemesList() async {
    List<Meme> result = await NetworkRequester().getMemes();
    _memeList = result;
    notifyListeners();
  }
}
