// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import UI.Foundation.* //ABC
internal import test.bottomContent // ABC
internal import test.*
internal import stdx.stdx.*
internal import stdx.stdx.collection as cl // ABC

public class listState07 <: State {
  var list: Array<MyClass07>
  init(list: Array<MyClass07>) {
    this.list = list
  }
}