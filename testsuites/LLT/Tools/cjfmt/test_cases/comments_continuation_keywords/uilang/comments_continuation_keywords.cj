// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func t1(n: Int64): Int64 {
    if (n > 0) {
        return 1
    } // c
    else {
        return 2
    }
}

func t2(n: Int64): Int64 {
    try {
        return n
    } // try done
    catch (e: Exception) {
        return 0
    } // catch done
    finally {
        println("fin")
    }
}

func t3(): Int64 {
    var n = 0
    do {
        n++
    } // loop done
    while (n < 3)
    return n
}

func t4(n: Int64): Int64 {
    if (n > 0) {
        if (n > 1) {
            return 1
        } // inner branch
        else if (n == 1) {
            return 2
        } // inner fallback
        else {
            return 3
        }
    }
    return 0
}

func t5(): Unit {
    try {} // empty try
    catch (e: Exception) {} // empty catch
    finally {}
    do {} // empty loop
    while (false)
}
