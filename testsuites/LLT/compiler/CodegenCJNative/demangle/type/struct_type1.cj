// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC-PIPE-1: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan foo(default::structTest_1<...>)
struct structTest_1<M> {}

func foo(r: structTest_1<Float64>): Int64 {
    throw Exception()
}

main() {
    foo(structTest_1<Float64>())
}
