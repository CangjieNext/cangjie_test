/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package unicodeProject.cases
open class A_029 {
    private var valueX = 0
    private static var valueY = 0

    public open prop : Int64 {
        get() { valueX }
    }

    public static mut prop : Int64 {
        get() { valueY }
        set(v) {
            valueY = v
        }
    }
}
