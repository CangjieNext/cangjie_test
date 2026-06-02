/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_01_a06_01

  @Level:         1

  @Assertion:       5.3.1(6) Named arguments free you from matching the order of parameters in the parameter lists of 
                    called functions.  

  @Description:     Check that function with named parameters can be invoked with binded by names parameters.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

class myClass {
    func f0(z!: Int32, x!: Int32): String { 
        "${z - x}"
    } 

    func f1(x!: String, y!: String, z!: Bool): String { 
        if(z) {
            return x
        }
        return y 
    } 

}

struct myStruct {
    func f0(k!: Int32, l!: Int32): String { 
    "${l}${k} "
    } 

    func f1(x!: Float32, y!: Float32, z!: Bool): Float32 { 
        if(z) {
            return x + y
        }
        return y - x
    } 

}

enum myEnum {
    A | B 

    func f0(a!: String, b!: Rune, c!: Bool, d!: Int32): String {
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

func add0(a!: Int32, b!: Int32): Int32 { 
    a + b 
} 

func add1(a!: Int32, b!: Int32, c!: Int32): Int32 { 
    a + b + c
} 

main() {
    Assert.equals(6, add0(a: 5, b: 1))
    Assert.equals(11, add0(b: 5, a: 6))

    Assert.equals(12, add1(a: 5, b: 1, c: 6))
    Assert.equals(21, add1(b: 5, c: 10, a: 6))
    Assert.equals(3, add1(c: 7, b: -10, a: 6))
    Assert.equals(-91, add1(c: 7, a: -100, b: 2))
    Assert.equals(8, add1(a: 20, c: -10, b: -2))
    Assert.equals(11, add1(b: 5, a: 0, c: 6))

    var myClassImpl = myClass()
    Assert.equals("4", myClassImpl.f0(z: 5, x: 1))
    Assert.equals("4", myClassImpl.f0(x: 1, z: 5))
    Assert.equals("AAA", myClassImpl.f1(x: "AAA", y: "C", z: true))
    Assert.equals("AAA", myClassImpl.f1(y: "C", z: true, x: "AAA"))
    Assert.equals("AAA", myClassImpl.f1(z: true, y: "C", x: "AAA"))
    Assert.equals("AAA", myClassImpl.f1(z: true, x: "AAA", y: "C"))
    Assert.equals("AAA", myClassImpl.f1(x: "AAA", z: true, y: "C"))
    Assert.equals("AAA", myClassImpl.f1(y: "C", x: "AAA", z: true))

    var x0: Float32 = 16.7
    var y0: Float32 = 7.03
    var sum = x0+y0
    var myStructImpl = myStruct()
    Assert.equals("15 ", myStructImpl.f0(k: 5, l: 1))
    Assert.equals("15 ", myStructImpl.f0(l: 1, k: 5))

    Assert.equals(sum, myStructImpl.f1(x: x0, y: y0, z: true))
    Assert.equals(sum, myStructImpl.f1(y: y0, z: true, x: x0))
    Assert.equals(sum, myStructImpl.f1(z: true, y: y0, x: x0))
    Assert.equals(sum, myStructImpl.f1(z: true, x: x0, y: y0))
    Assert.equals(sum, myStructImpl.f1(x: x0, z: true, y: y0))
    Assert.equals(sum, myStructImpl.f1(y: y0, x: x0, z: true))

    Assert.equals("c", myEnum.B.f0(a: "", b: r'c', c: true, d: 32))
    Assert.equals("c", myEnum.B.f0(a: "", b: r'c', d: 32, c: true))
    Assert.equals("c", myEnum.B.f0(a: "", c: true, b: r'c', d: 32))
    Assert.equals("c", myEnum.B.f0(a: "", c: true, d: 32, b: r'c'))
    Assert.equals("c", myEnum.B.f0(a: "", d: 32, c: true, b: r'c'))
    Assert.equals("c", myEnum.B.f0(a: "", d: 32, b: r'c', c: true))
}
