/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default

extend String {
    @Deprecated
    public func printSize() :Unit{
        println("the size is ${this.size}")
    }
}

func testcase05() {
    let test_05 = "135"
    test_05.printSize()
}
