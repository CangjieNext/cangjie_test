/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package mp

public specific func f1(): Int64 { 0 }
@Deprecated public specific func f2(): Int64 { 0 }
public func test_plat() { f1() + f2() }


