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

public class Class {}

public class GenericClass<T2> {}

public struct Struct {}
