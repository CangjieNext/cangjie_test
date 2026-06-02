/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a07_02_power_2

  @Level:         1

  @Assertion:    1.4(7) ** Power

  @Description:  Check lexical ability of power (**). f64 = f64 ** i64

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:


*/


import utils.assert.Assert

type BaseType = Float64
type PowerType =Int64

let ct0   :  PowerType  =  0i64
let ct1   :  PowerType  =  1i64
var RTZero : PowerType  =  ct1;
var RTBaseZero : BaseType = 0.1

main(ina :Array<String>) {
    let z : Bool = Assert.getRuntimeZero(ina) == 0
    if (z) {RTZero = ct0; RTBaseZero=0.0;}

    var ctp : PowerType = ct0;
    var rtp : PowerType = Int64(RTZero);
    let cbase : BaseType = 2.0
    Assert.equals(cbase**ctp, cbase ** rtp)
    Assert.equals(cbase ** rtp, 1.0)

    var rbase:BaseType = cbase +  RTBaseZero;

    Assert.equals(rbase**ctp, rbase ** rtp)
    Assert.equals(rbase ** rtp, 1.0)
    rtp++;ctp++
    Assert.equals(rbase**ctp, rbase ** rtp)
    Assert.equals(rbase ** rtp, rbase)
    rtp+=2
    Assert.equals(rbase ** rtp, rbase * rbase * rbase)

    0
}
 

