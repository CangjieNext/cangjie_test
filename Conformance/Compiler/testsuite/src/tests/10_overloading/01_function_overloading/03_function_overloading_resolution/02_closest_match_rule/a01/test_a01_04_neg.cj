/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_03_02_a01_04_neg

  @Level:         1

  @Assertion:    10.1.3.2(1) There are multiple functions with the highest priority 
                 in the candidate set: {f_1, ..., f_n}. These functions are called
                 match items. If there is a unique match item f_m, which is more 
                 matched than all other matches, f_m is the most matched function.

 
  @Description:  Emit error due to  mismatched types in     Check(b,b:true)
                 Could not find candidate

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/



open class Base {   

}
class Sub <: Base {
}

class SubSub <: Base{
}


func Check(a:Base) :Int64 {
    return 1
}

func Check(a:Sub):Int64 {
    return 2
}
func Check(a:SubSub) :Int64 {
    return 3;
}

func Check(a:Sub,b!: Bool = false) :Int64 {
    return 4
}
func Check(a:SubSub,b!: Bool = false) :Int64 {
    return 5
}

main(ina :Array<String>) {
    var b : Base = Base()
    var s : Sub = Sub()
    var ss : SubSub = SubSub()
    Check(b)
    Check(s, b:true)
    Check(ss)
    Check(ss,b:true)
    Check(s,b:true)
    Check(b,b:true)
    0
}
