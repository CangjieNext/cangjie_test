/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum A {
    | X | Y | ...

    operator func +(inputB: A): Bool {
        return true
    }
}

main(): Int64 {
    let a = A.X + A.Y
    return 1
}
