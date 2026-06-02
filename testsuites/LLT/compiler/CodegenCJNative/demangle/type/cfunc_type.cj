// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// (not Darwin) ASSERT: scan at default::aCfunc(
// (Darwin) ASSERT: scan at default::_aCfunc(

// Test cFunc type demangling

interface foo {}

class Goo <: foo {}

func bar(cf: CFunc<(Int64) -> Int32>): foo {
    unsafe { cf(0) }
    Goo()
}

@C
func aCfunc(p1: Int64): Int32 {
    throw Exception()
    0
}

main() {
    bar(aCfunc)
    return 0
}
