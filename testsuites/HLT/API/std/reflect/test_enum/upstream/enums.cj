/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package upstream

public enum Enum {
    | A
    | B(Int64, Bool, Float64)
    | C(Struct, Enum, Class)
    | D((Unit, Unit))
    | E((Int64) -> Bool)
}

public class HelperClass {
    public init() {
    }
}

public struct HelperStruct {
    public var x: Int64 = 0i64

    public init() {
    }
}

public struct Struct {
    public init() {
    }
}

public class Class {
    public init() {
    }
}

public class GenericClass<T> {
    public init(value: T) {
    }
}

public enum CompositeEnum {
    | A
    | B(((Int64) -> Bool, Unit))
    | C((Int64) -> (Int64) -> Bool)
    | D(((Int64, Bool), Unit))
}
