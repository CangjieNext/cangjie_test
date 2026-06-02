/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

struct A<T> {
    var x: T
    init(y: T) {
        x = y
    }
}

func goo<T>(a: T) {
    A<T>(a)
}

func test() {
    var a: A<String> = goo<String>("")
    a.x.size
}

main() {
    test()
}
