// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %f -o %output
// EXEC-PIPE-0: %run %output

open class A {}

class B <: A {}

interface I {}

extend B <: I {}

main(): Int64 {
    let ins: I = B()
    if ((ins is B) && (ins is A)) {
        return 0
    }
    return 1
}
