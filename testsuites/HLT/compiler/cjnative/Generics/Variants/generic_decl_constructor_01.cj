/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

//catelog:# 泛型## 类型型变### 定义--1
func foo<>(){return 1} 
main(): Int64 {
    if (foo<>() != 1 ) {
        return 1
    }
    return 0
}
// ASSERT: scan parse_expected_name
// ASSERT: scan parse_expected_type_argument
