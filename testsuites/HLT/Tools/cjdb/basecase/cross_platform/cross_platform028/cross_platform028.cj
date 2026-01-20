/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import mp.*

main(): Int64 {
    var x1 = A<Int64>(1)
    var x2 = x1.f1<Int64>(2)
    var x3 = A<Bool>.f2(true)
    0
}
