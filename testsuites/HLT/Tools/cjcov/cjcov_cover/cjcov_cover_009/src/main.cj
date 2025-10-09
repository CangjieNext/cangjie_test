/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

interface I1 {}

extend Int8 <: I1 {
    func f1() {}
}

main(): Int64 {
    var a = 5.f1()
    return 0
}
