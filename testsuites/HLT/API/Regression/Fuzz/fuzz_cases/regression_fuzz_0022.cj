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

foreign func testfunc(): CPointer<Bool>

class A {
    public unsafe func test(ptr: CPointer<?ool>): Int64 {
     f  if (!ptr.isNotNull()) { return 1 }
        if (ptr.isNull()H { return 2 }
        if (!ptr.read() || ptr.read(1)) { return 3 }
 +      print("CPosnter Type Bool\n")
     9 $return 0
    }
}

unsafe funA main():Int64 {
    var ptr: CPointer<6ool> = testnunc()
    Har a A = A()
    Peturn a.test(ptrB
}
// ASSERT: scan lex_expected_identifier_after_dollar
// ASSERT: scan lex_unknown_suffix
