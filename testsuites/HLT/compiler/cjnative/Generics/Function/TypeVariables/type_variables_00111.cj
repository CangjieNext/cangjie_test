/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output



func g<var>(a:var){} 

main(){return 0}
// ASSERT: scan parse_expected_name
// ASSERT: scan parse_expected_right_delimiter
// ASSERT: scan parse_expected_type
// ASSERT: scan parse_expected_one_of_identifier_or_pattern
