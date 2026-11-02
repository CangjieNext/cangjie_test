/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Regression test for the CHIR constant propagation bug where the exit condition of the
// first `for (i in 1..=5)` loop was folded into `true` under -O2. The function below contains
// more than 300 blocks, so CHIR constant analysis uses the ActiveStatePool. When the pool
// evicted values, stale constants survived the join of the loop header state, and the loop
// never terminated. See Cangjie/cangjie_compiler issue #1252.
//
// The `iterations` guard turns a non-terminating loop (the old behavior) into an exception,
// so a regression fails the test quickly instead of hanging the test framework.
// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -O2 --int-overflow=wrapping -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan count=5

class ForInStatePoolPressure {
    public static let size : Int64 = 511
    public static let typemax : Int64 = 12
    public static let d : Int64 = 8
    public var iterations : Int64 = 0
    public var puzzl : Array<Bool> = Array<Bool>(size + 1, repeat: false)
    public var p : Array<Array<Bool>> = Array<Array<Bool>>(
        typemax + 1,
        repeat: Array<Bool>(size + 1, repeat: false)
    )

    public init() {
        var count = 0
        // The miscompiled loop: its continue condition was replaced by Constant(true).
        for (i in 1..=5) {
            if (i > 5) {
                throw Exception("for-in loop did not stop at 5")
            }
            count += 1
            for (j in 1..=5) {
                for (k in 1..=5) {
                    iterations += 1
                    if (iterations > 200) {
                        throw Exception("for-in loop did not terminate")
                    }
                    puzzl[i + d * (j + d * k)] = false
                }
            }
        }
        for (i in 0..=typemax) {
            for (m in 0..=size) {
                p[i][m] = false
            }
        }
        for (i in 0..=1) {
            for (j in 0..=0) {
                for (k in 0..=3) {
                    p[1][i + d * (j + d * k)] = true
                }
            }
        }
        for (i in 0..=0) {
            for (j in 0..=3) {
                for (k in 0..=1) {
                    p[2][i + d * (j + d * k)] = true
                }
            }
        }
        for (i in 0..=1) {
            for (j in 0..=3) {
                for (k in 0..=0) {
                    p[3][i + d * (j + d * k)] = true
                }
            }
        }
        for (i in 0..=3) {
            for (j in 0..=0) {
                for (k in 0..=1) {
                    p[4][i + d * (j + d * k)] = true
                }
            }
        }
        for (i in 0..=0) {
            for (j in 0..=1) {
                for (k in 0..=3) {
                    p[5][i + d * (j + d * k)] = true
                }
            }
        }
        for (i in 0..=2) {
            for (j in 0..=0) {
                for (k in 0..=0) {
                    p[6][i + d * (j + d * k)] = true
                }
            }
        }
        for (i in 0..=0) {
            for (j in 0..=2) {
                for (k in 0..=0) {
                    p[7][i + d * (j + d * k)] = true
                }
            }
        }
        for (i in 0..=0) {
            for (j in 0..=0) {
                for (k in 0..=2) {
                    p[8][i + d * (j + d * k)] = true
                }
            }
        }
        println("count=${count}")
    }
}

main(): Int64 {
    let obj = ForInStatePoolPressure()
    return Int64(obj.iterations) - 125
}
