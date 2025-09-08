internal import std.math.*
internal import std.collection.*


foreign func cast(f: CFunc<(CPointer<Int8>) -> CPointer<Unit>>): CPointer<Unit>

foreign func hello(f: CPointer<Int8>):  CPointer<Unit>   


main(): Int64 {
    unsafe {cast(hello)}
    return 0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
