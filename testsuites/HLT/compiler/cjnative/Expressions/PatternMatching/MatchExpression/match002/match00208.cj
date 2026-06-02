/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output


func test(): Int64 {
match (Int32()) { 
case _ => "0"
}
return 0
}

main(): Int64 {
return test()
}
// ASSERT: scan parse_expected_expression
