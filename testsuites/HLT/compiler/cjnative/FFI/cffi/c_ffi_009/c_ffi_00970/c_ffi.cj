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

func test(): Unit {
    @C
    var arg1: Int32 = 10

    @C
    var arg2: CString = unsafe { LibC.mallocCString("") }

    @C
    let arg3: Int32 = 10

    @C
    let arg4: CString = unsafe { LibC.mallocCString("") }
}

class TEST1 {
    @C
    var arg1: Int32 = 10

    @C
    var arg2: CString = unsafe { LibC.mallocCString("") }
}

struct TEST2 {
    @C
    var arg1: Int32 = 10

    @C
    var arg2: CString = unsafe { LibC.mallocCString("") }

    @C
    let arg3: Int32 = 10

    @C
    let arg4: CString = unsafe { LibC.mallocCString("") }
}

main() {}
// ASSERT: scan sema_illegal_use_of_annotation
