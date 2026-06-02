// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import test.*

@callTest
func MyFunc() {
    var counter = 0
    return counter
}

main(): Int64 {
    @callTest
    func InnerFunc() {
        return 1
    }
    @callTest
    var a = InnerFunc()
    var b = @callTest(MyFunc())
    if (a != 1 || b != 0) {
        print("test macro expand func failed\n")
        return 1
    }
    print("test macro expand func success\n")
    return 0
}
