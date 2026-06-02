// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class A<K> {
    public var k: K
    public init(j: K) {
        k = j
    }
    public func get() {
        k
    }
}

main() {
    var ins = A<Int64>(8)
    return ins.get() - 8
}
