// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC-PIPE-1: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan foo(default::classTest_1<...>)
class classTest_1<T, K> {}

class classTest_2<M> {}

func foo(c: classTest_1<Float64, classTest_2<classTest_1<Int64, String>>>): Int64 {
    throw Exception("Err")
}

main() {
    foo(classTest_1<Float64, classTest_2<classTest_1<Int64, String>>>())
}
