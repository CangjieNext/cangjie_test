// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: cast.c
// DEPENDENCE: cfunc01.py
// EXEC: clang -fPIC -shared ./cast.c -o %cffi_output
// EXEC: %compiler %pyffi-link -l%n -L./ %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args

internal import ffi_python.*

var x = Python.load()

foreign func cast(f: CFunc<(CPointer<Int64>, CString, CString) -> Unit>): CPointer<Unit>

@C
func foo(a: CPointer<Int64>, b: CString, c: CString): Unit {
    print("${unsafe {a.read(0)}}, ${b.toString()}, ${c.toString()}\n")
}

main(): Int64 {
    var f = PyCFunc(unsafe {cast(foo)}, argsTy: [PyCPointer, PyCCpointer, PyCWcpointer], retTy: PyCVoid)
    var s = PySlice(0..10:1)
    var s1 = PySlice(Int8(0)..Int8(10):1)

    PyList<PyObj>([f, f, f, f, f])
    PyList<PyObj>([f, f, f, s, s])
    PyList<PyObj>([s, s, s, s, s])
    PyList<PyObj>([s1, s1, s1, s1, s1])

    PyTuple([f, f, f, f, f])
    PyTuple([f, f, f, s, s])
    PyTuple([s, s, s, s, s])
    PyTuple([s1, s1, s1, s1, s1])

    Python.unload()
    return 0
}