package inc

public interface A<T> {}
extend Int32 <: A<Int32> {}
public enum E<T> <: A<T> where T <: A<Int32> {
    | A(UInt32)
    | F(UInt32)
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
