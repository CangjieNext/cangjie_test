/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


package upstream

// 约束接口（bounded 的泛型上界）
public interface MyBound {
    func getId(): Int64
}

// 满足 MyBound 约束的实现（bounded 正面 apply 的泛型实参）
public class GoodImpl <: MyBound {
    public func getId(): Int64 {
        return 1
    }
}

// 不满足 MyBound 约束的普通类（bounded 约束违反 apply 的泛型实参）
public class PlainClass {
    public var v: Int64 = 0
    public init() {}
}

public class GenericAdvFuncShape {
    // 泛型函数体内抛异常 → 泛型 apply 封装为 Exception（文档 :5103）
    public func genericFail<T>(x: T): T {
        throw Exception("generic boom")
    }

    // where 约束泛型函数 → 泛型实参不满足约束抛 IllegalTypeException（文档 :5102）
    public func bounded<T>(x: T): T where T <: MyBound {
        return x
    }
}
