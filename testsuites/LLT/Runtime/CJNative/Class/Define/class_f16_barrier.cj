// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class MyClass {
    var f16: Float16 = 0.12
    var i1: Bool = false
}

func addF16(a: Float16, b: Float16): Float16 {
    return a + b
}

main(): Int64 {
    var myClass: MyClass = MyClass()
    myClass.f16 = 0.13
    myClass.i1 = true
    var ret = addF16(myClass.f16, 0.12)
    if (ret == 0.25) {
        return 0
    }
    return 1
}
