import 'package:flutter/material.dart';

extension AsyncSnapshotX<T> on AsyncSnapshot<T> {
  R when<R>({
    required R Function(T data) data,
    required R Function() loading,
    required R Function(Object err, StackTrace? stackTrace) err,
  }) {
    if (hasData) {
      return data(this.data!);
    } else if (hasError) {
      return err(error!, stackTrace);
    } else {
      return loading();
    }
  }
}
