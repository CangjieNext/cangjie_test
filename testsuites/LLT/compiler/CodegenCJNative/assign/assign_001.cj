// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1
// EXEC: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan cccbbb

class B {
    public var b: Int64 = 1
    public init() {
        print("bbb")
    }
}

class C {
    public var c: Int64 = 1
    public init() {
        print("ccc")
    }
}

main() {
    B().b = C().c
    return 0
}
