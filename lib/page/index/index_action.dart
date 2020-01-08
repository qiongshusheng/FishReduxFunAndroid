import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android_fun/domain/entity/BannerInfoBean.dart';
import 'package:flutter_android_fun/domain/entity/ClassifyBean.dart';
import 'package:flutter_android_fun/domain/entity/CommArticleBean.dart';
import 'package:flutter_android_fun/domain/entity/HotArticleBean.dart';
import 'package:flutter_android_fun/domain/entity/ProjectListBean.dart';

enum IndexAction {
  action,
  initScreenInfo,
  updateBannerDataSource,
  updateClassifySource,
  updateHotArticleSource,
  updateIndexArticleSource,
  updateProjectSource,
  onLoadMore,
  onRefresh,
}

class IndexActionCreator {
  static Action onAction() {
    return const Action(IndexAction.action);
  }

  static Action onLoadMore() {
    return Action(IndexAction.onLoadMore);
  }

  static Action onRefresh() {
    return const Action(IndexAction.onRefresh);
  }

  static Action onInitScreenInfo(Size size) {
    return Action(IndexAction.initScreenInfo, payload: size);
  }

  static Action onUpdateBannerSource(List<Data> list) {
    return Action(IndexAction.updateBannerDataSource, payload: list);
  }

  static Action updateClassifySource(List<ClassifyData> list) {
    return Action(IndexAction.updateClassifySource, payload: list);
  }

  static Action updateHotArticleSource(List<HotArticleCellBean> list) {
    return Action(IndexAction.updateHotArticleSource, payload: list);
  }

  static Action updateIndexArticleSource(List<CommArticleCellBean> list) {
    return Action(IndexAction.updateIndexArticleSource, payload: list);
  }

  static Action updateProjectSource(List<ProjectListCellBean> list) {
    return Action(IndexAction.updateProjectSource, payload: list);
  }
}