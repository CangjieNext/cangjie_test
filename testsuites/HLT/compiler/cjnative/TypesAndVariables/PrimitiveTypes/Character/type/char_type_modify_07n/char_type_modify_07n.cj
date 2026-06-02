/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: char_type_modify_07n_a.cj
// EXEC: %compiler %cmp_opt %f char_type_modify_07n_a.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package char_type_modify_07n

class B {
    public var character: Rune = A().c
}

main(): Int64 {
    var b = B()
    return 0
}
