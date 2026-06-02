/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_02_a05_02_neg

  @Level:         1

  @Assertion:   10.2(5)  The syntax for defining an operator function:
                operatorFunctionDefinition
                     : functionModifierList? 'operator' 'func'
                       overloadedOperators typeParameters?
                       functionParameters (':' type)?
                      (genericConstraints)? ('=' expression | block)?
                 
  @Description:  Syntax variations of operator func
                 Emit error:  'open' and 'private' modifiers conflict

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


    private open operator func + (Right:Int64):Int64 {
        var cur : Int64 = this.value + Right;
        return cur;
    }

    public open operator func + (Right:IRange):IRange {
        IRange(0,0,0)
    }

}


main(ina :Array<String>) {
    0
}