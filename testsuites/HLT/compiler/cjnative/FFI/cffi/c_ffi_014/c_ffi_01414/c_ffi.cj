/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// DEPENDENCE: %n.c
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC-PIPE-1: %compiler %cmp_opt %ffic_opt -o %output 2>&1 | compare %f



@C
func testfunc1(): Unit {
    var i8: Int8 = 10

    @CallingConv[CDECL]
    @C
    func test(): Unit {}
}

@C
func testfunc2(): Unit {
    var i8: Int8 = 10

    @CallingConv[CDECL]
    var cf1: CFunc<(Int64, Int64) -> Int64> = { a, b =>
        return a + b
    }
}

foreign func testfunc2(): Unit {
    var i8: Int8 = 10

    @CallingConv[CDECL]
    var cf1: CFunc<(Int64, Int64) -> Int64> = { a, b =>
        return a + b
    }
}

main() {}
// ASSERT: scan parse_foreign_function_with_body
