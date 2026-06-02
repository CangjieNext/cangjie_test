/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum E1<T> {
    A(String)|B(String,T)
}

main() {
    var a1 = E1<Int64>.A("String")
    var a2 = E1<Int64>.B("String", 1)
    0
}
