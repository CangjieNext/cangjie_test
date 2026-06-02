// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main(): Int64 {
    let x = 100

    // if expression without else branch
    if (x > 0) {
        print("x is larger than 0")
    }

    // if expression with else branch
    if (x > 0) {
        print("x is larger than 0")
    } else {
        print("x is not larger than 0")
    }

    // if expression with nested if expression
    if (x > 0) {
        print("x is larger than 0")
    } else if (x < 0) {
        print("x is lesser than 0")
    } else {
        print("x equals to 0")
    }
    return 0
}
