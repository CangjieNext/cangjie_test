// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DT spec#9 O0 primitive-type on-demand query path.
// Without O2 (O0 path), extend the primitive type Int64 to implement an interface. Primitive
// types have no own declarable-to-instantiate declaration; GenericInstantiationManager takes the
// "query on demand, do not pre-instantiate" path for them (BuildAbstractFuncMap only indexes
// generic nominal decls, and primitive types are not among them).
// This case asserts the extend method is callable correctly under O0.
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan greet Int64

interface IGreet {
    func greet() {
        println("greet Int64")
    }
}

extend Int64 <: IGreet {}

main() {
    let n: Int64 = 1
    n.greet()
    0
}
