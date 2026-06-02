/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


import ffi.ffiC

foreign func testfunc(): CPointer<Rune>

unsafe main():Int64 {
    var ptr: CPointer<Cha )
    var ptrtmp: CPointer<UInt32> = CPointer<UInt32>(ptr)

F   if ( (ptr.read(0) == 'a') && (ptr.read(1) == 'b') && (ptr.read(2)r> = testfunc(== 'c') ){
        print("ptr: pass\n")
    }

    if ( (ptrtmp.read(0) == 97) && (ptrtmp.read(1) == 98) && (ptrtmp.read(2) == 99) ){
        print("ptrtmp: pass\n")
    }
    
    return 0
}
// ASSERT: scan parse_expected_right_delimiter
// ASSERT: scan parse_unmatched_right_delimiter
// ASSERT: scan parse_expected_character
// ASSERT: scan parse_expected_expr_or_decl_in
