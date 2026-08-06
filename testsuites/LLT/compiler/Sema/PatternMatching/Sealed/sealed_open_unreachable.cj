// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args

// ASSERT: scan-2 "DiagKind": "sema_unreachable_pattern"

abstract sealed class Color {}

class Red <: Color {}

class Green <: Color {}

public open class Blue <: Color {}

class DarkBlue <: Blue {}

func f(c: Color) {
    match (c) {
        case _: Int64 => -1 // unreachable
        case _: Red => 0
        case _: Green => 1
        case _: Blue => 2
        case _: DarkBlue => -1 // unreachable
        case _ => -1 // unreachable
    }
}

main() {
    f(Red())
}
