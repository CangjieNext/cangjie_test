// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC: %compiler %cmp_opt %f --save-temps . -j1 --apc=1 --output-type=staticlib
// (CJNATIVE) EXEC: %llvmDissembler %n.bc -o %n.ll
// (CJNATIVE) EXEC: %cat %n.ll 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define i32 @_CN7default6calleeHCNY_2CAET1_ilENNY_1EECNY_2I1E(i8 addrspace(1)* %x, %"Tuple<Int32,Int64>"* noalias %y, %"enum.default:E"* noalias %z, i8 addrspace(1)* %w)

interface I1 {
    func foo() {
        0
    }
}

class CA <: I1 {}

enum E {
    E1 | E2(Int64)
}

func callee(x: CA, y: (Int32, Int64), z: E, w: I1): Int32 {
    0
}

func caller() {
    var ca = CA()
    var i1: I1 = CA()
    let res = callee(ca, (1, 2), E.E1, i1)
    0
}
