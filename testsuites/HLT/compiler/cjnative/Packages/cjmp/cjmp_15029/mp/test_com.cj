/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp
type i64 = Int64
public class A<T> {}
common extend <T> A<T> {
    public common mut prop p1: i64 {
        get() {1}
        set(v) {v}
    }
    public common static mut prop p2: i64 {
        get() {1}
        set(v) {v}
    }
}
public func f1() {
    return A<Int64>().p1 + A<Int64>.p2
}
