/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// DEPENDENCE: ../%n.c
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC-PIPE-1: %compiler %cmp_opt %ffic_opt -o %output 2>&1 | compare %f

var count = 0
var cstr1: CString = unsafe { LibC.mallocCString("Hello ") }
var cstr2: CString = unsafe { LibC.mallocCString("World\n") }
var cstr3: CString = unsafe { LibC.mallocCString("Hi!\n") }
var cstr4: CString = unsafe { LibC.mallocCString("Bye~\n") }

foreign func testfunc(fmt: CString): CString

extend CString <: Equatable<CString> {
    public operator func ==(rhs: CString): Bool {
        return this.equals(rhs)
    }
    public operator func !=(rhs: CString): Bool {
        return !this.equals(rhs)
    }
}

unsafe main(): Int64 {
    var cstr5: CString = testfunc(cstr1)
    if (cstr1.isNull() || cstr2.isNull() || cstr3.isNull() || cstr4.isNull() || cstr5.isNull()) {
        return 2
    }
    if (cstr5.equals(unsafe { LibC.mallocCString("Hello World\n") })) {
        count += 1
    }

    var arr1: Array<CString> = Array<CString>()
    arr1 = [cstr1, cstr2, cstr3, cstr4, cstr5]

    var res1 = arr1.get(1).getOrThrow()
    if (res1.equals(unsafe { LibC.mallocCString("World2") })) {
        count += 1
    }

    arr1.set(1, unsafe { LibC.mallocCString("World2") })

    arr1.reverse()

    var res2 = arr1.get(2).getOrThrow()
    if (res2.equals(unsafe { LibC.mallocCString("World2") })) {
        count += 1
    }

    if (arr1.contains(unsafe { LibC.mallocCString("Bye~\n") })) {
        count += 1
    }

    var itr = arr1.iterator()

    unsafe { LibC.free(cstr1) }
    unsafe { LibC.free(cstr2) }
    unsafe { LibC.free(cstr3) }
    unsafe { LibC.free(cstr4) }
    unsafe { LibC.free(cstr5) }

    if (count == 4) {
        return 0
    } else {
        return 1
    }
}
// ASSERT: scan sema_type_cannot_extend_imported_interface
