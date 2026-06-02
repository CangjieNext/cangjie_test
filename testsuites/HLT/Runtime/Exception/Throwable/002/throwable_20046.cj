/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./../../../../API/asan
// EXEC: %compiler %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %cmp_opt %f asan.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import asan.*

class A <: Exception {}

class B <: Exception {}

func test(): Int64 {
    let f = spawn {
        var res = -1
        try {
            let fut: Future<Int64> = spawn {
                throw A()
                return 0
            }
            try {
                res = fut.get()
            } catch (_) {
                res = 1 // matched
            }
        } catch (e: Exception) {
            e.printStackTrace()
            return -1
        } finally {
            asanGC()
        }
        return res
    }
    var res = -1
    try {
        res = f.get()
    } catch (e: Exception) {
        throw e;
        res = 1
    }
    asanGC()
    return res - 1
}

main() {
    test()
}
