// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

var a: Int8 = 1

class b {
    public init() {}
    public init(c: Unit) {}
    public init(d: Float32) {
        b(a++)
    }
}

main() {
    b(1.0)
    0
}
