/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum A {
    TEST

    func test(a!: Int64 = 1): Int64 {
        func test1() {
            func test2() {
                1
            }
        }
        return 0
    }
}

main() {
    var a = A.TEST
    return a.test()
}
