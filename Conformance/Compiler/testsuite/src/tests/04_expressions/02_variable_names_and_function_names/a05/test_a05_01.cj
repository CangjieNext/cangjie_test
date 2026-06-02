/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:      04_02_a05_01

  @Level:         1

  @Assertion: 4.2(5) For variable names, it is specified that variables 
              declared by var are always mutable and that variables 
              declared by let may only be assigned once (at or after its 
              declaration), before the assignment it is mutable and after the
              assignment it is immutable.
  @Description: Checks that variables declared by var are mutable.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

var i = Assert.getRuntimeZero()
var str: String = ""

class C {
    var Id = 12345
    var name: String
    static var address = "Novosibirsk"

    init() {
        Assert.equals(12345, Id)
        Assert.equals("Moscow", address)
        Assert.equals(14, i)
        Assert.equals("Goodbye", str)

        Id = 67890
        name = "C"
        address = "comeback"
        i = this.Id
        str = this.name

        Assert.equals(67890, Id)
        Assert.equals("C", name)
        Assert.equals("comeback", address)
        Assert.equals(67890, i)
        Assert.equals("C", str)

        Id = 500
        name = "D"
        address = "-"
        i = 501
        str = "E"

        Assert.equals(500, Id)
        Assert.equals("D", name)
        Assert.equals(501, i)
        Assert.equals("E", str)
        Assert.equals("-", address)
    }    

    func checkme() {
        Id = Assert.getRuntimeZero()
        name = "F"
        address = "no"
        i = Id + 1
        str = "checkme"

        Assert.equals(0, Id)
        Assert.equals("F", name)
        Assert.equals("no", address)
        Assert.equals(1, i)
        Assert.equals("checkme", str)
    }    
}

struct S {
    var Id: Int64
    static var name = "S"
    var address = "Moscow"

    init() {
        Assert.equals("Moscow", address)
        
        Id = 1
        name = "Struct"
        address = "London"        
        Assert.equals(1, Id)
        Assert.equals("Struct", name)
        Assert.equals("London", address)

        Id++
        name = "Struct1"
        address = "NewYork"
        Assert.equals(2, Id)
        Assert.equals("Struct1", name)
        Assert.equals("NewYork", address)
    }
}

main() {
    var f = 3.1428
    var b: Bool = true
    var ch: Rune

    Assert.equals(0, i)
    Assert.equals("", str)
    Assert.isTrue(b)

    i++
    str = "Hello"
    f = 12e3
    b = false
    ch = r'a'

    Assert.equals(1, i)
    Assert.equals("Hello", str)
    Assert.approxEquals(12e3, f)
    Assert.isFalse(b)
    Assert.equals(r'a', ch)

    i = Assert.getRuntimeZero() + 14
    str = "Goodbye"
    f = -.1
    b = true
    ch = r'b'

    Assert.equals(14, i)
    Assert.equals("Goodbye", str)
    Assert.approxEquals(-.1, f)
    Assert.isTrue(b)
    Assert.equals(r'b', ch)

    Assert.equals("Novosibirsk", C.address)
    C.address = "Moscow"
    Assert.equals("Moscow", C.address)

    var c = C()
    c.checkme()

    c.Id = -5
    c.name = "The end"
    Assert.equals(-5, c.Id)
    Assert.equals("The end", c.name)

    Assert.equals("S", S.name)
    S.name = "S1"
    Assert.equals("S1", S.name)

    var s: S = S()

    s.Id++
    S.name = "S2"
    s.address = "no"
    Assert.equals(3, s.Id)
    Assert.equals("S2", S.name)
    Assert.equals("no", s.address)
}
