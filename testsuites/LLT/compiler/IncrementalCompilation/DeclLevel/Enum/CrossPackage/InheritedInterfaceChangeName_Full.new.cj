package inc

public interface A<T> {}
public interface Az<T> {}
public enum E<T> <: Az<T> where T <: Any {
    A(UInt32)

    public static func foo(): Int64 { 1 }
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
