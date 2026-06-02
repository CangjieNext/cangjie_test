/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_05_a07_03

  @Level:         1

  @Assertion:       5.5(7) If the specified return type is Unit, the Cangjie compiler will also insert return () 
                    (in the lambda body) properly at all possible places where the lambda could return so that its 
                    return type will always be Unit.

  @Description:     Check that if lambda return type specified as Unit and exist at least one return expression with
                    not Unit value type - an error will be raised: top-level variable.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

var f0: (Int64, Int64) -> Unit = {a: Int64, b: Int64 => 
    if(a > b) {
        return a - b
    }
    b - a
}

main() {
}
