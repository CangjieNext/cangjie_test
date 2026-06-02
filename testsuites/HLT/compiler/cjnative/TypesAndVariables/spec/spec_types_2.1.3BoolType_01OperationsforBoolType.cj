/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    let bool1: Bool = true
    var bool2: Bool = false
    bool2 = true // assignment
    bool2 &&= bool1 // bool2=true
    bool2 ||= bool1 // bool2=true
    true == false // return false
    true != false // return true
    !false // logical NOT, return true
    true && false // logical AND, return false
    false || false // logical OR, return false
    if (bool2 && (!(true == false)) && (true != false) && (!false) && (!(true && false)) && (!(false || false))) {
        return 0
    }
    return 1
}
