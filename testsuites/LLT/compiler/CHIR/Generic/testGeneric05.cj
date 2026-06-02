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

public class Binary<T> <: Collection<T> where T <: Equatable<T> {
    public prop size: Int64 {
        get() {
            0
        }
    }
    public func isEmpty() {
        true
    }
    public func iterator() {
        return It<T>()
    }
}

public class It<T> <: Iterator<T> where T <: Equatable<T> {
    public func next(): Option<T> {
        None
    }
}

main() {
    0
}
