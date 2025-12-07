/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not MAC) EXEC: %compiler --disable-reflection %cmp_opt %f -o %output
// (not MAC) RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// (not MAC) ASSERT: scan instanceVariables.size: 0

import std.reflect.*

class Foo {
    public var f1:Int64 = 11
}

class ObjectClass {
    let newInstanceFunc: () -> Any
    public init(newInstanceFunc: () -> Any) {
        this.newInstanceFunc = newInstanceFunc
    }

    public func newInstance(): Any {
        return this.newInstanceFunc()
    }
}

main() {
    let objCreater = ObjectClass({=> Foo()})
    let obj = objCreater.newInstance()
    let typeInfo = ClassTypeInfo.of(obj)
    println("instanceVariables.size: ${typeInfo.instanceVariables.size}")
}
