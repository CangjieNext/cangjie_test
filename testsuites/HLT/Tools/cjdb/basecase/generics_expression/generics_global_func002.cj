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
    var x1:UInt8 = 1
    var x2:UInt16 = 2
    var x3:UInt32 = 3
    var x4:UInt64 = 4
    var x5:UIntNative = 5
    var a1 = foo<UInt8>(x1)
    var a2 = foo<UInt16>(x2)
    var a3 = foo<UInt32>(x3)
    var a4 = foo<UInt64>(x4)
    var a5 = foo<UIntNative>(x5)
    return 0
}
