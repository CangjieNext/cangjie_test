// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

struct Test {
    public var a = 1
    public var b = 1
    public init(s: String) {
    }
}

func f(): String {
    return "aaa"
}

main(): Int64 {
    let res = Test("aaa")
    if (f() == "aaa") {
        return 0
    }
    return 1
}
