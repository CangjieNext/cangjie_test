/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    return 0
}

var a1 = {
    =>
    var a: Int32 = 1
    let b: Int32 = 2
    var x1 = {=> a}
    var x2 = {=> b}
}
var a2 = {
    =>
    var a: Int32 = 1
    let b: Int32 = 2
    var x1 = foo({=> a})
    var x2 = foo({=> b})
}
var a3 = {
    =>
    var a: Int32 = 1
    let b: Int32 = 2
    if (a == 2) {
        return {=> a}
    } else {
        return foo({=> a})
    }
    if (a == 2) {
        return {=> b}
    } else {
        return foo({=> b})
    }
}
var a4 = {
    =>
    var a: Int32 = 1
    if (a == 2) {
        return {=> a}
    } else {
        return foo({=> a})
    }
}

func foo(x: () -> Int32) {
    return x
}

func goo(x: Int32) {
    return x
}
// ASSERT: scan sema_use_func_capture_var_alone
