/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default

func foo() {
    
    @Deprecated
    func nestAdd(a: Int64, b: Int64) {
        a + b + 3
    }
    return nestAdd
}

func testcase22() {
    let f = foo()
    let x= f(1,2)
}
