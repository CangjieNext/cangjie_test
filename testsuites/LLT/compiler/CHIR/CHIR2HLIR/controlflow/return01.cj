// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func Ret(a: Int32, b: Int32): Int32 {
    if (a > b) {
        return a
    } else if (a == b) {
        return b
    } else {
        return a
    }
    return 0
}

func codegenUnitTest(): Int32 {
    return Ret(40, 30)
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 40) {
        return 0
    } else {
        return -1
    }
}
