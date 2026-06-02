/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f




open  abstract class Parent { 
public var field : Int32 = 1
}

class Child <: Parent {}

main(): Int64 {
var child : Child = Child()
if (child.field != 1) {
return 1
}
return 0
// ASSERT: scan parse_redundant_modifier
// ASSERT: scan parse_expected_right_delimiter
