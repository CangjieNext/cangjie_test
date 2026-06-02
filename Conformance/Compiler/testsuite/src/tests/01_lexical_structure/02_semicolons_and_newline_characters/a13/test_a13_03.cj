/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_02_a13_03

  @Level:         1

  @Assertion:    1.2(13) For String literals and multi-line comments,
                         the principle of "maximal matching" is also not applicable.

  @Description:  Both multi-line comments are terminated correctly. Second comment is nested.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

main() {
    /*
    first
    comment
    
    /*
    second
    comment
    */
    
    */
}