// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: A
// EXEC-PIPE: %compiler -p A %compile_lib_opt -o A.%middle
// EXEC-PIPE: %compiler %cmp_opt A.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan T <: Integer<T>
// ASSERT: scan T <: Float<T>
// ASSERT: scan T <: Float<T> & Integer<T>

internal import A.*

class I64 <: Integer<I64> {}

class F64 <: Float<F64> {}

class M128 <: Integer<M128> & Float<M128> {}

main() {
    sumInt([I64()])
    sumFloat([F64()])
    sumNumeric([M128()])
    return 0
}
