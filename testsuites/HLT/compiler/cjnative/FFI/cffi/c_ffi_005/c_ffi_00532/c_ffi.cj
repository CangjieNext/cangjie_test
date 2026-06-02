/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface I<T> where T <: CType {
    func test(mem1: T, mem2: T): T {
        return mem1
    }
}

class TEST<T> <: I<T> where T <: CType {
    var mem1: T
    var mem2: T

    init(mem1: T, mem2: T) {
        this.mem1 = mem1
        this.mem2 = mem2
    }
}

main() {
    var count = 0

    var cstr1 = unsafe { LibC.mallocCString("abc") }
    var cstr2 = unsafe { LibC.mallocCString("123") }
    if (cstr1.isNull() || cstr2.isNull()) {
        return 2
    }

    var a = TEST<CString>(cstr1, cstr2)
    var num = a.test(cstr1, cstr2)

    if (num.equals(cstr1)) {
        count += 1
    }
    unsafe {
        LibC.free(cstr1)
        LibC.free(cstr2)
    }
    if (count == 1) {
        return 0
    } else {
        return 1
    }
}
