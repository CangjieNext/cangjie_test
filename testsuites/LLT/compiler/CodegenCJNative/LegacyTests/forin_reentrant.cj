// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

var count = 0

func f() {
    count++
    return [1, 2, 3]
}

func codegenUnitTest(): Int64 {
    var ans = 0
    for (i in f()) {
        ans = ans + i
    }
    return ans + count // 6 + 1
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 7) {
        return 0
    } else {
        return -1
    }
}
