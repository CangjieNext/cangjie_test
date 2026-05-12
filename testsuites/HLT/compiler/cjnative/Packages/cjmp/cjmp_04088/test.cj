/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f %compile_chir_opt -o ./
// ASSERT: scan sema_cannot_override

public common abstract class A {
    public init(){}
    public common func f(): Int64
}
public class C <: A {
    public func f(): Int64 { 0 }
}


