// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC-PIPE-1: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan foo(std.core::Array<...>)
class classTest<T> {}

func foo(t: Array<classTest<Int64>>): Int64 {
    throw Exception()
}

main() {
    foo(Array<classTest<Int64>>())
}
