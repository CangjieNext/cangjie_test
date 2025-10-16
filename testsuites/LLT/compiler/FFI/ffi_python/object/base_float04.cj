// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan python print: 0.058823529411764705
// ASSERT: scan equal to cangjie Float64: true
internal import ffi_python.*

main(): Int64 {
    Python.load()

    var a = match (Python.Eval("0.058823529411764705882352941176470588235294117647059")) {
        case val: PyFloat => val
        case _ => throw PythonException()
    }

    var b: Float64 = 0.058823529411764705882352941176470588235294117647059

    print("python print: ${a}\n")
    print("equal to cangjie Float64: ${a.toCjObj() == b}\n")

    Python.unload()
    return 0
}
