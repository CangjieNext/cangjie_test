/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output



let scoreTuple = ("Allen", 90)
var scoreResult: String = match (scoreTuple) {
  case ("Allen" | "helun", 90 | 10) | ("Bob", 90 | 30) => "Allen got 90"
  case (_, _) => ""
}

main() : Int64 {
  return 1
}
// ASSERT: scan parse_illegal_or_pattern
