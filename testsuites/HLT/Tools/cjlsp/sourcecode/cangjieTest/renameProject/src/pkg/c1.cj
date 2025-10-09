/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.pkg

public open class Test {
    init(a: Int32) {}
    init(a: Int64) {}
    init(a!: Bool) {}
    init(c!: String = "cc") {}
    Test(a: Int64, b!: Int64) {
        a + b
    }
    init(a: Int64, b!: Int32, c!: Bool = true) {}
}

func testC1() {
    var x1 = Test(1)
    var x2 = Test(1, b: 2)
    var x3 = Test(1, b: 2, c: true)
}
