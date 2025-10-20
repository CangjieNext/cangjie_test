// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: cast.c
// DEPENDENCE: cfunc02.py
// EXEC: clang -fPIC -shared ./cast.c -o %cffi_output
// EXEC: %compiler %pyffi-link -l%n -L./ %f -o %output
// EXEC: export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 42
// ASSERT: scan hello
// ASSERT: scan 123 str 1 2 3
// ASSERT: scan Alice 26
// ASSERT: scan 4 5 6
// ASSERT: scan true
// ASSERT: scan 3.140000
// ASSERT: scan [8, 9, 7]
// ASSERT: scan 1 : 5 : 2


internal import ffi_python.*

foreign func cast(f: CFunc<(CPointer<Unit>) -> CPointer<Unit>>): CPointer<Unit>

// Define the @C function.
// argsList: (Int64, String, (Int64, String, Array<Int64>), HashMap<String, String>, Array<Int64>, Bool, float, set, slice)
@C
func cfoo(ptr: CPointer<Unit>): CPointer<Unit> {
    let listObj = parseCallBackArgsList(ptr)
    println("start parse list:")

    let obj0 = parseCallBackArgAsPyLong(listObj[0])
    println("${obj0.toCjObj()}")

    let obj1 = parseCallBackArgAsPyString(listObj[1])
    println("${obj1.toCjObj()}")

    let obj2 = parseCallBackArgAsPyTuple(listObj[2])
        let a = parseCallBackArgAsPyLong(obj2[0])
        print("${a.toCjObj()} ")
        let b = parseCallBackArgAsPyString(obj2[1])
        print("${b.toCjObj()} ")
        let c = parseCallBackArgAsPyList(obj2[2])
        for (item in c) {
            let l = parseCallBackArgAsPyLong(item)
            print("${l.toCjObj()} ")
        }
        print("\n")

    let obj3 = parseCallBackArgAsPyDict(listObj[3])
        let d = parseCallBackArgAsPyString(obj3.getItem(PyString("name")))
        print("${d.toCjObj()} ")
        let e = parseCallBackArgAsPyLong(obj3.getItem(PyString("age")))
        print("${e.toCjObj()} ")
        print("\n")

    let obj4 = parseCallBackArgAsPyList(listObj[4])
        for (item in obj4) {
            let l = parseCallBackArgAsPyLong(item)
            print("${l.toCjObj()} ")
        }
        print("\n")

    let obj5 = parseCallBackArgAsPyBool(listObj[5])
    println("${obj5.toCjObj()} ")

    let obj6 = parseCallBackArgAsPyFloat(listObj[6])
    println("${obj6.toCjObj()} ")

    let obj7 = parseCallBackArgAsPySet(listObj[7])
    println("${obj7.toCjObj()} ")

    let obj8 = parseCallBackArgAsPySlice(listObj[8])
    println("${obj8.toCjObj().start} : ${obj8.toCjObj().end} : ${obj8.toCjObj().step}")

    return CPointer<Unit>()
}

main() {
    Python.load()

    var f1 = PyCFunc(unsafe {cast(cfoo)},
                    argsTy: [PyCPointer],
                    retTy: PyCPointer)

    var cfunc02 = Python.Import("cfunc02")
    cfunc02["foo"]([f1])

    Python.unload()
    0
}