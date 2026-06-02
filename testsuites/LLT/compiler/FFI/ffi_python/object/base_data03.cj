// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC-PIPE:: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args
internal import ffi_python.*

main(): Int64 {
    Python.load()

    Int64(1).toPyObj()
    Int32(2).toPyObj()
    Int16(3).toPyObj()
    Int8(4).toPyObj()
    UInt64(5).toPyObj()
    UInt32(6).toPyObj()
    UInt16(7).toPyObj()
    UInt8(8).toPyObj()
    'a'.toPyObj()
    "abc".toPyObj()
    Float32(1.1).toPyObj()
    Float64(1.1).toPyObj()

    Python.unload()
    return 0
}
