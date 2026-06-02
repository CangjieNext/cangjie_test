// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package org1::org2::import_org_name

import org1::org2::UI.Foundation.* //ABC
import org1::org2::test.bottomContent // ABC
import test.*
import org1::org2::{cjDemo1, cjDemo2}
import org1::org2::cjDemo3.{aaa, bbb, ccc} // ABC

public class listState07 <: State {
  var list: Array<MyClass07>
  init(list: Array<MyClass07>) {
    this.list = list
  }
}