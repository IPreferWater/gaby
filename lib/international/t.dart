import 'package:gaby/const/const.dart';

class vv {
  String id;
  Map<Languages, String> map;
  vv({required this.id, required this.map});
}

final urea = vv(id: "urea", map: {Languages.en: "urea", Languages.fr: "urée"});
final haemoglobin = vv(id: "haemoglobin", map: {Languages.en: "haemoglobin", Languages.fr: "hemoglobine"});
final systolicBloodPressure = vv(id: "systolicBloodPressure", map: {Languages.en: "systolic blood pressure", Languages.fr: "Tension artérielle systolique"});
