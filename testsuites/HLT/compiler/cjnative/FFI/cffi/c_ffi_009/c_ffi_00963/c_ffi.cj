/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

@C
struct Test1<X, Y, Z> {
    var a: X
    var b: Y
    var c: Z

    init(a: X, b: Y, c: Z) {
        this.a = a
        this.b = b
        this.c = c
    }
}

struct Test2<X, Y, Z> {
    var a: Test1<X, Y, Z>
    var b: Test1<X, Y, Z>
    var c: Test1<X, Y, Z>

    init(a: Test1<X, Y, Z>, b: Test1<X, Y, Z>, c: Test1<X, Y, Z>) {
        this.a = a
        this.b = b
        this.c = c
    }
}

func test(): Unit {
    var a1 = Test1<Int64, Float32, Int8>(0, 0.0, 0)
    var a2 = Test2<String, String, CString>("", "", unsafe { LibC.mallocCString("") })
}

main() {
    test()
}
// ASSERT: scan sema_cffi_cannot_have_type_param
// ASSERT: scan sema_illegal_member_of_cstruct
// ASSERT: scan sema_mismatched_types
