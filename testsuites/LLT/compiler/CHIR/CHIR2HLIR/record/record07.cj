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

main() {
    var ra = RA()
    var tup = (ra, ra)
    var ra_copy = ra
    ra.id = 8
    ra.age = 20

    if (ra.id == 8 && ra.age == 20 && ra_copy.age == 40 && tup[1].id == 15) {
        return 0
    }
    return 1
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
