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
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// RUN-EXEC: %run %run_opt %output %run_args

@C
struct teststruct {
    public var i32: Int32
    public var ui32: UInt32

    public init(i32: Int32, ui32: UInt32) {
        this.i32 = i32
        this.ui32 = ui32
    }
}

class A {
    public var num: Int32
    public var pts: CPointer<teststruct>

    public init(num: Int32, pts: CPointer<teststruct>) {
        this.num = num
        this.pts = pts
    }
}

extend A {
    public unsafe func foo(num: Int32, pts: CPointer<teststruct>): Int32 {
        var res = num + pts.read().i32
        return res
    }
}

foreign {
    func AllocCStruct(): CPointer<teststruct>

    func testfunc(): CPointer<teststruct>
}

foreign func free(cp: CPointer<teststruct>): Unit

unsafe main(): Int64 {
    var count = 0
    var ptr1 = AllocCStruct()
    var a1 = A(1, testfunc())
    var a2 = A(2, ptr1)

    if ((a1.pts.read().i32 == a2.pts.read().i32) && (a1.pts.read().ui32 == a2.pts.read().ui32)) {
        count += 1
    }
    var ptr2 = AllocCStruct()
    if (a2.foo(1, ptr2) == 2) {
        count += 1
    }

    free(ptr1)
    free(ptr2)
    if (count == 2) {
        return 0
    } else {
        return 1
    }
}
