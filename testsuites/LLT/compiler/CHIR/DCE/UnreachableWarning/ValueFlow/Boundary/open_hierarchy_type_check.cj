// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// An open hierarchy parameter does not provide a definite dynamic type.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class Base {}

class Derived <: Base {}

func check(value: Base) {
    if (value is Derived) {
        println("not inferred unreachable")
    }
}

main() {
    check(Base())
}

/* SCAN
*/
