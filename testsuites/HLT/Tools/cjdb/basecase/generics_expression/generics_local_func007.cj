/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class A<T> { }
class B<K1,K2> { }
struct C<T> { }
struct D<T,R> { }

main():Int64 {
    var aa = A<UInt16>()
    var bb = B<UInt16,Int32>()
    var cc = C<UInt16>()
    var dd = D<Float64, Bool>()
    return 0
}
