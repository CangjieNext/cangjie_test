/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Description:     Defines a package a.b for example.

  @Structure:       complex-aux
*/

package a.b

public interface I1 {
    func test1(){
        return 1
    }
}
private interface I2 {
    func test2(){
        return 2
    }
}
protected interface I3 {
    func test3(){
        return 3
    }
}
internal interface I4 {
    func test4(){
        return 4
    }
}
public interface I5 {
    func test5(){
        return 5
    }
}

public interface I11 {}
protected interface I12 {}
protected interface I13 {}
extend Int64 <: I11 & I12 & I13 {}

public class MyClass<T> {}

extend<T> MyClass<T> <: I1 & I2 & I3 & I4 & I5 where T <: I11 & I12 & I13 {
    public func myExtendFunc() {
        "MyClass myExtendFunc()"
    }
}