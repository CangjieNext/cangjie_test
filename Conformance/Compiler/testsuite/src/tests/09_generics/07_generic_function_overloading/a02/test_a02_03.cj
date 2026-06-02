/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_07_a02_03

  @Level:         1

  @Assertion: 9.7(2) When a function is called, the overloading process is as follows:

              Step 1: Construct a candidate set for function calling. The functions that enter the candidate set are
              all functions that can be called.  For details, see Candidate Set. There are extra rules for generic
              functions when constructing a candidate set, which will be described in detail below.

              Step 2: If there are multiple functions in the candidate sets, select the most matching function based
              on the scope priority rules (For details, see Scope Priority) and most matching rule (For details, see
              Closest match rule). If the unique best matching function cannot be determined, an error indicating that
              the resolution cannot be resolved is reported.

              Step 3: If there are multiple types for an argument, determine the argument type based on the most
              matching function.

  @Description: Check that if the unique best matching function cannot be determined, an error indicating that the
                resolution cannot be resolved is reported.

  @Mode: compileonly

  @Negative: yes

*/

func foo<T>(x: T, y: Int64) {
    return 1
}

func foo<T>(x: Int64, y: T) {
    return 2
}

main() {
    // Ambiguous.
    return foo<Int64>(42, 42)
}

