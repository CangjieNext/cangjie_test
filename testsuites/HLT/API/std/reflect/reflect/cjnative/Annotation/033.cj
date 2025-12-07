/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not MAC) EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// 检查注解定义的语法。

public class Version {
    public const init() {}
}

@Version
class Foo {}

main() {}
// (not MAC) ASSERT: scan sema_no_match_constructor
