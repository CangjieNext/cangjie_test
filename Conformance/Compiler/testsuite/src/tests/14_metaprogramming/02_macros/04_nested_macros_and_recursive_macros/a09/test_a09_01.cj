/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_04_a09_01

  @Level:         1

  @Assertion:    14.2.4(9)
                    public macro Inner(input: Tokens): Tokens { 
                        assertParentContext("Outer") 
                        setItem("key1", "value1") 
                        setItem("key2", "value2") 
                        // ... 
                    } 
                    public macro Outer(input: Tokens): Tokens {
                        let messages = getChildMessages("Inner") 
                        for (m in messages) { 
                            let value1 = m.getString("key1") 
                            let value2 = m.getString("key2") 
                            // ...
                        } 
                    }

  @Description:  Check example

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_macros_01.cj

  @Issue:        0006253

*/

import aux_macros_01.*

main(): Unit {
    let t = @Outer @Inner(0)
}
