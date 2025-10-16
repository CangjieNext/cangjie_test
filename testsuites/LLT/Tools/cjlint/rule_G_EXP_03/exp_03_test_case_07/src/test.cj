// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Rule_G_EXP_03_测试用例

class A {
    var cnt: Int64 = 10
}

let g =A()

// 含副作用的Top-Level函数
var count: Int64 = 0
func wrongCaseOne(x: Int64): Int64 {
    count += x
    return count
}
// overload不含副作用
func wrongCaseOne(): Int64 {
    return 0
}

func wrongCaseTwo(x: Int64): Int64 {
    count++
    return count
}

// 不含副作用的Top-Level函数
func rightCaseOne(x: Int64): Int64 {
    var b: Int64 = 10
    b += x
    return b
}
// 函数内带有副作用函数
func wrongCaseSix(x: Int64): Int64 {
    var b: Int64 = 10
    b += x
    wrongCaseOne(b)
    return b
}

class C {
    var a: Int64 = 10

    // 含副作用的In-Class函数
    func wrongCaseFour(x: Int64): Int64 {
        this.a++
        return this.a
    }

    func wrongCaseFive(x: Int64): Int64 {
        count += x
        return count
    }

    func wrongCaseSeven(x: Int64): Int64 {
            var b: Int64 = 10
            b += x
            wrongCaseOne(b)
            return count
    }

    func wrongCaseEight(x: Int64): Int64 {
                var b: Int64 = 10
                b += x
                wrongCaseFour(b)
                return count
    }

    func wrongCaseTen(x: Int64){
        var b = g
        b.cnt = 2
        return x
    }



    // 不含副作用的In-Class函数
    func rightCaseTwo(x: Int64): Int64 {
        var b: Int64 = 10
        b += x
        return b
    }


}


func wrongCaseNine(x: Int64){
    var b = g
    b.cnt = 2
    return x
}

func f(x: Int64) {
    var b = g
    f1(b)
    return x
}
func f1(b : A) {
    b.cnt = 2
}

main() {
    // BeforeTest 数据设置
    let v1 = Option<Int64>.Some(100)
    let v2 = Option<Int64>.None
    let isOk = false
    var num = 5

    let c = C()


    // 含副作用的函数
    func wrongCaseThree(x: Int64): Int64 {
        count -= x
        return count
    }


    // &&右侧含副作用
    if (isOk && (num++ != (num += 5))) {}
    if (isOk && ((num += 5) != num++)) {}

    // ||右侧含副作用
    if (isOk || (wrongCaseOne(num) != 0)) {}
    if (isOk || (wrongCaseTwo(num) != 0)) {}
    if (isOk || (wrongCaseThree(num) != 0)) {}
    if (isOk || (c.wrongCaseFour(num) != 0)) {}
    if (isOk || (c.wrongCaseFive(num) != 0)) {}
    if (isOk || (wrongCaseSix(num) != 0)) {}
    if (isOk || (c.wrongCaseSeven(num) != 0)) {}
    if (isOk || (c.wrongCaseEight(num) != 0)) {}
    if (isOk || (wrongCaseNine(num) != 0)) {}
    if (isOk || (c.wrongCaseTen(num) != 0)) {}
    if (isOk || (f(num) != 0)) {}


    // ||右侧不含副作用
    if (isOk || (wrongCaseOne() != 0)) {}
    if (isOk || (rightCaseOne(num) != 0)) {}
    if (isOk || (c.rightCaseTwo(num) != 0)) {}


    // ??操作符右侧含副作用
    let r7 = v1 ?? wrongCaseOne(num)
    let r8 = v1 ?? wrongCaseTwo(num)
    let r9 = v1 ?? wrongCaseThree(num)
    let r10 = v1 ?? c.wrongCaseFour(num)
    let r11 = v1 ?? c.wrongCaseFive(num)


    // ??操作符右侧不含副作用
    let r12 = v1 ?? rightCaseOne(num)


    return 0
}