// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: A
// EXEC-PIPE:%compiler %cmp_opt %compile_lib_opt A/A.cj -o A.%middle
// EXEC-PIPE:%compiler %cmp_opt A.%middle %f -o %output
// EXEC-PIPE-1: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan A::sumNumeric<...>(std.core::Array<...>)(
internal import A.*

// Mangle generic function with different constraints
class M128 <: Integer<M128> & Float<M128> {}

main() {
    sumNumeric([M128()])
    return 0
}
