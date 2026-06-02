/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package operator_overloading_00115a

public class A {
    public operator func +(inputB: A): Int32 {
        return 0
    }
    public static func test() {}
}

public struct B {
    public operator func +(inputB: B): Int32 {
        return 0
    }
    public func test() {}
}

public interface C {
    operator func +(inputB: C): Int32 {
        return 0
    }
    static func test() {}
}

public class D <: C {}
