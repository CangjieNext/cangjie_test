/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: test_runtime_error

  @Assertion: throw Exception is runtime error

  @Description: only throw ArithmeticException()
  
  @Mode: run

  @Negative: no

  @Structure: single

  @Comment:
*/

package test_runtime_error

main(): Int64 {
  throw ArithmeticException()
  return 0
}
