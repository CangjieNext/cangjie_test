/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a23_03

  @Level:         1

  @Comment:      It is a header of a list of assetions which include current assertion: 
                 In addition to the preceding syntax definitions, local variables may be introduced 
                 in the following scenarios:

  @Assertion:    3.3.1(23) Pattern after case in the match expression. For details, see Pattern Matching Expressions.

  @Description:  Check that introduced with varBindingPattern local variable is not visible out of scope: 
                 after match expression.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

enum EatUnit { 
    | Breakfast
    | Lunch
    | Diner
} 


main() {
    let myEat = EatUnit.Diner 
    var eatTime: String = match (myEat) { 
        case Diner => "19:00"
        case Branch => "11:00"
    }

    Branch = EatUnit.Breakfast
}