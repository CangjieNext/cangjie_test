/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      10_02_04_a12_22

  @Level:         1

  @Assertion: 10.2.4(12)
              In particular, Numeric type, Bool, Unit, Nothing, Rune, String, Range, Function, Enum, Tuple type do not
              support the overloaded index operator assignment form. 

  @Description: Check that Function type also can not support the overloaded index operator get form, because
                function type extending is not allowed. There is no another way to define overloaded index operator for
                a function type.

  @Mode: compileonly

  @Negative: yes

*/

type F = (Int64) -> Int64

// Function type extension is not allowed.
extend F {
    operator func[](index: Int64) {
        42
    }
}

main() {}


