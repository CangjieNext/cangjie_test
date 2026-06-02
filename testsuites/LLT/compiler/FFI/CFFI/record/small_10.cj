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
// ASSERT: scan In pfoo: 1, 101
// ASSERT: scan In pfoo: 2, 202
// ASSERT: scan In ppfoo: 1, 101
// ASSERT: scan In ppfoo: 2, 202
// ASSERT: scan In foo: 1, 11
// ASSERT: scan In foo: 2, 22
// ASSERT: scan In pfoo: 1, 11
// ASSERT: scan In pfoo: 2, 22
// ASSERT: scan In ppfoo: 1, 11
// ASSERT: scan In ppfoo: 2, 22
// ASSERT: scan 1, 31, 31, 31, 31, 31, 31
// ASSERT: scan 2, 42, 42, 42, 42, 42, 42

foreign {
    func ProcessDataI64I64(d: DataI64I64): DataI64I64

    func malloc(sz: UInt32): CPointer<Int8>
    func free(ptr: CPointer<Int8>): Unit
}

@C
struct DataI64I64 {
    var a: Int64 = 1
    var b: Int64 = 2
}

@C
func foo(d: DataI64I64, f: CFunc<(DataI64I64) -> DataI64I64>): CFunc<(DataI64I64) -> DataI64I64> {
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

@C
func pfoo(d: DataI64I64, pf: CPointer<CFunc<(DataI64I64) -> DataI64I64>>): CFunc<(DataI64I64) -> DataI64I64> {
    var f = unsafe { pf.read() }
    var dc = unsafe { f(d) }
    println("In pfoo: ${d.a}, ${dc.a}")
    println("In pfoo: ${d.b}, ${dc.b}")

    var cb: CFunc<(DataI64I64) -> DataI64I64> = { d: DataI64I64 =>
        var dc = d
        dc.a += 30
        dc.b += 40
        dc
    }
    return cb
}

@C
func ppfoo(d: DataI64I64, ppf: CPointer<CPointer<CFunc<(DataI64I64) -> DataI64I64>>>): CFunc<(DataI64I64) -> DataI64I64> {
    var pf = unsafe { ppf.read() }
    var f = unsafe { pf.read() }
    var dc = unsafe { f(d) }
    println("In ppfoo: ${d.a}, ${dc.a}")
    println("In ppfoo: ${d.b}, ${dc.b}")

    var cb: CFunc<(DataI64I64) -> DataI64I64> = { d: DataI64I64 =>
        var dc = d
        dc.a += 30
        dc.b += 40
        dc
    }
    return cb
}

unsafe main() {
    let sz: UInt32 = 8
    var d0 = DataI64I64()

    var cb: CFunc<(DataI64I64) -> DataI64I64> = { d: DataI64I64 =>
        var dc = d
        dc.a += 100
        dc.b += 200
        dc
    }

    var pf = CPointer<CFunc<(DataI64I64) -> DataI64I64>>(malloc(sz))
    var ppf = CPointer<CPointer<CFunc<(DataI64I64) -> DataI64I64>>>(malloc(sz))
    ppf.write(pf)

    var f0 = foo(d0, cb)
    var d1 = f0(d0)

    pf.write(cb)
    var f1 = pfoo(d0, pf)
    var d2 = f1(d0)

    var f2 = ppfoo(d0, ppf)
    var d3 = f2(d0)

    var f3 = foo(d0, ProcessDataI64I64)
    var d4 = f3(d0)

    pf.write(ProcessDataI64I64)
    var f4 = pfoo(d0, pf)
    var d5 = f4(d0)

    var f5 = ppfoo(d0, ppf)
    var d6 = f5(d0)

    println("${d0.a}, ${d1.a}, ${d2.a}, ${d3.a}, ${d4.a}, ${d5.a}, ${d6.a}")
    println("${d0.b}, ${d1.b}, ${d2.b}, ${d3.b}, ${d4.b}, ${d5.b}, ${d6.b}")

    free(CPointer<Int8>(pf))
    free(CPointer<Int8>(ppf))
}
