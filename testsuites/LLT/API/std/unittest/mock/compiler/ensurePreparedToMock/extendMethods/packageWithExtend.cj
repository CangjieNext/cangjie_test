/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package classWithoutExtend

import classWithoutExtend.classPackage.*

extend A {
    public func extFunc(x: Int): String {
        return "original"
    }

    public static func extStaticFunc(x: Int): String {
        return "original"
    }

    public func extGenericFunc<T>(x: T): String {
        return "original"
    }

    public static func extStaticGenericFunc<T>(x: T): String {
        return "original"
    }
}
