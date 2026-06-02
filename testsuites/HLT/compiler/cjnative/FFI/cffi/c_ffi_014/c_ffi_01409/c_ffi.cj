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
struct MyRecord {
    public MyRecord(var a: Int64) {}
}

@CallingConv[cdecl]
@C
foreign func AllocCStruct(): CPointer<MyRecord>

@CallingConv[CDECL, CDECL]
foreign func GetMaxFuncPtr(): CFunc<(CPointer<MyRecord>) -> (CPointer<MyRecord>)>

@CallingConv[CDECL, STDCALL]
foreign func printf(fmt: CString): Int32

var count = 0

func FuncFromC(): Int64 {
    var a = unsafe { GetMaxFuncPtr() }
    var input = MyRecord(1)
    var tmp = unsafe { AllocCStruct() }
    unsafe { tmp.write(0, input) }
    var b = unsafe { a(tmp) }
    var res = unsafe { b.read(0) }
    if (res.a == 2) {
        count += 1
    }
    return 0
}

main(): Int64 {
    FuncFromC()

    if (count == 1) {
        return 0
    } else {
        return 1
    }
}
// ASSERT: scan sema_annotation_calling_conv_not_support
// ASSERT: scan sema_annotation_error_arg_num
