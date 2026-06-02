/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan abcdsuccess
// ASSERT: scan-not failed!

class A <: Exception {}

class B <: Exception {}

func test() {
    var t: Future<Int64> = spawn {
        var t: Future<Int64> = spawn {
            var t: Future<Int64> = spawn {
                var t: Future<Int64> = spawn {
                    var t: Future<Int64> = spawn {
                        throw A()
                    }
                    var res = 0
                    try {
                        res = t.get()
                    } catch (e: Exception) {
                        print("${e}");
                        res = 10
                    }
                    return res
                }
                var res = 0
                try {
                    res = t.get()
                    print("a")
                } catch (e: Exception) {
                    print("${e}");
                    res = 11
                }
                return res
            }
            var res = 0
            try {
                res = t.get()
                print("b")
            } catch (e: Exception) {
                print("${e}");
                res = 12
            }
            return res
        }
        var res = 0
        try {
            res = t.get()
            print("c")
        } catch (e: Exception) {
            print("${e}");
            res = 13
        }
        return res
    }
    var res = 0
    try {
        res = t.get()
        print("d")
    } catch (e: Exception) {
        print("${e}");
        res = 14
    }
    return res
}

main() {
    var res = test()
    print("success")
    return res - 10
}
