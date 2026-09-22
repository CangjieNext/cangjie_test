/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class C {
    /*
     * shifted comment
     * another line
     */
    var v: Int64 = 0
    public func f(a: Int64): Int64 {
        /*
         * comment inside func
         */
        return a + 1
    }
}

main() {
    let c = C()
    println(c.f(2))
}
