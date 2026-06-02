// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC-0: %compiler %noColor %cmp_opt_chir2hlir %verbose_opt %f -o %output
// EXEC-0: %run %run_opt %output %run_args

func show(x: CType) {
    match (x) {
        case i64: Int64 => println(i64)
        case f64: Float64 => println(f64)
        case flag: Bool => println(flag)
        case foo: CFunc<() -> Unit> => unsafe { foo() }
        case ptr: CPointer<Int8> => println(ptr.toUIntNative())
        case cs: CString => println(cs.toString())
        case unit: Unit => println("unit")
        case _ => println("match failed")
    }
    0
}

main() {
    var a = 1
    show(a)
    var b = 1.0
    show(b)
    var c = false
    show(c)
    var f: CFunc<() -> Unit> = { => println("Hi") }
    show(f)
    var ptr = CPointer<Int8>()
    show(ptr)
    var cs = unsafe {LibC.mallocCString("Hello")}
    show(cs)
    unsafe { LibC.free(cs) }
    var unit = ()
    show(unit)
    var other = Int8(1)
    show(other)
}

// ASSERT: scan 1
// ASSERT: scan 1.000000
// ASSERT: scan false
// ASSERT: scan Hi
// ASSERT: scan 0
// ASSERT: scan Hello
// ASSERT: scan unit
// ASSERT: scan match failed
