import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TagView extends StatefulWidget {
  List<String> tags = [];
  bool isEnableDelete;
  Color tagBackgroundColor;
  Color tagTextColor;
  ValueChanged? onDelete;
  ValueChanged? onClick;
  EdgeInsets? margin;

  int deletePos = -1;

  TagView(this.tags,
      {this.isEnableDelete = false,
      this.tagBackgroundColor = Colors.blueAccent,
      this.tagTextColor = Colors.white,
      this.margin = const EdgeInsets.all(5),
      this.onDelete,
      this.onClick}) {}

  @override
  State<StatefulWidget> createState() {
    return _TagView();
  }
}

class _TagView extends State<TagView> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: widget.tags
          .map((i) => GestureDetector(
                onTap: () {
                  widget.onClick!(widget.tags.indexOf(i));
                },
                child: Container(
                    margin: widget.margin,
                    padding: const EdgeInsets.only(
                        top: 5.0, bottom: 5.0, left: 10, right: 5),
                    decoration: BoxDecoration(
                        color: widget.tagBackgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(i,
                            style: TextStyle(
                                color: widget.tagTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                        SizedBox(
                          width: 2,
                        ),
                        Visibility(
                          visible: widget.isEnableDelete,
                          child: InkWell(
                            onTap: () {
                              widget.onDelete!(widget.tags.indexOf(i));
                            },
                            child: Icon(
                              Icons.close_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        )
                      ],
                    )),
              ))
          .toList(),
    );
  }
}
