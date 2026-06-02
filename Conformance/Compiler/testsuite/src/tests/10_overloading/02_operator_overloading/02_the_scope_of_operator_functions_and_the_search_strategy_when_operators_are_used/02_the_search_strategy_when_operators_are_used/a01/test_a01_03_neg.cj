 /*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        10_02_02_02_a01_03

  @Level:         1

  @Assertion:   10.2.2.2(1)
                With the above definition for the scope of operator functions, 
                the search strategy when operators are used can be defined. Since the search
                for a unary operator function is a subcase of the search for a binary operator,
                so only the search strategy for binary operators (denoted as op) are introduced
                (the search for unary operators follows the same strategy):
                Step 1: determine the type of the left operand lOperand and the type of the right
                         operand rOperand (assuming to be lType and rType respectively);
                Step 2: Search for all operator functions associated with lType with the name
                        op and the right operand type rType in the current scope of the calling
                        expression lOperand op rOperand. If there is one and only one such operator
                        function, convert the expression call to a call to this operator function;
                        if no such function is found, continue with step 3.
                Step 3: repeat step 2 in a lower scope. If no matching operator function is found 
                        in the lowest scope level (i.e., 0), terminate the search action and generates
                        a compilation error ( undefined function error);

  @Description:  Emit error as it is used  undeclared  () operator  in interface                 

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

let i8 : Int8    = -8i8     
let i16: Int16   = -16i16   
let i32: Int32   = -32i32   

interface IF {
    operator func ()(arg: Int8) : Unit {
    }
    operator func ()(arg: Int16) : Unit {
    }

}

class AuxTestA2202 <: IF {

}


main(ina :Array<String>) {
    var klass : AuxTestA2202 = AuxTestA2202();
    klass(i8)
    klass(i16)
    klass(i32)
    0
}

