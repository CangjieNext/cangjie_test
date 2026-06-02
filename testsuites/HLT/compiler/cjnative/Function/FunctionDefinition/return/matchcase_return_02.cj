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

// Nothing express after "=>"

main(): Int64 {
    if (case01() != ()) {
        return 1
    }
    case02()
    if (case03() != 0) {
        return 1
    }
    return 0
}

// match expression return Min-Father Typle of Nothing and Unit
func case01() {
    let aa: Nothing = return
    let score = 80
    let a = 80
    var result = match (score) {
        case _ => aa
    }
    return
}

// match expression return Nothing,cause func return Nothing
func case02() {
    let score = 80
    let a = 80
    var result = match (score) {
        case a => return 0
        case _ => return 1
    }
    return result
}

// match expression return Nothing,but func renturn Unit
func case03() {
    let score = 80
    let a = 80
    var result = match (score) {
        case a => return 0
        case _ => return 1
    }
    return result
}
