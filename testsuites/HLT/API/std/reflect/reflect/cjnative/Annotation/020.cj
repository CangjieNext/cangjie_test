/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not MAC) EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// 对于拥有无参构造函数的注解类型，声明时可以省略括号。如果没有无参构造函数，则不可省略括号。

@Annotation
public class A0 {
    public let id: Int64
    public const init(id: Int64) {
        this.id = id
    }
}

@A0
class C0 {}

main() {}
// (not MAC) ASSERT: scan sema_wrong_number_of_arguments
