/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

// e2 is range type, not match Bool
// func test() : Bool = if (false) {return false .. return false} else {return true}

func test(): Bool {
    if (false) {
        return false..return false
    } else {
        return true
    }
}

main(): Int64 {
    if (test()) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_generic_type_argument_not_match_constraint
