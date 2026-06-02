/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

open class A {
    var var1: Int8 = -128
    var var2: Int16 = -1
    var var3: Int32 = -1
    var var4: Int64 = -1
    var var5: IntNative = 128
}

open class B <: A {
    var varu1: UInt8 = 127
    var varu2: UInt16 = 1
    var varu3: UInt32 = 1
    var varu4: UInt64 = 1
    var varu5: UIntNative = 128
}

open class C <: B {
    var varf1: Float16 = 0.001
    var varf2: Float32 = 0.001
    var varf3: Float32 = 65504.001
    var varf4: Float64 = 1.00
} 

main() {
    var a:A = A()
    var b:B = B()
    var c:C = C()
    var aa = 1
}
