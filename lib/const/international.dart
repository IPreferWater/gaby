import 'package:gaby/const/const.dart';

class Dico {
  String id;
  Map<Languages, String> map;
  Dico({required this.id, required this.map});
}

final ASCITE =
    Dico(id: "ascite", map: {Languages.en: "Ascite", Languages.fr: "Ascite"});
final BILBURINE = Dico(
    id: "bilburine",
    map: {Languages.en: "Bilburine", Languages.fr: "Bilburine"});
final ALBUMINE = Dico(
    id: "albumine", map: {Languages.en: "Albumine", Languages.fr: "Albumine"});
final INR = Dico(id: "inr", map: {Languages.en: "Inr", Languages.fr: "Inr"});
final ENCEPHALOPATHIE = Dico(
    id: "encephalopathie",
    map: {Languages.en: "Encephalopathie", Languages.fr: "Encéphalopathie"});

final UREA =
    Dico(id: "urea", map: {Languages.en: "urea", Languages.fr: "urée"});
final HAEMOGLOBIN = Dico(
    id: "haemoglobin",
    map: {Languages.en: "haemoglobin", Languages.fr: "hemoglobine"});
final SYSTOLIC_BLOOD_PRESSURE = Dico(id: "systolicBloodPressure", map: {
  Languages.en: "systolic blood pressure",
  Languages.fr: "Tension artérielle systolique"
});

final PULSE = Dico(
    id: "pulse",
    map: {Languages.en: "Pulse", Languages.fr: "Fréquence cardiaque"});
final MELENA =
    Dico(id: "melena", map: {Languages.en: "Melena", Languages.fr: "Melena"});
final SYNCOPE = Dico(
    id: "syncope", map: {Languages.en: "Syncope", Languages.fr: "Syncope"});
final HEPATIC_DISEASE = Dico(id: "hepaticDisease", map: {
  Languages.en: "Hepatic Disease",
  Languages.fr: "Insuffisance hépatique"
});
final CARDIAC_FAILURE = Dico(id: "cardiacFailure", map: {
  Languages.en: "Cardiac Failure",
  Languages.fr: "Insuffisance cardiaque"
});
