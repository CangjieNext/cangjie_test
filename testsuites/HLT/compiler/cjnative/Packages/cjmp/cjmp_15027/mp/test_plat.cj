/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp
platform extend <T> A<T> {
    public platform mut prop p1: Int64 {
        get() {2}
        set(v) {v}
    }
    public platform static mut prop p2: Int64 {
        get() {2}
        set(v) {v}
    }
}
public func f2() {
    return A<Int64>().p1 + A<Int64>.p2
}
