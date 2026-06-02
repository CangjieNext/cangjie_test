/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

//对于没有 else 分支的 if 表达式，它的类型为 Unit ，它的值等于 ()

main(): Int64 {
    if (case01(2, 1) != ()) {
        return 4
    }
    return 0
}

func case01(a: Int32, b: Int32) {
    if (a > b) {
        return A()
    }
}

func case02(a: Int32, b: Int32): A {
    if (a > b) {
        return A()
    }
}

open class A {
    public open func foo() {
        return 10
    }
}

class B <: A {
    public override func foo() {
        return 20
    }
}
// ASSERT: scan sema_invalid_binary_expr
// ASSERT: scan sema_mismatched_types
