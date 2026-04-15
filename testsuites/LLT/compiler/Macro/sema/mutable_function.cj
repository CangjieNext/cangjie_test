// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan-1 sema_use_mutable_func_alone
// ASSERT: scan the error originates in the macro `Mutfunc` (consider using `--debug-macro` for more info)

import define.*

struct R1 {
    public var i = 0
}

extend R1 {
    public mut func foo(): Unit {
        i += 1
    }
}

func goo() {
    var obj = R1()
    @Mutfunc(var fn)
    return 0
}

main() {
    return 1
}
