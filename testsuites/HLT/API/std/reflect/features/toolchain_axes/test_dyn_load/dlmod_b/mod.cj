/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


package aa.bb.cc.dd.test

public var int8: Int8 = 1
public var uint8: UInt8 = 2

// 非 public 包级成员（1008 缺口 C-G1 可见性甄别，G4 实测定谳）：
// public 面集合计数保持 2|2|0（过滤钉死）；非 public 成员元数据
// 整体缺席——variables 枚举也不出现（"仅经枚举可达"系设计推断，
// G4 TC 实测枚举未命中，探针时 fixture 尚无 pkgVar 无从证伪）
var pkgVar: Int64 = 42

func pkgFunc(): Unit {}

public class C0 {
    public init() {}
}

public interface I0 {}
