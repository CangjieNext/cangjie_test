func foo<T>(a: Int32): Int64 where T <: Any
{
    Int64(a)
}
main(): Int64 { foo<Int32>(0) }

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
