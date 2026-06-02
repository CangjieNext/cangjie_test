// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

struct RB {
    public var ra = RA()
}

class CB {
    public var rb = RB()
}

struct RA {
    public var ca = CA()
    public var qq = 58
}

class CA {
    public var id = 5
    public var age = 12
}

func foo(rb: RB) {
    return rb.ra.qq
}

main() {
    var cb = CB()
    var tmp = cb.rb
    tmp.ra.qq = 43
    tmp.ra.ca.id = 11
    cb.rb.ra.qq = 45
    foo(cb.rb)
    cb.rb.ra.ca.id = 8

    if (foo(cb.rb) == 45 && tmp.ra.qq == 43 && tmp.ra.ca.id == 8 && cb.rb.ra.ca.id == 8) {
        return 0
    }
    return 1
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
