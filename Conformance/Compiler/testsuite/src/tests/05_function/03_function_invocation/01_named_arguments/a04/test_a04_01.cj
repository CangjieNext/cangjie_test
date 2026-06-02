/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_01_a04_01

  @Level:         1

  @Assertion:       5.3.1(4) When a function is invoked, all named parameters must be forwarded using named arguments. 
                    Otherwise, an error is reported.

  @Description:     Check that functions with unnamed and named parameters can be invoked with right order of 
                    parameter groups: unnamed, then named

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

class myClass {
    func f0(f: Int32, g!: Int32): String { 
        "${f + g}"
    } 

    func f1(x: Float32, y: Float32, z!: Bool): Float32 { 
        if(z) {
            return x
        }
        return y 
    } 

    func f2(a: Int32, b!: Int32, c!: Int32): Int32 { 
        a - b + c
    } 

}

struct myStruct {
    func f0(f: Int32, g!: Int32): String { 
        "${f} ${g}"
    } 

    func f1(x: Float32, y: Float32, z!: Bool): Float32 { 
        if(z) {
        return x + y
        }
        return y - x
    } 

    func f2(a: String, b!: String, c!: String): String { 
        if(a=="AAA") {
        return b
        }
        return c
    } 

}

enum myEnum {
    A | B 

    func f0(a: String, b: Rune, c!: Bool, d!: Int32): String {
        if(c){
        if(d < 0) {
            return "${a}"
        }
        return "${b}"
        }else{
        if(d > 0) {
            return "${a} ${b}"
        }
        return "${b} ${a}"
        }
    }
}

func add0(a: Int32, b!: Int32): Int32 { 
    a + b 
} 

func add1(a: Int32, b: Int32, c!: Int32): Int32 { 
    a + b + c
} 

func add2(a: Int32, b!: Int32, c!: Int32): Int32 { 
    a + b + c
} 

main() {
    Assert.equals(6, add0(2, b: 4))
    Assert.equals(14, add1(2, 5, c: 7))
    Assert.equals(14, add2(2, b: 5, c: 7))
    Assert.equals(14, add2(2, c: 5, b: 7))

    var x0: Float32 = 16.7
    var y0: Float32 = 7.03

    var myClassImpl = myClass()
    Assert.equals("8", myClassImpl.f0(3, g: 5))
    Assert.equals(x0, myClassImpl.f1(x0, y0, z: true))
    Assert.equals(y0, myClassImpl.f1(x0, y0, z: false))
    Assert.equals(23, myClassImpl.f2(6, b: 7, c: 24))
    Assert.equals(23, myClassImpl.f2(6, c: 24, b: 7))

    var myStructImpl = myStruct()
    Assert.equals("3 5", myStructImpl.f0(3, g: 5))
    Assert.equals(x0+y0, myStructImpl.f1(x0, y0, z: true))
    Assert.equals(y0-x0, myStructImpl.f1(x0, y0, z: false))
    Assert.equals("BBB", myStructImpl.f2("AAA", b: "BBB", c: "CCC"))
    Assert.equals("BBB", myStructImpl.f2("AAA", c: "CCC", b: "BBB"))
    Assert.equals("CCC", myStructImpl.f2("DDD", b: "BBB", c: "CCC"))
    Assert.equals("CCC", myStructImpl.f2("DDD", c: "CCC", b: "BBB"))

    Assert.equals("DDD", myEnum.A.f0("DDD", r'F', c: true, d: -1))
    Assert.equals("F DDD", myEnum.B.f0("DDD", r'F', c: false, d: -1))
    Assert.equals("DD2D g", myEnum.B.f0("DD2D", r'g', c: false, d: 1))
    Assert.equals("y", myEnum.A.f0("D$D%D", r'y', c: true, d: 1))
}
