import 'package:gaby/const/const.dart';

class vv {
  String id;
  Map<Languages, String> map;
  vv({required this.id, required this.map});
}

final ASCITE = vv(id: "ascite", map: {Languages.en: "Ascite", Languages.fr: "Ascite"});
final BILBURINE = vv(id: "bilburine", map: {Languages.en: "Bilburine", Languages.fr: "Bilburine"});
final ALBUMINE = vv(id: "albumine", map: {Languages.en: "Albumine", Languages.fr: "Albumine"});
final INR = vv(id: "inr", map: {Languages.en: "Inr", Languages.fr: "Inr"});
final ENCEPHALOPATHIE = vv(id: "encephalopathie", map: {Languages.en: "Encephalopathie", Languages.fr: "Encéphalopathie"});

final urea = vv(id: "urea", map: {Languages.en: "urea", Languages.fr: "urée"});
final haemoglobin = vv(id: "haemoglobin", map: {Languages.en: "haemoglobin", Languages.fr: "hemoglobine"});
final systolicBloodPressure = vv(id: "systolicBloodPressure", map: {Languages.en: "systolic blood pressure", Languages.fr: "Tension artérielle systolique"});

final pulse =vv(id: "pulse", map: {Languages.en: "Pulse", Languages.fr: "Fréquence cardiaque"});
final melena = vv(id: "melena", map: {Languages.en: "Melena", Languages.fr: "Melena"});
final syncope = vv(id: "syncope", map: {Languages.en: "Syncope", Languages.fr: "Syncope"});
final hepaticDisease = vv(id: "hepaticDisease", map: {Languages.en: "Hepatic Disease", Languages.fr: "Insuffisance hépatique"});
final cardiacFailure = vv(id: "cardiacFailure", map: {Languages.en: "Cardiac Failure", Languages.fr: "Insuffisance cardiaque"});