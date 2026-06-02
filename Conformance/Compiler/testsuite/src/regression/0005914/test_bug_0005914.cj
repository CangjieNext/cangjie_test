/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        bug_0005914

  @Assertion: Issue 0005914: For the array declarations the lambda expression
                 doesn't work correctly for Int32 & Float64 types.
  
    The following test is not compiled when <T> for array declaration is Int32 
    or Float64:

    main() {
      let arr4 = Array<Int32>(3) { i => i + 2 }
    }

    error: mismatched types
      ==> /home/vgorr/test_suite/src/tests/01_lexical_structure/02_semicolons_and_newline_characters/a10/test_a10_01.cj:64:35:
       |
    64 | let arr4 = Array<Int32>(3) { i => i + 2 }
       | ^^^^^ expected 'Int32', found 'Int64'
       |

    1 error generated, 1 error printed.

    Rejected by Huawei 12.05:
    For the instantiated Array<Int32>, the initial lambda type is 
    expected to be (Int64)->Int32, the i type is fixed to Int64, 
    and the i+2 type is Int64. No problem with the error.

  @Description: Checks that exception is thrown as the bug was rejected by Huawei.

  @Mode:        compileonly

  @Negative:    Yes

  @Issue:       0005914

*/

main() {
    let arr = Array<Int32>(3) { i => i + 2 }
}
