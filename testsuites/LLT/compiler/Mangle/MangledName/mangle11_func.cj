// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// (CJNATIVE and DEBUG_OPTION) EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt --apc=1 %f 2>&1 | compare %f
// (not CJNATIVE and DEBUG_OPTION) EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %f 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan @_CN7default3barHFCilE
// (not CJNATIVE) ASSERT: scan @_ZN7default3barEFilE
// ASSERT: scan define internal i32 @aCfunc
// (CJNATIVE) ASSERT: scan define internal i32 @_CN7defaultU0000000418cDh6aCfuncHl(i64 %p1)
// (CJNATIVE) ASSERT: scan @_CN7default3bazHF0ilE
// (not CJNATIVE)  ASSERT: scan "_ZN7default3bazEC_ZN016$LambdaCommon_ilE"

// Test Func type mangling: Cfunc and CjFunc

interface foo {}

class Goo <: foo {}

func bar(cf: CFunc<(Int64) -> Int32>): foo {
    Goo()
}

func baz(cf: (Int64) -> Int32): foo {
    Goo()
}

@C
private func aCfunc(p1: Int64): Int32 {
    0
}

main() {
    bar(aCfunc)
    baz({i => Int32(i)})
    return 0
}
