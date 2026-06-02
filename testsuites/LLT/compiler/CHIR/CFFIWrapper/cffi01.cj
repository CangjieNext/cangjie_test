// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %enableO2 %cmp_opt %f -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_args

class A {
    var f1: CFunc<() -> Int64> = {
        => return 10
    }
}

main(): Int64 {
    let a = A()
    var res = unsafe { a.f1() }

    if (res == 10) {
        return 0
    } else {
        return 1
    }
}
