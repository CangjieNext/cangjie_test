@C
struct SA {}

struct SB {}
@C 
struct SC<T> {}
 
struct SD {}

struct SE {}
@C
struct SF {
    let a: CPointer<Int8> = CPointer<Int8>()
}

struct SG {

}
@C foreign
let a: Int32 = 1
@C
class CA {}
@C
class CB<T> {}
@C
interface IA<A> {}
@C
enum EA {
    R|K(Int32)
}

extend EA <: IA<Int32> {}

main(): Unit {}
foreign
var b: Int64 = 1

foreign func putchar(ch: Int32): Int32

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
