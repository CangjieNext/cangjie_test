/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public interface faterInterface1<T> {
    static func foo1(): T
    static func foo2<T>(a!: Int64): String {
        foo1();
        return a.toString()
    }
}

public interface MyInterface1 <: faterInterface1<String> {}

public interface faterInterface2<T> {
    static func foo3(): T
    static func foo4<T>(a!: Int64): String {
        foo3();
        return a.toString()
    }
}

public interface MyInterface2 <: faterInterface2<String> {}

public interface faterInterface3<T> {
    static func foo5(): T
    static func foo6<T>(a!: Int64): String {
        foo5();
        return a.toString()
    }
}

public interface MyInterface3 <: faterInterface3<String> {}

public class myClass {
    public static var x1: String = "foo1修改"
    public static var x2: String = "foo2修改"
    public static var x3: String = "foo3修改"
}

extend myClass <: MyInterface1 & MyInterface2 & MyInterface3 {
    public static func foo1(): String {
        x1 = "foo1修改成功"
        return x1
    }

    public static func foo3(): String {
        x2 = "foo3修改成功"
        return x2
    }

    public static func foo5(): String {
        x3 = "foo5修改成功"
        return x3
    }
}
