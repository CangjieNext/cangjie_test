// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func codegenUnitTest(): Int32 {
    var result: Int32 = 0
    var all: Array<Int32> = [10, 100]
    for (f in all) {
        let a: Int32 = 1
        var fun = {=> f + a}
        result = result + fun()
    }
    return result
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 112) {
        return 0
    } else {
        return -1
    }
}
