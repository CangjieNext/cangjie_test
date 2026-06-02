// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: %n.c
// EXEC: %clang %clang_shared_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt_chir2hlir %cffi-link %f -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan foo pass

@C
struct Empty {}

@C
struct Big {
    public var a: Int64 = 0
    public var b: Int64 = 0
    public var c: Int64 = 0
}

foreign func testFoo(foo: CFunc<(Int8, Empty, UInt16, Empty) -> Big>): Unit

@C
func foo(p1: Int8, _: Empty, p2: UInt16, _: Empty): Big {
    if (p1 == 100 && p2 == 200) {
        println("foo pass")
    } else {
        println("foo fail")
    }
    var big = Big()
    return big
}

unsafe main(): Unit {
    testFoo(foo)
}
