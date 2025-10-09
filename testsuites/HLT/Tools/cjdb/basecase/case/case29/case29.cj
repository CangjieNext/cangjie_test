/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum E1 {
    A | B(E2)
}
enum E2 {
    C(E1) | D(E1)
}

main() {
    var b = E1.B(E2.C(A))
    return 0
}
