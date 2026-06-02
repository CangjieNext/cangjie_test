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

public struct B<M> where M <: TypedMessage<M> {
    public func foo(): M {
        let m = M.empty()
        return m
    }
}

public struct R<M> where M <: TypedMessage<M> {
    public func foo(): M {
        let m = M.empty()
        return m
    }
}

public interface TypedMessage<M> {
    func clone(): M
    static func empty(): M
}

main() {
    0
}
