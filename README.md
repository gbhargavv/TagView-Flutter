# tag_view

## Get started

### Add dependency

You can use the command to add tag_view as a dependency with the latest stable version:

```console
$ dart pub add tag_view
```

Or you can manually add tag_view into the dependencies section in your pubspec.yaml:

```yaml
dependencies:
  tag_view: ^replace-with-latest-version
```

### Simple to use

```dart
import 'package:tag_view/tag_view.dart';

List<String> tags = ['Tag 1, Tag 2'];

TagView(_tags,
    isEnableDelete: true,
    tagBackgroundColor: Colors.blue,
    tagTextColor: Colors.white,
    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
    onDelete: (deletePos) {
        setState(() {
            _tags.removeAt(deletePos);
        });
    },
    onClick: (clickPos) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_tags[clickPos].toString())));
    }
)
```

## Usage

![Screenshot](https://github.com/gbhargavv/FlutterTagView/blob/master/tag_view/images/example.gif)
