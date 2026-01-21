/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public platform open class A {
    private var valueX = 0
    private static var valueY = 0

    public open platform prop x: Int64 {
        get() { valueX }
    }

    public static mut platform prop y: Int64 {
        get() { valueY }
        set(v) {
            valueY = v
        }
    }
}

public platform class B <: A {
    private var valueX2 = 0
    private static var valueY2 = 0

    public override platform prop x: Int64 {
        get() { valueX2 }
    }

    public redef static mut platform prop y: Int64 {
        get() { valueY2 }
        set(v) {
            valueY2 = v
        }
    }
}

