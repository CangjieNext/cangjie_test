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

class A {
    public var pstr: CPointer<Float32>

    public init(pstr: CPointer<Float32>) {
        this.pstr = pstr
    }

    public unsafe func foo(): Float32 {
        pstr.write(0, 1.23)
        var res = pstr.read()
        free(pstr)
        return res
    }

    public unsafe func free(): Unit {
        free(pstr)
    }
}

foreign {
    func testfunc(): CPointer<Float32>

    func free(cp: CPointer<Float32>): Unit
}

unsafe main(): Int64 {
    var count = 0

    var p1: CPointer<Float32> = testfunc()
    if (p1.isNull()) {
        return 2
    }
    var a1 = A(p1)

    if ((a1.pstr.read(0) - 3.14 < 1e-6) && (a1.pstr.read(1) == Float32(0))) {
        count += 1
    }

    var f32 = a1.foo()
    if (f32 - 1.23 < 1e-6) {
        count += 1
    }

    if (count == 2) {
        return 0
    } else {
        return 1
    }
}
