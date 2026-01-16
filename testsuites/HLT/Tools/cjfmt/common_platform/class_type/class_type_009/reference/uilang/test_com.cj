/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

common public open class A {
    private var valueX = 0
    private static var valueY = 0
    public init() {}
    common public open prop x: Int64

    common public static mut prop y: Int64
}

common public class B <: A {
    private var valueX2 = 0
    private static var valueY2 = 0
    public init() {
        super()
    }
    common public override prop x: Int64

    common public static redef mut prop y: Int64
}
