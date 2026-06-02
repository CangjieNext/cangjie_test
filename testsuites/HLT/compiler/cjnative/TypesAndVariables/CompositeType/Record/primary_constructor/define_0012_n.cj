/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f




struct Data {
  public var a: Int32 = 1
  public var b: Int32 = 2
  public Data ([]~!#@!@#$@$&%%*^*&^*(&*()*_)() {}
}

func run(): Int64 {
  var value : Data = Data();
  if ((value.a == 3) &&  (value.b == 4)) {
    return 0
  }
  else {
    return 1
  }
}

main(): Int64 {
  return run()
}
// ASSERT: scan lex_expected_quote_in_raw_string
// ASSERT: scan lex_unknown_start_of_token
