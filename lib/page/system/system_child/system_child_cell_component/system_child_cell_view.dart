import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';
import 'package:flutter_android_fun/widget/HtmlTextWidget.dart';

import 'system_child_cell_action.dart';
import 'system_child_cell_state.dart';

Widget buildView(
    SystemChildCellState state, Dispatch dispatch, ViewService viewService) {
  String author = state?.systemChildCellBean?.author;
  String chapterName = state?.systemChildCellBean?.chapterName;
  TextStyle _styleForName =
      TextStyle(fontSize: 11, color: ColorConf.Color48586D);
  TextStyle _styleForDate =
      TextStyle(fontSize: 11, color: ColorConf.Color48586D);
  TextStyle _styleForTitle = TextStyle(fontSize: 14, color: Colors.black);
  TextStyle _styleForDesc =
      TextStyle(fontSize: 14, color: ColorConf.Color48586D);

  /// 渲染desc 因为有些是没有的
  Widget _renderDesc() {
    String desc = state?.systemChildCellBean?.desc;
    String envelopePic = state?.systemChildCellBean?.envelopePic;
    Widget _picWidget;
    if (envelopePic.isNotEmpty == true) {
      _picWidget = Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(image: NetworkImage(envelopePic))),
      );
    }

    if (desc.isNotEmpty == true) {
      return Container(
        child: _picWidget == null
            ? Text(
                desc,
                style: _styleForDesc,
                maxLines: 3,
              )
            : Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                    desc,
                    style: _styleForDesc,
                    maxLines: 3,
                  )),
                  _picWidget,
                ],
              ),
        margin: const EdgeInsets.only(top: 10),
      );
    } else {
      return Container();
    }
  }

  return GestureDetector(
    child: Container(
      color: Colors.transparent,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 6, left: 12, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            author.isNotEmpty ? author : "匿名",
            style: _styleForName,
          ),
          Container(
            child: HtmlTextWidget(msg: state?.systemChildCellBean?.title,),
            margin: const EdgeInsets.only(top: 8),
          ),
          _renderDesc(),
          Container(
            child: Row(
              children: <Widget>[
                Text(
                  chapterName.isNotEmpty == true ? chapterName : "自助分享",
                  style: _styleForName,
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    state?.systemChildCellBean?.niceDate,
                    style: _styleForDate,
                  ),
                ))
              ],
            ),
            margin: const EdgeInsets.only(top: 16),
          )
        ],
      ),
    ),
    onTap: () {
      dispatch(SystemChildCellActionCreator.onToWebView());
    },
  );
}