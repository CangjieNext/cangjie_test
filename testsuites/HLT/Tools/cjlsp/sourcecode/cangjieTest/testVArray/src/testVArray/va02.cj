/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testVArray

class C1 {
    let l1: VArray<Int64, $5> = [1, 2, 3, 4, 5]
    var l2: VArray<Int64, $0> = []
    //let l3:VArray<String,$2> = ["true","true"]
}

func test1() {
    var a1 = C1().l1
}
