/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_04_a10_01

  @Level:         1

  @Assertion:       5.3.4(10)
                    func f1(arr :Array <Int64 >){}
                    func f2(a:Int64 ,arr:Array <Int64 >){}
                    func f3(arr :Array <Int64 >,a:Int64 ){}
                    func f4(arr1 !:Array <Int64 >,a!:Int64 ,arr2 !:Array <Int64 >){}
                    func g(){
                        let li=[1,2,3]
                        f1(li)
                        f1(1,2,3)// using variable length argument
                        f1() // using variable length argument
                        f2(4,li)
                        f2(4,1,2,3)// using variable length argument
                        f3(1,2,3)// error, Array is not the last parameter
                        f4(arr1 :1,2,3,a:2,arr2 :1,2,3)// error, named parameters cannot use variable length argument
                    }

  @Description:   Positive examples from spec

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

func f1(arr :Array <Int64 >){}
func f2(a:Int64 ,arr:Array <Int64 >){}
func g(){
    let li=[1,2,3]
    f1(li)
    f1(1,2,3)// using variable length argument
    f1() // using variable length argument
    f2(4,li)
    f2(4,1,2,3)// using variable length argument
}

main() {
    Assert.isTrue(f1 is (Array <Int64 >) -> Unit)
    Assert.isTrue(f2 is (Int64, Array <Int64 >) -> Unit)
}
