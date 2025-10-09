// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC-PIPE: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args

internal import ffi_python.*
internal import std.collection.*

class A <: PyFFIType  & Hashable & Equatable<A> {
    init() {}

    public func hashCode() : Int64 {0}

    public operator func ==(right: A) : Bool {false}

    public operator func !=(right : A) : Bool {true}
}

main() {
    Python.load()
    var a = PyDict<A, Int64>(HashMap<A, Int64>([]))
    try { a.getItem(A()) } catch(e: PythonException) {}

    var b = PyDict<Int64, A>(HashMap<Int64, A>([]))
    try { b.setItem(1, A()) } catch(e: PythonException) {}

    Python.unload()
}