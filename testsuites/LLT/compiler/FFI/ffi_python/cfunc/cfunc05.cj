// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// will be abort, python ffi can't avoid.
// ASSERT: core dumped

internal import ffi_python.*

foreign func malloc(size: UIntNative): CPointer<Unit>

// test construct.
main() {
    Python.load()
    var ptr = unsafe {malloc(UIntNative(16))}
    var f1 = PyCFunc(ptr)
    try {f1()} catch(e: PythonException) {}
    Python.unload()
    0
}