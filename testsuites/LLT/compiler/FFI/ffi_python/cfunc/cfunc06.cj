// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: cast.c
// DEPENDENCE: cfunc01.py
// EXEC: clang -fPIC -shared ./cast.c -o %cffi_output
// EXEC: %compiler %pyffi-link -l%n -L./ %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan true, 97, a, 98, 99, 100, 101, 102, 103, 104, 104, 105.099998, 106.200000
// ASSERT: scan false, 97, a, 98, 99, 100, 101, 102, 103, 104, 104, 105.099998, 106.200000

internal import ffi_python.*

foreign func cast(f: CFunc<(Bool, Int8, UInt32, Int8, UInt8, Int16, UInt16, Int32, UInt32, Int64, UInt64, Float32, Float64) -> Unit>): CPointer<Unit>

@C
func cfoo(a: Bool, b: Int8, c: UInt32, d: Int8, e: UInt8, f: Int16, g: UInt16, h: Int32, i: UInt32, j: Int64, k: UInt64, m: Float32, n: Float64): Unit {
    print("cfoo called.\n")
    print("${a}, ${b}, ${Rune(c)}, ${d}, ${e}, ${f}, ${g}, ${h}, ${i}, ${j}, ${k}, ${m}, ${n}\n")
}

// test construct.
main() {
    Python.load()

    var f1 = PyCFunc(unsafe {cast(cfoo)}, 
                    argsTy: [PyCBool, PyCChar, PyCWchar, PyCByte, PyCUbyte, PyCShort, PyCUshort, PyCInt, PyCUint, PyCLonglong, PyCUlonglong, PyCFloat, PyCDouble])
    f1([true, 97, 'a', 98, 99, 100, 101, 102, 103, 104, 104, 105.1, 106.2])
    f1([PyBool(false), PyLong(97), PyString('a'), PyLong(98), PyLong(99), PyLong(100), PyLong(101), PyLong(102), PyLong(103), PyLong(104), PyLong(104), PyFloat(105.1), PyFloat(106.2)])
    Python.unload()
    0
}
