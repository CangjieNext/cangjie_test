// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

struct RA {
    public var id: Int64 = 15
    public var age: Int64 = 40
}

struct RB {
    public var ra = RA()
}

struct RC {
    public var rb = RB()
}

class CA {
    public var rc = RC()
    public var qq = 12
}

main() {
    var ca = CA()
    var tmp = ca.rc.rb.ra
    tmp.age = 58
    ca.rc.rb.ra.id = 9
    if (ca.rc.rb.ra.id == 9 && ca.qq == 12 && tmp.id == 15 && tmp.age == 58) {
        return 0
    }
    return 1
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
