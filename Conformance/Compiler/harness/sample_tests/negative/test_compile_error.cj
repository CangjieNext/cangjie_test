/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: test_compile_error

  @Assertion: Return invalid variable is compile error

  @Description: Only return invalid variable
  
  @Mode: compileonly

  @Negative: 

  @Structure: single
*/

package test_compile_error

main() {
  return a
} 