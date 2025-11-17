/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func foo<T>(para: T, para2: Int64) {
    var a: T = para
    var b = para2
    return a
}

main():Int64 {
    var r1 = foo(6,1)
    var r2 = foo('6',1)
    var r3 = foo<Bool>(true,3)
    return 0
}
