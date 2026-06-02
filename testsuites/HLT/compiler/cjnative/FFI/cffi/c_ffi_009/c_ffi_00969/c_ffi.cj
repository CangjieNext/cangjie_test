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
var arg1: Int32 = 10
@C
foreign var arg2: CString = unsafe { LibC.mallocCString("") }
@C
let arg3: Int32 = 10
@C
foreign let arg4: CString = unsafe { LibC.mallocCString("") }

@C
func PassInt32PointerToCangjie(): CPointer<Int32> {
    return CPointer<Int32>()
}

@C
var arg5: CPointer<Int32> = PassInt32PointerToCangjie()
@C
let fut: Future<Unit> = spawn {
    var arg6: CPointer<Int32> = PassInt32PointerToCangjie()
}

@C
type Int = Int32

main() {}
// ASSERT: scan sema_illegal_use_of_annotation
// ASSERT: scan sema_unsafe_function_invoke_failed
