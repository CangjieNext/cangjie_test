// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC: %compiler %cmp_opt %f --save-temps . -j1 --apc=1 --output-type=staticlib
// (CJNATIVE) EXEC: %llvmDissembler %n.bc -o %n.ll
// (CJNATIVE) EXEC: %cat %n.ll 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan-not !CodeGenAddedForIncr
// (CJNATIVE) ASSERT: scan-not !StaticGenericTIsForIncr

public class CA<T> {
    let field0: T
    let field1: Int64
    public init(x: T, y: Int64) {
        field0 = x
        field1 = y
    }
}

public func foo() {
    let a = CA<Int64>(42, 100)
    println(a.field0)
    println(a.field1)
    0
}
