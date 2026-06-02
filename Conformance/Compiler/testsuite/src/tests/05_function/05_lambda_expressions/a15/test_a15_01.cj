/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_05_a15_01

  @Level:         1

  @Assertion:       5.5 (15) Lambda expressions can be invoked in place.

  @Description:     Check that ii is possible to invoke lambda expression in place.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

class myClass {
    let var0 = {a: Int64, b: Int64 => a + b}(2, 7)
    var var1 = { => 123 }() 
    let var2 = {n: Int32 , _: Rune => return n*n }(13, r'm')
    let var3: String = { _: Bool => return "Hello" } (true)

    public func checkLambda() {
        Assert.equals(9, this.var0)
        Assert.equals(9, {a: Int64, b: Int64 => a + b}(2, 7))
        Assert.equals(123, this.var1)
        Assert.equals(123, { => 123 }())
        Assert.equals(169, this.var2)
        Assert.equals(169, {n: Int32 , _: Rune => return n*n }(13, r'm'))
        Assert.equals("Hello", this.var3)
        Assert.equals("Hello", { _: Bool => return "Hello" } (true))
    }
}

struct myStruct {
    let var0 = {a: Int64, b: Int64 => a + b}(2, 7)
    var var1 = { => 123 }() 
    let var2 = {n: Int32 , _: Rune => return n*n }(13, r'm')
    let var3: String = { _: Bool => return "Hello" } (true)

    public func checkLambda() {
        Assert.equals(9, var0)
        Assert.equals(9, {a: Int64, b: Int64 => a + b}(2, 7))
        Assert.equals(123, var1)
        Assert.equals(123, { => 123 }())
        Assert.equals(169, var2)
        Assert.equals(169, {n: Int32 , _: Rune => return n*n }(13, r'm'))
        Assert.equals("Hello", var3)
        Assert.equals("Hello", { _: Bool => return "Hello" } (true))
    }
}

enum myEnum {
    H

    public func checkLambda() {
        let var0 = {a: Int64, b: Int64 => a + b}(2, 7)
        var var1 = { => 123 }() 
        let var2 = {n: Int32 , _: Rune => return n*n }(13, r'm')
        let var3: String = { _: Bool => return "Hello" } (true)
        
        Assert.equals(9, var0)
        Assert.equals(9, {a: Int64, b: Int64 => a + b}(2, 7))
        Assert.equals(123, var1)
        Assert.equals(123, { => 123 }())
        Assert.equals(169, var2)
        Assert.equals(169, {n: Int32 , _: Rune => return n*n }(13, r'm'))
        Assert.equals("Hello", var3)
        Assert.equals("Hello", { _: Bool => return "Hello" } (true))
    }
}

main() {
    let var0 = {a: Int64, b: Int64 => a + b}(2, 7)
    var var1 = { => 123 }() 
    let var2 = {n: Int32 , _: Rune => return n*n }(13, r'm')
    let var3: String = { _: Bool => return "Hello" } (true)

    Assert.equals(9, var0)
    Assert.equals(9, {a: Int64, b: Int64 => a + b}(2, 7))
    Assert.equals(123, var1)
    Assert.equals(123, { => 123 }())
    Assert.equals(169, var2)
    Assert.equals(169, {n: Int32 , _: Rune => return n*n }(13, r'm'))
    Assert.equals("Hello", var3)
    Assert.equals("Hello", { _: Bool => return "Hello" } (true))

    var myClassImpl = myClass()
    myClassImpl.checkLambda()

    var myStructImpl = myStruct()
    myStructImpl.checkLambda()

    myEnum.H.checkLambda()
}
