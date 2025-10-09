/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package frozen

struct Goo {
    let width: Int64 = 10
    let height: Int64 = 20

    @Frozen
    public func area() :Int64{
        this.width * this.height
    }

    @Frozen
    public static func typeName(): String {
        "Rectangle"
    }
}
