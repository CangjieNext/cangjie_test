// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

struct Rcd {
    public var a: Int64
    public var b: Int32
    public init(val: Int32) {
        a = 1
        b = val
    }
}

enum A {
    a(Int64)

    public operator func -(): Int64 {
        0
    }
    public operator func !(): Int64 {
        0
    }
}

main() {
    let rcd = Rcd(2)
    -A.a(1)
    !A.a(1)
    0
}
