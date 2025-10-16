import std.regex.*

main(): Int64 {
  let REGEX_PATTER: Regex = Regex("^\\+?972(\\-)?0?[23489]{1}(\\-)?[^0\\D]{1}\\d{6}$")
  REGEX_PATTER.matcher("").fullMatch()
  0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
