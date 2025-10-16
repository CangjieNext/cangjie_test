package p

public class A<T> {
    private let c: Int32 = 3
    protected let d: UInt64 = 1
}

public interface IB<T> {
    func foo(): Int64 
    prop k: Int32 {
        get() { 0 }
    }
}
@Frozen
func foo<T>(): Int64 { 1 }
@Frozen
public func bar<T>(): Int64 { foo<T>() }

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
