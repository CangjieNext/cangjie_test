/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default

struct Rectangle {
    public var width: Int64
    public var height: Int64

    public init(width: Int64, height: Int64) {
        this.width = width
        this.height = height
    }

    @Deprecated
    public func area() :Int64{
        width * height
    }
}

class Test_A {
    @Deprecated
    public static prop y: Int64 {
        get() {
            321
        }
    }
}

func testcase03() {
    let r = Rectangle(10, 20)
    let a = r.area()
    let test_b = Test_A.y
}
