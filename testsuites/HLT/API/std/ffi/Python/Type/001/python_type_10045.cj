/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %compiler %cmp_opt  %link-python %macro_debug %f -o %output 2>&1 | compare %f


import std.ffi.python.*
import std.log.*
import std.math.*
import define.*

var i = Python.load()

main(): Int64 {
    let testcases = (1u8,1i8,1u16,1i16,1u32,1i32,1u64,1i64,1.0f32,1..0u64,"1",'1',true,false)
    var x = @M[14] // size of testcases.
        {
            println(testcases[x].toPyObj())
        }
    x()
    return 0
}
// ASSERT: scan parse_expected_decl
// ASSERT: scan parse_expected_double_arrow_in_lambda
