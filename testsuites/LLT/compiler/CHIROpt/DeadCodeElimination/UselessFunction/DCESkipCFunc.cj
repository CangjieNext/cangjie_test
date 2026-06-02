// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: DCECFuncSource.c DCECFuncHeader.h
// EXEC-PIPE-0: %clang -shared %clang_opt -fPIC DCECFuncSource.c -o libDCECFuncSource.so
// EXEC-PIPE-0: %compiler %cmp_opt %enableO2 -L. -lDCECFuncSource %f -o %output
// EXEC-PIPE-0: %run %run_opt %output

foreign func wrapper(buf: CPointer<UInt8>): Unit

@C public func changer(buf: CPointer<UInt8>) {
    for (it in 0..10) {
        unsafe{ buf.write(it, buf.read(it) + 10) }
    }
}

main() {
    var arr = VArray<UInt8, $10>{ i => UInt8(i) }
    unsafe { wrapper(inout arr) }
    for (i in 0..10) {
        if (UInt8(i + 10) != arr[i]) {
            return 1
        }
    }
    return 0
}