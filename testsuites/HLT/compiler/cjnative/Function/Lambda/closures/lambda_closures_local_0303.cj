/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    if (case02() != 7) {
        return 1
    }
    if (case03() != 7) {
        return 1
    }
    return 0
}

func case02() {
    var a: Coo = Coo()
    var b: Roo = Roo()
    var m: Int32 = 1
    {
        =>
        var s = a.a + a.b + b.a + b.b + m;
        var s1 = a;
        var s2 = b;
        s
    }()
}

func case03() {
    var a: Coo = Coo()
    var b: Roo = Roo()
    var m: Int32 = 1
    return {
        =>
        var s = a.a + a.b + b.a + b.b + m;
        var s1 = a;
        var s2 = b;
        s
    }()
}

class Coo {
    public var a: Int32 = 1
    public let b: Int32 = 2
}

struct Roo {
    public var a: Int32 = 1
    public var b: Int32 = 2
    public init() {}
}
