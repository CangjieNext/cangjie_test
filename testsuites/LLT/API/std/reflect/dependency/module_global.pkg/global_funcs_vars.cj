/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package module_global.pkg

public func globalTestFunc1(): Int64 {
    42
}

public func globalTestFunc2(a: Int64, b: String): String {
    "${a}${b}"
}

public func globalGenericFunc<T>(x: T): T {
    x
}

public func overloadedGlobalFunc(a: Int64): Int64 {
    a
}

public func overloadedGlobalFunc(a: String): Int64 {
    a.size
}

public var globalTestVar1: Int64 = 123
public let globalTestVarImmutable: String = "immutable"
public var globalTestVar2: Float64 = 3.14
