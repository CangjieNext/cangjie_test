/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not MAC) EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// 拥有 open 语义的 class 类型不允许被宏 @Annotation 修饰。

import std.reflect.*
import MyType.myType.*
@Annotation
public open class A0 {
    public let id: Int64 = 0
    public const init() {}
}

@A0
class C0 {}

main() {
  return 0
}
// (not MAC) ASSERT: scan parse_unexpected_anno_on
