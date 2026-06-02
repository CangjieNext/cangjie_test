// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

enum TimeUnit1 {
    One(TimeUnit2)
}

enum TimeUnit2 {
    Two(TimeUnit3)
}

enum TimeUnit3 {
    Three
}

func codegenUnitTest(): Int32 {
    var time = TimeUnit1.One(TimeUnit2.Two(TimeUnit3.Three))
    var res: Int32 = match (time) {
        case One(Two(Three)) => 2
    }
    return res
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 2) {
        return 0
    } else {
        return -1
    }
}
