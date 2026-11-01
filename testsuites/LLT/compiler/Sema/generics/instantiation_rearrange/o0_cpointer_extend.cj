// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DT spec#9 O0 CPointer-type on-demand query path.
// Without O2 (O0 path), extend CPointer<UInt8> to implement an interface. CPointer is a
// primitive type; GenericInstantiationManager does not pre-instantiate it and takes the
// on-demand query path.
// This case asserts the extend method is callable correctly.
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan greet ptr

interface IGreet {
    func greet() {
        println("greet ptr")
    }
}

extend CPointer<UInt8> <: IGreet {}

main() {
    var p = CPointer<UInt8>()
    p.greet()
    0
}
