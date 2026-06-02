// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC-PIPE: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: regex-auto CCCC666999

open class AAAA {
    public var y: UInt64 = 888
}

class CCCC <: AAAA & ToString {
    public var x = 999

    public func toString(): String {
        return x.toString()
    }
}

enum EXHAUSTIVE_OTHER <: ToString & Hashable {
    A | B | C(Int64, Int32) | C(CCCC)

    public func toString(): String {
        match (this) {
            case A => return "AAAA"
            case B => return "BBBB"
            case C(i64, i32) => return "CCCC${i64}${i32}"
            case C(cls) => return cls.toString()
        }
    }

    public func hashCode(): Int64 {
        return 123456789
    }
}

main() {
    var e = EXHAUSTIVE_OTHER.C(666, 999)
    println(e)
}
