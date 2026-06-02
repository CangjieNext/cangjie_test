// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: %n.c
// EXEC: %clang %clang_shared_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt_chir2hlir %cffi-link %verbose_opt %f -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex and_b pass
// ASSERT: regex and_bool pass
// ASSERT: regex and_b right!
// ASSERT: regex and_bool right!
// ASSERT: scan-not Exception

foreign func testfunc(cb: CFunc<(Bool, Bool)->Bool>): Bool

var and_b:  CFunc<(Bool, Bool) -> Bool> = { a: Bool, b: Bool => return a && b }

@C
func and_bool(a: Bool, b: Bool): Bool { return a && b }

unsafe main():Int64 {
    if ( testfunc(and_b) == true ){
        print("and_b pass \n")
    } else {
        print("fail\n")
    }

    if ( testfunc(and_bool) == true ) {
        print("and_bool pass \n")
    } else {
        print("fail\n")
    }

    if (!and_b(false, true)) {
        print("and_b right! \n")
    }

    if (!and_bool(false, true)) {
        print("and_bool right! \n")
    }
    return 0
}
