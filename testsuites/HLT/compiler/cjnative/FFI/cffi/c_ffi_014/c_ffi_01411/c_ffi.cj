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

foreign {
    func testfunc(fmt: CString): CString

    func fflushOut(): Unit

    func printf(fmt: CString): Int32
}

@CallingConv[CDECL]
var count = 0
@CallingConv[CDECL]
let str = ""
@CallingConv[CDECL]
foreign var num1 = 0
@CallingConv[CDECL]
foreign let num2 = 0

@CallingConv[CDECL]
class TEST1 {
    var mem: Int8
    init(mem: Int8) {
        this.mem = mem
    }
}

@CallingConv[CDECL]
struct TEST2 {
    var mem: Int8
    init(mem: Int8) {
        this.mem = mem
    }
}

@CallingConv[CDECL]
@C
struct TEST3 {
    var mem: Int8
    init(mem: Int8) {
        this.mem = mem
    }
}

main(): Int64 {
    var a: CString = unsafe { LibC.mallocCString("Hello ") }
    var b: CString = unsafe { LibC.mallocCString("hello world\n") }
    var c: CString = unsafe { LibC.mallocCString("HELLO WORLD\n") }
    var d: CString = unsafe { LibC.mallocCString("HELLO WORLD") }
    if (a.isNull() || b.isNull() || c.isNull() || d.isNull()) {
        return 2
    }
    var str: CString
    unsafe { str = testfunc(a) }
    if (str.isNull()) {
        return 3
    }
    unsafe { printf(str) }
    unsafe { fflushOut() }
    if (str.equalsLower(a)) {
        count += 1
    }
    if (str.equalsLower(b)) {
        count += 1
    }
    if (str.equalsLower(c)) {
        count += 1
    }
    if (!str.equalsLower(d)) {
        count += 1
    }
    unsafe { LibC.free(str) }
    if (str.isEmpty()) {
        count += 1
    }

    if (count == 5) {
        return 0
    } else {
        return 1
    }
}
// ASSERT: scan sema_only_cfunc_can_use_annotation
// ASSERT: scan sema_native_var_error
