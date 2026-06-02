/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1 EXCLUDE
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    let a = case01()
    var a1 = match (a) {
        case x: () -> Unit => 0
        case _ => 1
    }
    let b = case02()
    var b1 = match (b) {
        case x: () -> Unit => 2
        case x: () -> () -> Unit => 0
        case _ => 1
    }
    if (b1 != 0) {
        return 2
    }
    let c = case03()
    var c1 = match (c) {
        case x: () -> Unit => 2
        case x: () -> () -> Unit => 3
        case x: () -> () -> () -> Unit => 0
        case _ => 1
    }
    if (c1 != 0) {
        return 3
    }
    return 0
}

func case01() {
    var a = {x: () -> Unit => x}
    return (a({=>}))
}

func case02() {
    var a = {x: () -> () -> Unit => x}
    return (a({=> {=>}}))
}

func case03() {
    var a = {x: () -> () -> () -> Unit => x}
    return (a({=> {=> {=>}}}))
}
