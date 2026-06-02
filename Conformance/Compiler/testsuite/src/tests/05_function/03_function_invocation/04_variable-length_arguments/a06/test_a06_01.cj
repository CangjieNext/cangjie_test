/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_04_a06_01

  @Level:         1

  @Assertion:       5.3.4(6) 4.Variable-length arguments are available for calls to global functions, static member 
                    functions, instance member functions, local functions, constructors, function variables, lambda, 
                    function call operator overloads, and indexing operator overloads.

  @Description:     Check that global functions, static member functions, instance member functions, local functions, 
                    constructors, function variables, lambda, function call operator overloads, and indexing operator 
                    overloads are available for syntax sugar usage.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

interface myInterface {
    static func f0(a: Int64, arr: Array <Int64>): Int64 { return a + arr.size}
}

class myClass {
    private var myArr: Array<Int64> = []
    static func f0(a: Int64, arr: Array <Int64>): Int64 { return a + arr.size}
    func f1(a: Rune, arr: Array <Rune>): String { 
        if(arr.size == 0) {
            return "${a} + 0" 
        }
        return "${a} + ${arr[arr.size-1]} + ${this.myArr[this.myArr.size-1]}" 
    }
    myClass(arr: Array <Int64>) {
        this.myArr = arr
    }
    public func myFunc(arr: Array <Int64>) {
        let myLambda0: (Array <Int64>)->Int64 = {a: Array <Int64> => a.size} 
        return "${myLambda0(arr)}" 
    }

    operator func [](a: Rune, arg: Array<Int64>): Int64 {
        return arg.size
    }
}

struct myStruct {
    private var myArr: Array<Int64> = []
    static func f0(a: Int64, arr: Array <Int64>): Int64 { return a + arr.size}
    func f1(a: Rune, arr: Array <Rune>): String { 
        if(arr.size == 0) {
            return "${a} + 0" 
        }
        return "${a} + ${arr[arr.size-1]} + ${this.myArr[this.myArr.size-1]}" 
    }
    myStruct(arr: Array <Int64>) {
        this.myArr = arr
    }
    public func myFunc(arr: Array <Int64>) {
        let myLambda0: (Array <Int64>)->Int64 = {a: Array <Int64> => a.size} 
        return "${myLambda0(arr)}" 
    }
}

enum myEnum {

    S

    static func f0(a: Int64, arr: Array <Int64>): Int64 { return a + arr.size}
    func f1(a: Rune, arr: Array <Rune>): String { 
        if(arr.size == 0) {
            return "${a} + 0" 
        }
        return "${a} + ${arr[arr.size-1]}" 
    }
    public func myFunc(arr: Array <Int64>) {
        let myLambda0: (Array <Int64>)->Int64 = {a: Array <Int64> => a.size} 
        return "${myLambda0(arr)}" 
    }
    operator func()(arr: Array<Int64>){arr.size}
}

func f0(arr: Array<Int64>): Int64 { return arr.size }
let myLambda0: (Array <Int64>)->Int64 = {a: Array <Int64> => a.size} 

main() {
    Assert.equals(2, f0([1, 3]))
    Assert.equals(2, f0(1, 3))

    Assert.equals(2, myLambda0([1, 3]))
    Assert.equals(2, myLambda0(1, 3))

    Assert.equals(7, myInterface.f0(4, [1, 22, 5]))
    Assert.equals(7, myInterface.f0(4, 1, 22, 5))

    Assert.equals(6, myStruct.f0(4, [1, 22]))
    Assert.equals(6, myStruct.f0(4, 1, 22))
    Assert.equals(7, myClass.f0(4, [1, 22, 5]))
    Assert.equals(7, myClass.f0(4, 1, 22, 5))

    var myClassImpl0 = myClass([1, 22])
    var myClassImpl1 = myClass(1, 22, 55)

    Assert.equals(3, myClassImpl0[r'C', [1, 6, 22]])
    Assert.equals(3, myClassImpl0[r'C', 1, 6, 22])

    Assert.equals("R + a + 22", myClassImpl0.f1(r'R', [r't', r'E', r'a']))
    Assert.equals("R + a + 22", myClassImpl0.f1(r'R', r't', r'E', r'a'))
    Assert.equals("R + a + 55", myClassImpl1.f1(r'R', [r't', r'E', r'a']))
    Assert.equals("R + a + 55", myClassImpl1.f1(r'R', r't', r'E', r'a'))

    Assert.equals("3", myClassImpl0.myFunc([1, 22, -73]))
    Assert.equals("3", myClassImpl0.myFunc(1, 22, -73))
    Assert.equals("3", myClassImpl1.myFunc([1, 22, -73]))
    Assert.equals("3", myClassImpl1.myFunc(1, 22, -73))

    var myFuncVar0 = myClassImpl0.myFunc
    var myFuncVar1 = myClassImpl1.myFunc
    Assert.equals("3", myFuncVar0([1, 22, -73]))
    Assert.equals("3", myFuncVar0(1, 22, -73))
    Assert.equals("3", myFuncVar1([1, 22, -73]))
    Assert.equals("3", myFuncVar1(1, 22, -73))

    var myStructImpl0 = myStruct([1, 22])
    var myStructImpl1 = myStruct(1, 22, 55)

    Assert.equals("R + a + 22", myStructImpl0.f1(r'R', [r't', r'E', r'a']))
    Assert.equals("R + a + 22", myStructImpl0.f1(r'R', r't', r'E', r'a'))
    Assert.equals("R + a + 55", myStructImpl1.f1(r'R', [r't', r'E', r'a']))
    Assert.equals("R + a + 55", myStructImpl1.f1(r'R', r't', r'E', r'a'))

    Assert.equals("3", myStructImpl0.myFunc([1, 22, -73]))
    Assert.equals("3", myStructImpl0.myFunc(1, 22, -73))
    Assert.equals("3", myStructImpl1.myFunc([1, 22, -73]))
    Assert.equals("3", myStructImpl1.myFunc(1, 22, -73))

    var mySFuncVar0 = myStructImpl0.myFunc
    var mySFuncVar1 = myStructImpl1.myFunc
    Assert.equals("3", mySFuncVar0([1, 22, -73]))
    Assert.equals("3", mySFuncVar0(1, 22, -73))
    Assert.equals("3", mySFuncVar1([1, 22, -73]))
    Assert.equals("3", mySFuncVar1(1, 22, -73))

    Assert.equals(6, myEnum.f0(4, [1, 22]))
    Assert.equals(6, myEnum.f0(4, 1, 22))
    Assert.equals("n + y", myEnum.S.f1(r'n', [r'i', r'y']))
    Assert.equals("n + y", myEnum.S.f1(r'n', r'i', r'y'))
    Assert.equals("2", myEnum.S.myFunc([1, 3]))
    Assert.equals("2", myEnum.S.myFunc(1, 3))

    var enumVar = S
    Assert.equals(3, enumVar([1, 3, 4]))
    Assert.equals(3, enumVar(1, 3, 4))
}
