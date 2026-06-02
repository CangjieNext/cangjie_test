// DEPENDENCE: macroState.cj macroComponent.cj
// EXEC:%compiler %cmp_macro macroState.cj
// EXEC:%compiler %cmp_opt macroComponent.cj %cmp_macro 
// EXEC: %compiler %cmp_opt --parallel-macro-expansion %f %cmp_opt -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan createState cnt
// ASSERT: scan createLink bcnt

import component.*
import state.*

open class View {
  public func createState(varname: String) {
    print("createState " + varname + "\n")
  }
  public func createLink(varname: String) {
    print("createLink " + varname + "\n")
  }
}

@Component
struct Counter {
    @State var cnt = 0
    @Attribute[Binding] var bcnt = 0
}

/* after Component macro expand
class Counter <: View {
  var cnt = 0
  var bcnt = 0
  init(_cnt: Int64, _bcnt: Int64) {
    this.createState("cnt")
    this.createLink("bcnt")
  }
}
*/

main() {
  Counter(1, 2)
  return 0
}
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

