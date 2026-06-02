// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan 0

class A <: Exception {}

class B <: Exception {}

class C <: Exception {}

class D <: Exception {}

class E <: Exception {}

func Func1() {
    throw A()
}

var processResult: Int64 = 99

main(): Int64 {
    var ret: Int64 = Run()
    if (ret == 0) {
        print("0")
    } else {
        print("fail")
    }
    return 0
}

func Run(): Int64 {
    var res: Int64 = 2;
    try {
        res = Run1()
    } catch (_) {
        processResult -= 10
    }
    if (res == 0 && processResult == 95) {
        return 0
    }
    return res
}

func Run1(): Int64 {
    var res: Int64 = 2;
    try {
        res = Run2()
    } catch (a: A) {
        processResult -= 1
    }
    if (processResult == 98) {
        res = 0
        processResult -= 3
    }
    return res
}

func Run2(): Int64 {
    var res: Int64 = 2;
    try {
        res = Run3()
    } catch (b: B) {
        processResult -= 2
    }
    if (processResult == 97) {
        res = 0
    }
    return res
}

func Run3(): Int64 {
    var res: Int64 = 3;
    try {
        res = Run4()
    } catch (c: C) {
        processResult -= 3
    }
    if (processResult == 96) {
        res = 0
    }
    return res
}

func Run4(): Int64 {
    var res: Int64 = 4;
    try {
        res = Run5()
    } catch (d: D) {
        processResult -= 4
    }
    if (processResult == 95) {
        res = 0
    }
    return res
}

func Run5(): Int64 {
    var res: Int64 = 4;
    try {
        res = Func2()
    } catch (e: E) {
        processResult -= 5
    }
    if (processResult == 94) {
        res = 0
    }
    return res
}

func Func2(): Int64 {
    var result: Int64 = 4;

    try {
        processResult += 100
        try {
            processResult += 100
            try {
                processResult += 100
                try {
                    processResult += 100
                    try {
                        processResult += 100
                        Func1()
                    } catch (b: B) {
                        processResult -= 10
                    } finally {
                        processResult -= 100
                    }
                } catch (b: B) {
                    processResult -= 10
                } finally {
                    processResult -= 100
                }
            } catch (b: B) {
                processResult -= 10
            } finally {
                processResult -= 100
            }
        } catch (b: B) {
            processResult -= 10
        } finally {
            processResult -= 100
        }
        processResult -= 10
    } catch (c: C) {
        processResult -= 10
    } catch (b: B) {
        processResult -= 10
    } finally {
        processResult -= 100
    }
    processResult -= 10
    return result
}
