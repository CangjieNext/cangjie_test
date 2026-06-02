// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: foo.c
// EXEC: %clang %clang_shared_opt foo.c -o %cffi_output
// EXEC: %compiler %cmp_opt %n.cj %cffi-link -o %n.%suffix
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %n.%suffix 2>&1 | compare %f
// EXEC: %compiler %cmp_opt %enableO2 %n.cj %cffi-link -o %n.%suffix
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan In foo: 1, 101
// ASSERT: scan In foo: 2, 202
// ASSERT: scan In cjfoo: 1, 101
// ASSERT: scan In cjfoo: 2, 202
// ASSERT: scan In foo: 1, 11
// ASSERT: scan In foo: 2, 22
// ASSERT: scan In cjfoo: 1, 11
// ASSERT: scan In cjfoo: 2, 22
// ASSERT: scan 1, 31, 31, 51, 51, 31, 31, 51, 51
// ASSERT: scan 2, 42, 42, 62, 62, 42, 42, 62, 62

foreign func ProcessDataI64I64(d: DataI64I64): DataI64I64

@C
struct DataI64I64 {
    var a: Int64 = 1
    var b: Int64 = 2
}

@C
func foo(d: DataI64I64, f: CFunc<(DataI64I64) -> DataI64I64>) {
    var dc = unsafe { f(d) }
    println("In foo: ${d.a}, ${dc.a}")
    println("In foo: ${d.b}, ${dc.b}")

    var cb: CFunc<(DataI64I64) -> DataI64I64> = { d: DataI64I64 =>
        var dc = d
        dc.a += 30
        dc.b += 40
        dc
    }
    return cb
}

func cjfoo(d: DataI64I64, f: CFunc<(DataI64I64) -> DataI64I64>): CFunc<(DataI64I64) -> DataI64I64> {
    var dc = unsafe { f(d) }
    println("In cjfoo: ${d.a}, ${dc.a}")
    println("In cjfoo: ${d.b}, ${dc.b}")

    var cb: CFunc<(DataI64I64) -> DataI64I64> = { d: DataI64I64 =>
        var dc = d
        dc.a += 50
        dc.b += 60
        dc
    }
    return cb
}

unsafe main() {
    var d0 = DataI64I64()

    var cb: CFunc<(DataI64I64) -> DataI64I64> = { d: DataI64I64 =>
        var dc = d
        dc.a += 100
        dc.b += 200
        dc
    }

    var f0 = foo(d0, cb)
    var d1 = f0(d0)
    var d2 = f0(d0)

    var f1 = cjfoo(d0, cb)
    var d3 = f1(d0)
    var d4 = f1(d0)

    var f2 = foo(d0, ProcessDataI64I64)
    var d5 = f2(d0)
    var d6 = f2(d0)

    var f3 = cjfoo(d0, ProcessDataI64I64)
    var d7 = f3(d0)
    var d8 = f3(d0)

    println("${d0.a}, ${d1.a}, ${d2.a}, ${d3.a}, ${d4.a}, ${d5.a}, ${d6.a}, ${d7.a}, ${d8.a}")
    println("${d0.b}, ${d1.b}, ${d2.b}, ${d3.b}, ${d4.b}, ${d5.b}, ${d6.b}, ${d7.b}, ${d8.b}")
}
