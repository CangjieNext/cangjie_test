/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package a

public enum Test1<T> {
    Hour(T)

    public func test<T1>() {
        print("this is a test")
    }
}

public enum Test2<T, T1> {
    Hour(T)

    public func test<T2>(): Unit {
        print("this is a test")
    }
}
