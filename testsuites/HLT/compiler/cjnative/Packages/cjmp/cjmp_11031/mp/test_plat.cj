/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public interface I2 {}

public specific class C {}

specific extend C <: I1 {
    public specific prop p1: Int64 { get(){1} }
    public specific func f1(): Int64 { 1 }
}

extend C <: I2 {
    public prop p2: Int64 { get(){1} }
    public func f2(): Int64 { 1 }
}
