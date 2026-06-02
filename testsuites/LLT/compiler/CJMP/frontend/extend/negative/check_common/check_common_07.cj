// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: a/a.cj
// EXEC-0: %compiler %noColor a/a.cj --output-type=staticlib
package A

public interface IA {}


// SEPARATE-FILE: c/c.cj
// EXEC-PIPE-1: %compiler %cmp_opt --experimental --output-type=chir c/c.cj libA.a 2>&1 | compare %f
// ASSERT: scan error: primitive type 'Int64' cannot extend imported interface

package example.cmp

import A.*

common extend Int64 <: IA {
    common func foo():Unit {
        println("common::Int64::foo")
    }
}
