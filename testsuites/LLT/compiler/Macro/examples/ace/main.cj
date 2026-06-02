// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macroState.cj macroComponent.cj
// EXEC:%compiler %cmp_opt %cmp_macro macroState.cj
// EXEC:%compiler %cmp_opt %cmp_macro macroComponent.cj
// EXEC: %pwd_to_ld_path %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
import pkg1.*
import pkg2.*

@Component
struct CntView {
    @State
    var cnt = 0
    var num: Int64
    var foo: Int64
    var f = {a: Int64, b: Int64 => a + b}
}

main() {
    var cntView = CntView(100, 200, 300)
    var cnt_ = cntView.cnt_
    var num = cntView.num
    var foo = cntView.foo
    var cnt1 = cntView.getCnt1()
    var delt = cntView.getDelt()
    print("${cnt_}\n")
    print("${num}\n")
    print("${foo}\n")
    print("${cnt1}\n")
    print("${delt}\n")
    if (cnt_ != 42 || num != 200 || foo != 300 || cnt1 != 3 || delt != 1) {
        return -1
    }
    0
}
