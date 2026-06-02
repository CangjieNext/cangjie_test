/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_02_a01_01

  @Level:         1

  @Assertion:    1.2(1) There are two symbols that can indicate the end of an expression or declaration:
                        a semicolon (;) or a newline character.

  @Description:  Check if the semicolon is used as separator for different cases.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert ;

func myCheckFunc(x: Int64, v: Int64){
    var retVal = v
    if (x > 0) {
        retVal = 1
    } else {
        retVal = -1
    };
    return retVal
}
main() {
    // test case #1
    let intNum: Int64 = 100 ; Assert.equals(100, intNum)
    
    // test case #2
    var p : Int64 = 0 ;
    var s : String = "" ;
    func foo1(p1: Int64, p2: Int64) {
        p = p1 + p2;
    }; 
    func foo2(s1: String, s2: String) {
        s = s1 + s2
    };
    foo1(1, 2);
    foo2("1", "2");
    Assert.equals(3, p);
    Assert.equals("12", s);
    
    // test case #3
    var sum : Int64 = 0;
    func add(p1: Int64, p2: Int64) {
        return (p1 + p2)
    };
    sum = add(10, 20);
    Assert.equals(30, sum) ;
    
    // test case #4
    var x = 1;
    var v = 0;
    v = myCheckFunc(x, v)
    Assert.equals(1, v);
    x = -1;
    v = myCheckFunc(x, v)
    Assert.equals(-1, v);
    
    // test case #5
    var score: Int64 = 90 ;
    var res: String = match (score) {
        case 0 => "zero" ;
        case 10 => "fail" ;
        case 20 => "pass" ;
        case 30 => "good" ;
        case 90 => "excellent" ;
        case _ => "not a valid score" ; } ;
    Assert.equals("excellent", res);
    
    // test case #6
    score = 20 ;
    res = match (score) {
        case 20 => "pass" ;
        case _ => "not a valid score" ; } ;
    score = 0 ;
    res = match (score) {
        case 0 => "zero" ;
        case _ => "not a valid score" ; } ;
    Assert.equals("zero", res);
}
