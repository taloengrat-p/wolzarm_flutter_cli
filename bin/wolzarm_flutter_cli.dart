import 'package:args/args.dart';
import 'package:wolzarm_flutter_cli/features/bloc/main.dart';

// const commandBuild = "build";
const commandGenerate = "generate";

const generateBlocTemplatFlag = 'bloc-cubit';
const generateResource = 'resource';

const generateName = 'name';
const optionOutputPath = 'output';
void main(List<String> args) {
  final parser = ArgParser()
    ..addCommand(commandGenerate)
    ..addOption(optionOutputPath, abbr: 'o')
    ..addFlag(generateBlocTemplatFlag)
    ..addFlag(generateResource)
    ..addOption(generateName); // generate

  ArgResults argResults = parser.parse(args);

  print('argResults; ${argResults.command?.name}');

  switch (argResults.command?.name) {
    case commandGenerate:
      BuildBloc().build(argResults);

      break;
    default:
      throw ('command invalid');
  }
}
