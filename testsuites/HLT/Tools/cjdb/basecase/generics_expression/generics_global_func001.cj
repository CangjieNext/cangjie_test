/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func foo<T>(para: T) {
    var a: T = para
    a
}
main():Int64 {
    var x1:Int8 = 1
    var x2:Int16 = 2
    var x3:Int32 = 3
    var x4:Int64 = 4
    var x5:IntNative = 5
    var a1 = foo<Int8>(x1)
    var a2 = foo<Int16>(x2)
    var a3 = foo<Int32>(x3)
    var a4 = foo<Int64>(x4)
    var a5 = foo<IntNative>(x5)
    return 0
}
