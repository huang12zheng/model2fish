
import 'package:model2fish/manage/core_manage.dart';
import 'package:model2fish/manage/fish_option.dart';
import 'package:args/args.dart';

ArgResults argResults; 

main(List<String> args) async {
  if (_isHelpCommand(args)) {
    _printHelperDisplay();
  }else{
    handleGenerateFiles(_generateOption(args));
    // print(_generateOption(args));
  }
      
}

bool _isHelpCommand(List<String> args) {
  return args.length == 1 && (args[0] == '--help' || args[0] == '-h');
}
void _printHelperDisplay(){
  var parser = _generateArgParser(null);
  print(parser.usage);
}

FishOption _generateOption(List<String> args){
  FishOption option = FishOption();
  var parser = _generateArgParser(option);
  parser.parse(args);
  return option;
}
ArgParser _generateArgParser(FishOption option) {
  var parser = new ArgParser();

  parser.addOption('source-dir',abbr:'s',
      defaultsTo: 'example/',
      callback: (String x) => option.sourceDir = x,
      help: 'A source folder contains all string json files');

  parser.addOption('output-dir',abbr:'o',
      defaultsTo: 'generate/',
      callback: (String x) => option.outputDir = x,
      help: 'A output folder stores all generated files');
  parser.addFlag('help',abbr:'h', negatable: false,
      help:
          "Instance:\n"
          "> pub run fish-gens:main\n"
          "read from example/fish_domain,\n"
          "output to lib/generated,\n"
          "& source file need start with f. to work\n");

  return parser;
}
