/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not MAC) EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// 被 @Annotation 修饰的 class 类型如果不具有至少一个 const init 构造函数将导致编译器报错。

@Annotation
public class A0 {
    public let id: Int64 = 0
}

@A0
class C0 {}

main() {}
// (not MAC) ASSERT: scan sema_annotation_no_const_init
// (not MAC) ASSERT: scan sema_expect_const
