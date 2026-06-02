/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    if (foo(1) != 1) {
        return 1
    }
    if (foo(2) != 1) {
        return 1
    }
    if (foo(3) != 1) {
        return 1
    }
    if (foo(4) != 2) {
        return 1
    }
    if (foo(5) != 2) {
        return 1
    }
    if (foo(6) != 2) {
        return 1
    }
    if (goo(5)() != 2) {
        return 1
    }
    if (goo(6)() != 2) {
        return 1
    }
    if (hoo(4)(2) != 2) {
        return 1
    }
    return 0
}

func foo(m: Int32) {
    var a: Int32 = 1
    let b: Int32 = 2
    if (true) {
        func ifoo1(x!: Int32 = a) {
            return x
        }
        func ifoo2() {
            var x = a;
            return x
        }
        func ifoo3() {
            return a
        }
        func ifoo4(x!: Int32 = b) {
            return x
        }
        func ifoo5() {
            var x = b;
            return x
        }
        func ifoo6() {
            return b
        }
        var res = match (m) {
            case 1 => ifoo1()
            case 2 => ifoo2()
            case 3 => ifoo3()
            case 4 => ifoo4()
            case 5 => ifoo5()
            case 6 => ifoo6()
            case _ => Int32(100)
        }
        return res
    } else {
        return Int32(1)
    }
    return Int32(1)
}

func goo(m: Int32) {
    var a: Int32 = 1
    let b: Int32 = 2
    if (true) {
        func ifoo5() {
            var x = b;
            return x
        }
        func ifoo6() {
            return b
        }
        var res = match (m) {
            case 5 => ifoo5
            case 6 => ifoo6
            case _ => return ifoo5
        }
        return res
    } else {
        return {=> Int32(100)}
    }
    return {=> Int32(100)}
}

func hoo(m: Int32) {
    var a: Int32 = 1
    let b: Int32 = 2
    if (true) {
        func ifoo4(x!: Int32 = b) {
            return x
        }
        var res = match (m) {
            case 4 => ifoo4
            case _ => return ifoo4
        }
        return res
    } else {
        return {x: Int32 => 2 * x}
    }
    return {x: Int32 => 2 * x}
}
