/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_02_a05_03

  @Level:         1

  @Assertion:   10.2(5)  The syntax for defining an operator function:
                operatorFunctionDefinition
                     : functionModifierList? 'operator' 'func'
                       overloadedOperators typeParameters?
                       functionParameters (':' type)?
                      (genericConstraints)? ('=' expression | block)?
                 
  @Description:  Syntax variations of operator func
                 Emit error:   generic is not allowed in operator overload function

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:


*/


class IRange {
    var lower : Int64;
    var upper : Int64;
    var value : Int64;

    init(l: Int64, u:Int64, v:Int64) {
        this.lower = l
        this.upper = u
        this.value = v
    }


    private operator func + <T> (Right:T):T where T <: Countable<T>{
        return Right;
    }

}


main(ina :Array<String>) {
    0
}