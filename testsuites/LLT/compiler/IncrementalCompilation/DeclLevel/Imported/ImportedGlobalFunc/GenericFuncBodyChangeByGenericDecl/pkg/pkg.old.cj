package pkg
@Frozen
func foo<T>(): Int64 { 0 }
@Frozen
public func bar<T>(): Int64 { foo<T>() }


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
