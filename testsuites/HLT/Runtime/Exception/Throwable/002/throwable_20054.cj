/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class A <: Exception {}

class B <: Exception {}

class C <: Exception {}

class T {
    public T() {
        throw A()
    }
}

func test() {
    var res = -1
    try {
        T()
        ()
    } catch (a: A) {
        res = 0
    } catch (_: Exception) {
        res = -1
    }
    return res
}

main() {
    return test()
}
