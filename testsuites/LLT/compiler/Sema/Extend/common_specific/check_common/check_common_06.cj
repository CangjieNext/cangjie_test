// EXEC-PIPE-1: %compiler %cmp_opt --experimental --output-type=chir %f 2>&1 | compare %f
// ASSERT: scan error: function foo is common, but extend is not common

package example.cmp

interface IA {
    func foo():Unit
}

extend Int64 <: IA {
    common func foo():Unit {
        println("common::Int64::foo")
    }
}
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

