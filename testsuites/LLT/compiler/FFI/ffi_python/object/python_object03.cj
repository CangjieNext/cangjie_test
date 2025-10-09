// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: test01.py
// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan func01 called.
// ASSERT: scan TypeError: func01() takes 0 positional arguments but 1 was given
// ASSERT: scan ret: 30.2
// ASSERT: scan ret: helloworld
// ASSERT: scan ret: 20.3
// ASSERT: scan ret: helloworld
internal import ffi_python.*

main() {
    Python.load()
    var test01 = Python.Import("test01")
    var func01 = test01["func01"]
    func01()

    try { func01([10.toPyObj()]) } catch (e: PythonException) { println(e) }

    var func02 = test01["func02"]
    var ret = func02([10.toPyObj(), 20.2.toPyObj()])
    print("ret: ${ret}\n")

    ret = func02(["hello".toPyObj(), "world".toPyObj()])
    print("ret: ${ret}\n")

    ret = func02([10, 10.3])
    print("ret: ${ret}\n")

    ret = func02(["hello", "world"])
    print("ret: ${ret}\n")

    Python.unload()
}
