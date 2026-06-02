// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

public interface BenchInputProvider<T> {
    mut func reset(max: T) {
        impl(max)
    }
    mut func impl(max: T): Unit
}

public struct ImmutableInputProvider<T> <: BenchInputProvider<T> {
    public ImmutableInputProvider(var data: T) {}
    public mut func impl(max: T): Unit {
        data = max
    }
}

main() {
    var a = ImmutableInputProvider<Int64>(1)
    a.reset(6)
    a.data - 6
}
