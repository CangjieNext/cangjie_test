/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: test_timeout_expired

  @Assertion: forever loop raises a timeout expired exception

  @Description: forever loop with little @TimeoutFactor
  
  @ExpectTimeout

  @TimeoutFactor: 0.02
*/

package test_runtime_error

main() {
  while (true) { }
  return
}