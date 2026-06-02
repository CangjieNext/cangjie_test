/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package a

public class F<X> {
    public func test<T1>(a: T1) {
        println("T1")
    }

    public func test<T2>(a: X) {
        println("T2")
    }
}
