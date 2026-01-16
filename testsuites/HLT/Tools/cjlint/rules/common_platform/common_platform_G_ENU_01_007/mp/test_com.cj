/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

common enum A {
    | ELEMENT
    common func foo(): Unit
}

common enum B {
    | X1 | X2(Int64)
    common func foo(): Unit
}

common enum C {
    | X1 | X2(Int64) |...
    common func foo(): Unit
}

