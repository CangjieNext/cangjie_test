// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 套件1c-1: 泛型实例化→comdat去重 → CJMetadata ComdatMethodTable/各object format分派
// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

public func identity<T>(x: T): T { x }
public class Container<T> { let v: T
    public init(v: T) { this.v = v }
}

main(): Int64 {
    let r1 = identity<Int64>(42)
    let r2 = identity<String>("hi")
    let c = Container<Int64>(7)
    if (r1 == 42 && c.v == 7 && r2 == "hi") { return 0 }
    return 1
}
