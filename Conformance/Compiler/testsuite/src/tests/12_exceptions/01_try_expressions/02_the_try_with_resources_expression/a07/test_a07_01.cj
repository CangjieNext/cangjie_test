/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_02_a07_01

  @Level:         1

  @Assertion:    12.1.2(7) The type of ResourceSpecifications in try-with-resources expression must implement
                           Resource interface:
                           interface Resource { 
                               func isClosed(): Bool 
                               func close(): Unit 
                           } 


  @Description:  Checks that the resource specification in the try_with_resource expression
                 has to implement the Resource interface.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

main() {
    let e = try (r = Exception()) {}
}
