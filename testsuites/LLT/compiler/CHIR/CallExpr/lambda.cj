// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

public let f1: (Int64) -> Int64 = {a: Int64 => a}

class Data {
    public let f: (Int64) -> Int64 = {a: Int64 => a}
    public init() {}
}

struct Data2 {
    public let f: (Int64) -> Int64 = {a: Int64 => a}
    public init() {}
}

main(): Int64 {
    // global function 
    f1(1)
    //class memberfunc
    var t1 = Data().f(1)
    var d1 = Data()
    if (t1 != 1 || d1.f(1) != 1) {
        return 1
    }
    //struct memberfunc
    var t2 = Data2().f(1)
    var d2 = Data2()
    d2.f(1)
    return 0
}
