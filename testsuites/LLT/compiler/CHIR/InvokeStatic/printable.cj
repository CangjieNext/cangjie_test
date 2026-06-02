// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %enableFuncInlining %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

interface AssertPrintableCollection<C> where C <: AssertPrintableCollection<C> {
    func pprint(right: C): Unit
}

interface AssertPrintableSet<C, K> where C <: Set<K>, K <: Equatable<K> & Hashable {
    static func pprint(_: C) {
    }
}

extend<K> TreeSet<K> <: AssertPrintableCollection<TreeSet<K>> where K <: Equatable<K> & Hashable {
    public func pprint(right: TreeSet<K>) {
        AssertPrintableSet<TreeSet<K>, K>.pprint(right)
    }
}

main() {}
