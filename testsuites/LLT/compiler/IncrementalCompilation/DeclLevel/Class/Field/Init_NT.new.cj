class A<T> {
    let a: (Int32, Int64) = (3,12)
    let b: ?T = Option<T>.None
    let c: (T) -> Int64 = { _ => 1 }
    public static var 
    d: Array<Int32> = [3,4,8,-1]
}

struct B<T> {
    let a: (Int32) = 3
}

main(): Unit {}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
