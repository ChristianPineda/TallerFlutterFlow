import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
  }) =>
      [enText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    '05octe83': {
      'en': 'Page Title',
      'es': 'Título',
    },
    '8m1qq8kg': {
      'en': 'Home',
      'es': 'Inicio',
    },
    'nin9us07': {
      'en': 'User',
      'es': 'Usuario',
    },
    'g83kbqrv': {
      'en': 'Home',
      'es': 'Inicio',
    },
  },
  // Inicio
  {
    'n1r1j8vo': {
      'en': 'Welcome',
      'es': 'Bienvenido',
    },
    'b47q26nn': {
      'en': 'Home',
      'es': 'Inicio',
    },
  },
  // Usuario
  {
    '90qspf06': {
      'en': 'Phone number',
      'es': 'Número de teléfono',
    },
    'l6ens0ms': {
      'en': 'Full name*',
      'es': 'Nombre completo*',
    },
    '0wixhsac': {
      'en': 'Age*',
      'es': 'Edad*',
    },
    'sewnzhny': {
      'en': 'Date of birth*',
      'es': 'Fecha de nacimiento*',
    },
    '7d9xsd7p': {
      'en': 'Insurance Provider',
      'es': 'Proveedor de seguros',
    },
    'kafacwzi': {
      'en': 'Select one...',
      'es': 'Seleccione uno...',
    },
    'vjxti4z4': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    '5552uu4n': {
      'en': 'Insurance Provider 1',
      'es': 'Proveedor de seguros 1',
    },
    'lrvape1b': {
      'en': 'Insurance Provider 2',
      'es': 'Proveedor de seguros 2',
    },
    '0khod4po': {
      'en': 'Insurance Provider 3',
      'es': 'Proveedor de seguros 3',
    },
    'bb6u8sjx': {
      'en': 'Gender',
      'es': 'Género',
    },
    'cg6soy1w': {
      'en': 'Female',
      'es': 'Femenino',
    },
    'pizev2r1': {
      'en': 'Male',
      'es': 'Masculino',
    },
    'yihheahy': {
      'en': 'Other',
      'es': 'Otro',
    },
    'nem0epgx': {
      'en': 'Please describe your symptoms...',
      'es': 'Por favor describa sus síntomas...',
    },
    '4qqa49oy': {
      'en': 'Submit Form',
      'es': 'Enviar formulario',
    },
    'ilg28t29': {
      'en': 'Please enter the patients full name.',
      'es': 'Por favor ingrese el nombre completo del paciente.',
    },
    'vo09gxo3': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable.',
    },
    'el3hsag5': {
      'en': 'Please enter an age for the patient.',
      'es': 'Ingrese una edad para el paciente.',
    },
    'x54m6wp7': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable.',
    },
    '7vf0b1bn': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable.',
    },
    'f5l0p9hp': {
      'en': 'Please enter the date of birth of the patient.',
      'es': 'Por favor, introduzca la fecha de nacimiento del paciente.',
    },
    'q17ukj7o': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable.',
    },
    'lcsksnha': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
    },
    'bpq93683': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable.',
    },
    'su6tcjxe': {
      'en': 'Patient Intake form',
      'es': 'Formulario de admisión de pacientes',
    },
    '77f72m1z': {
      'en': 'Please fill out the form below to continue.',
      'es': 'Por favor, rellene el formulario siguiente para continuar.',
    },
    '0ubvzkwz': {
      'en': 'Home',
      'es': 'Inicio',
    },
    '2s3lir2y': {
      'en': 'Home',
      'es': 'Inicio',
    },
  },
  // Miscellaneous
  {
    '2h6e0v8b': {
      'en': '',
      'es': '',
    },
    'm3b6z7zi': {
      'en': '',
      'es': '',
    },
    'wue7zcuy': {
      'en': '',
      'es': '',
    },
    '1gjueuj7': {
      'en': '',
      'es': '',
    },
    'v6capya4': {
      'en': '',
      'es': '',
    },
    'f0gn1mbt': {
      'en': '',
      'es': '',
    },
    'mo77lp6l': {
      'en': '',
      'es': '',
    },
    'zsodr9wv': {
      'en': '',
      'es': '',
    },
    'xwv8owkq': {
      'en': '',
      'es': '',
    },
    'tgdd47ul': {
      'en': '',
      'es': '',
    },
    'no3dsmv9': {
      'en': '',
      'es': '',
    },
    'clxcr5uk': {
      'en': '',
      'es': '',
    },
    'h68oi4gz': {
      'en': '',
      'es': '',
    },
    'nyao05sh': {
      'en': '',
      'es': '',
    },
    'g1jj7z8w': {
      'en': '',
      'es': '',
    },
    'k9wwzgpp': {
      'en': '',
      'es': '',
    },
    'dvfbs9ti': {
      'en': '',
      'es': '',
    },
    'dbko3zad': {
      'en': '',
      'es': '',
    },
    '0p09lsuk': {
      'en': '',
      'es': '',
    },
    '2hzqgl8s': {
      'en': '',
      'es': '',
    },
    'urbnt2jk': {
      'en': '',
      'es': '',
    },
    '40rs5y2w': {
      'en': '',
      'es': '',
    },
    '2r7y2f3g': {
      'en': '',
      'es': '',
    },
    'at6atnp5': {
      'en': '',
      'es': '',
    },
    '7yxsoqvm': {
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
