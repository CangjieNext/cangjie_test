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
    if (case01() != 0) {
        return 1
    }
    if (case02() != 0) {
        return 1
    }
    if (case03() != 0) {
        return 1
    }
    if (case04() != 0) {
        return 1
    }
    return 0
}

func case01() {
    let score = 80
    let a = {=> 70}
    let b = {=>}
    var result: Int64 = match ({=>}) {
        case a => 0
        case _ => 10
    }
    return result
}

func case02() {
    let score = 80
    let a = {=> 70}
    let b = {=>}
    var result: Int64 = match ({=> 60}) {
        case a => 0
        case _ => 10
    }
    return result
}

func case03() {
    let score = 80
    let a = {=> 70}
    let b = {=>}
    var result: Int64 = match ({=> 60}) {
        case a => 0
        case _ => 10
    }
    return result
}

func case04() {
    let score = 80
    let a = {=> 70}
    let b = {=>}
    var result: Int64 = match ({a: Int64 => 60 + a}) {
        case a => 0
        case _ => 10
    }
    return result
}
