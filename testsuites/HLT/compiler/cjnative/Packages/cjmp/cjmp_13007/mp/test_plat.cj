/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public platform abstract class C1 {
    public platform func f1(): Int64 { 0 }
    public platform prop p1: Int64 { get(){0} }
}

public class C3 <: C1 {
    public func f1(): Int64 { 1 }
    public prop p1: Int64 { get(){1} }
}
