/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func myIf(a: Bool, fn: () -> Int64) {
    if (a) {
        fn()
    } else {
        0
    }
}

func test() {
    myIf(true, {=> 100})
    myIf(true) {
        100
    }
}

main() {
    myIf(true, {=> 100})
    myIf(true) {
        100
    }
    test()
    0
}
