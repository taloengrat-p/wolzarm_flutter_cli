import 'dart:io';

import 'package:args/args.dart';
import 'package:wolzarm_flutter_cli/features/bloc/template.dart';
import 'package:wolzarm_flutter_cli/utils/convertor.dart';
import 'package:yaml/yaml.dart';

const generateName = 'name';

class BuildBloc {
  BuildBloc() {}

  void build(ArgResults argResults) {
    // Read the content of the YAML file
    final File yamlFile = File('pubspec.yaml');
    if (!yamlFile.existsSync()) {
      print('Error: YAML file not found.');
      return;
    }

    final String yamlContent = yamlFile.readAsStringSync();

    // Parse the YAML content into a YamlMap
    final YamlMap yamlMap = loadYaml(yamlContent);

    // Cast the YamlMap to Map<String, dynamic>
    final Map<String, dynamic> typedMap = yamlMap.cast<String, dynamic>();

    // Check if the YAML content was parsed successfully
    String basePath = argResults['output'];
    String package = '${typedMap['name']}';
    String nameSnakeCase = argResults[generateName];
    String nameCamelCase = Convertor.snakeToCamel(nameSnakeCase);
    genScreenTemplate(basePath: basePath, nameSnake: nameSnakeCase, nameCamel: nameCamelCase, package: package);
    genCubitTemplate(basePath: basePath, nameSnake: nameSnakeCase, nameCamel: nameCamelCase, package: package);
    genStateTemplate(basePath: basePath, nameSnake: nameSnakeCase, nameCamel: nameCamelCase, package: package);
    genRouterTemplate(basePath: basePath, nameSnake: nameSnakeCase, nameCamel: nameCamelCase, package: package);

    // genPageTemplate(basePath: basePath, nameSnake: nameSnakeCase, nameCamel: nameCamelCase, package: package);
  }

  void genPageTemplate(
      {required String basePath, required String nameSnake, required String nameCamel, required String package}) {
    String page = pageTemplate;

    String content =
        page.replaceAll('%{package}', package).replaceAll('%{name}', nameCamel).replaceAll("%{nameSnake}", nameSnake);

    saveDataToFile("lib/src/widgets/pages/${nameSnake}_page.dart", content);
  }

  void genCubitTemplate(
      {required String basePath, required String nameSnake, required String nameCamel, required String package}) {
    String cubit = cubitTemplate;

    String content =
        cubit.replaceAll('%{package}', package).replaceAll('%{name}', nameCamel).replaceAll("%{nameSnake}", nameSnake);

    saveDataToFile("$basePath/$nameSnake/${nameSnake}_cubit.dart", content);
  }

  void genStateTemplate(
      {required String basePath, required String nameSnake, required String nameCamel, required String package}) {
    String state = stateTemplate;

    String content =
        state.replaceAll('%{package}', package).replaceAll('%{name}', nameCamel).replaceAll("%{nameSnake}", nameSnake);

    saveDataToFile("$basePath/$nameSnake/${nameSnake}_state.dart", content);
  }

  void genScreenTemplate(
      {required String basePath, required String nameSnake, required String nameCamel, required String package}) {
    String state = screenTemplate;

    String content =
        state.replaceAll('%{package}', package).replaceAll('%{name}', nameCamel).replaceAll("%{nameSnake}", nameSnake);

    saveDataToFile("$basePath/$nameSnake/${nameSnake}_screen.dart", content);
  }

  void genRouterTemplate(
      {required String basePath, required String nameSnake, required String nameCamel, required String package}) {
    String state = routerTemplate;

    String content =
        state.replaceAll('%{package}', package).replaceAll('%{name}', nameCamel).replaceAll("%{nameSnake}", nameSnake);

    saveDataToFile("$basePath/$nameSnake/${nameSnake}_router.dart", content);
  }

  void saveDataToFile(String path, String template) {
    File fileGenerated = File(path);
    if (fileGenerated.existsSync()) {
      fileGenerated.deleteSync();
    }
    fileGenerated.createSync(recursive: true);
    fileGenerated.writeAsStringSync(template);
  }
}
