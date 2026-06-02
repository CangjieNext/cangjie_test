/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_a01_039

  @Level:         1

  @Assertion: 4(1): An expression can consist of one or more operands, acted on
              by zero or more operators.
  @Description: Checks that question mark expression shouild have right operand.
  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single

*/

public class TestA01039 {  
    public let name: String = "C"
}

let c1 = Some(TestA01039())

main() { 
    c1?
    return
}
