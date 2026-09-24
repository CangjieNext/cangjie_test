/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * top comment
 */
class A {
    /*
     * misaligned inside class
     * another star
     */
    let x: Int64 = 1

    public func f(): Unit {
        /*
         * inside func
         */
        println("f")
    }
}

main() {
    A().f()
}
