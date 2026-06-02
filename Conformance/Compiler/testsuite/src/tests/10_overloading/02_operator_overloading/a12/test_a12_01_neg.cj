/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_02_a12_01_neg

  @Level:         1

  @Assertion:   10.2(12)  Operator functions can not be generic.

                 
  @Description:  Emit error:   generic is not allowed in operator overload function

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:


*/


class IRange {
    var lower : Int64;
    var upper : Int64;

    init() {
    }


    private operator func + <T> (Right:T):T where T <: Countable<T>{
        return Right;
    }

}


main(ina :Array<String>) {
    0
}