/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f

enum MyEnum{
  MyEnum( var a: Float32)
}

enum MyEnum2{
  MyEnum2(let b: Float32)
}

func run(): Int64 {
  let time1 = MyEnum.MyEnum(3.0)
  return 0
}

main(): Int64 {
  return run()
}
// ASSERT: scan parse_expected_right_delimiter
// ASSERT: scan parse_expected_type
// ASSERT: scan parse_expected_decl
