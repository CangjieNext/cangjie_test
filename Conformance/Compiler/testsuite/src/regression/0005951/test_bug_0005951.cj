/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/home/iarkh/cangjie/test_suite/src/regression/0005891/*
  @Name:         bug_0005951

  @Assertion:    0005951: Type alias for integer do not inherit conversion.

  @Description:  Check lexical ability of power (**). i64 ** u64

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

  @Comment:

*/

type BaseType = Int64
type PowerType = UInt64

let ct0   :  PowerType  =  0u64
let ct1   :  PowerType  =  1u64
var RTZero : PowerType  =  ct1;

main(ina :Array<String>) {
    var ctp : BaseType = Int64(ct0);
    var res : BaseType = BaseType(RTZero);  // emit error here
    0
}
 

