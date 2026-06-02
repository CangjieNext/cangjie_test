/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

specific enum A {
    | ELEMENT
    specific func foo(): Unit {}
}

specific enum B {
    | X1 | X2(Int64)
    specific func foo(): Unit {}
}

specific enum C {
    | X3 | X4(Int64) |...
    specific func foo(): Unit {}
}