// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class ConcreteIterator<K, V> <: Iterator<(K, V)> {
    private var it: Iterator<(K, V)>

    public init(it: Iterator<(K, V)>) {
        this.it = it
    }

    public func next(): Option<(K, V)> {
        match (it.next()) {
            case Some((k, v)) => Option<(K, V)>.None
            case _ => Option<(K, V)>.None
        }
    }
}

main() {
    0
}
