/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum _1<T>{
    Day(T)
}

enum 中文<T>{
    AA(T) | 仓颉(T)
}


main(): Int64 {
    var t1 = _1<Int64>.Day(3)
    var t2 = 中文<Int64>.AA(1)
    var t3 = 中文<Bool>.仓颉(true)
    0
}
