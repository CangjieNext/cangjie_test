
struct SA {}
@C
struct SB {}

struct SC<T> {}

struct SD {}
@C 
struct SE {}

struct SF {
    let a: CPointer<Int8> = CPointer<Int8>()
}

struct SG {

}

let a: Int32 = 1

class CA {}

class CB<T> {}

interface IA<A> {}

enum EA {
    R|K(Int32)
}

extend EA <: IA<Int32> {}

main(): Unit {}

var b: Int64 = 1

foreign func putchar(ch: Int32): Int32

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
