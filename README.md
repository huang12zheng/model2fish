# model2fish

model2fish is a dart library for gen fish-redux-template from model;

three steps for gen:
1. Preparing Json files
2. Run `flutter pub run model2fish:main`
3. Use it to coding

# Installation
Add these libraries into `pubspec.yaml`
```
dev_dependencies:
    model2fish: 0.0.2
```
## Usage

### cli
```bash
>flutter pub run model2fish:main -h
-s, --source-dir    A source folder contains all string json files
                    (defaults to "example/")

-o, --output-dir    A output folder stores all generated files
                    (defaults to "generate/")

-h, --help          Instance:
                    > pub run fish-gens:main
                    read from example/fish_domain,
                    output to lib/generated,
                    & source file need start with f. to work
```

```bash
[WARNING]: xxxx.dart does not match naming pattern [f.{locale}.json]
[INFO]: xxxxx/fish_example/generate/todo_edit/action.dart is OK
[INFO]: xxxxx/fish_example/generate/todo_edit/reducer.dart is OK
[INFO]: xxxxx/fish_example/generate/todo_edit/effect.dart is OK
[INFO]: xxxxx/fish_example/generate/todo_edit/state.dart is OK
[INFO]: xxxxx/fish_example/generate/todo_edit/page.dart is OK
[INFO]: xxxxx/fish_example/generate/todo_edit/view.dart is OK
```
### json
```json
/// example/f.todo.edit.json
{
    "DomainName" : "TodoEdit",
    "Attrs":[
      {"toDo":"Parent"},
      {"nameEditController": "TextEditingController"},
      {"descEditController": "TextEditingController"},
      {"focusNodeName":"FocusNode"},
      {"focusNodeDesc":"FocusNode"}
    ],
    "Actions":[
      {"onEdit":[]},
      {"edit":[{"name":"String"},{"desc":"String"}]},
      {"done":[]},
      {"onRemove":[]},
      {"remove":[]}
    ]
}
```

welcome to PF ^_^