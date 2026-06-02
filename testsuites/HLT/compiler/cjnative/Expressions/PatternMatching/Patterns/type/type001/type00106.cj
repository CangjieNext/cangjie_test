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
var i : Int32 = 0
var res = match (i) {
case 1 : Int32 => 1 
case _ => 0
}
if (res != 0) {
return 1
}
return 0
}

main(): Int64 {
return test()
}
// ASSERT: scan parse_expected_double_arrow_in_case
