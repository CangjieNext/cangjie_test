/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public interface I1 {}

public common class C {public init(){}}

common extend C <: I1 {
    public common prop p1: Int64 { get(){0} }
    public common func f1(): Int64 { 0 }
}
