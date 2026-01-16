/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public common open class A {
    private var valueX = 0
    private static var valueY = 0
    public init() {}
    public open common prop x: Int64

    public static mut common prop y: Int64
}

public common class B <: A {
    private var valueX2 = 0
    private static var valueY2 = 0
    public init() { super() }
    public override common prop x: Int64

    public redef static mut common prop y: Int64
}

