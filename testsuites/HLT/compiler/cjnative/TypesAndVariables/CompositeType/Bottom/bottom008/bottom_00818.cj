/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

func test():Int64 = match (true) {
case _ => return 1
case _ => true
}

func test():Int64 { 
match (true) {
case _ => return 1
case _ => true
}
}

main(): Int64 {
return test() - 1
}
// ASSERT: scan parse_missing_body
// ASSERT: scan parse_expected_character
