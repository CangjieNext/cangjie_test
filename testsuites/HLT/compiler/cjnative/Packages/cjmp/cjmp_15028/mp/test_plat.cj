/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp
specific extend <T> A<T> {
    public specific mut prop p1: T {
        get() {b}
        set(v) {b=v}
    }
}
public func f2() {
    return A<Int64>(1, 2).p1
}
