/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan res2 = None
// ASSERT: scan res4 = Some(1000)
// ASSERT: scan res5 = None
// ASSERT: scan res6 = None
// ASSERT: scan res9_1 = None
// ASSERT: scan res4_1_1 = Some(-10000)
// ASSERT: scan res4_2_1 = Some(-20000)
// ASSERT: scan res8_1 = Some(30)
// ASSERT: scan res4_1 = Some(-1000)
// ASSERT: scan res4_2 = Some(-2000)

func add(a: Int64, b: Int64): Int64 {
    return a + b
}

main(): Int64 {
    let tlv1 = ThreadLocal<Int64>()
    let tlv2 = ThreadLocal<(Int64, Int64) -> Int64>()

    let res1 = spawn {
        tlv1.set(1)
        if (tlv1.get().getOrThrow() == 1) {
            return 0
        }
        return 1
    }
    let res2 = spawn {
        println("res2 = ${tlv1.get()}")
        return 0
    }
    let res3 = spawn {
        tlv1.set(-1)
        if (tlv1.get().getOrThrow() == -1) {
            return 0
        }
        return 1
    }
    let res4 = spawn {
        tlv1.set(1000)
        let res4_1 = spawn {
            tlv1.set(-1000)
            let res4_1_1 = spawn {
                tlv1.set(-10000)
                println("res4_1_1 = ${tlv1.get()}")
                if (tlv1.get().getOrThrow() == -10000) {
                    return 0
                }
                return 1
            }
            res4_1_1.get()
            println("res4_1 = ${tlv1.get()}")
            if (tlv1.get().getOrThrow() == -1000) {
                return 0
            }
            return 1
        }
        res4_1.get()
        println("res4 = ${tlv1.get()}")

        tlv1.set(2000)
        let res4_2 = spawn {
            tlv1.set(-2000)
            let res4_2_1 = spawn {
                tlv1.set(-20000)
                println("res4_2_1 = ${tlv1.get()}")
                if (tlv1.get().getOrThrow() == -20000) {
                    return 0
                }
                return 1
            }
            res4_2_1.get()
            println("res4_2 = ${tlv1.get()}")
            if (tlv1.get().getOrThrow() == -2000) {
                return 0
            }
            return 1
        }
        res4_2.get()
        if (tlv1.get().getOrThrow() == 2000) {
            return 0
        }
        return 1
    }

    let res5 = spawn {
        let res5_1 = spawn {
            tlv1.set(-1)
        }
        res5_1.get()
        println("res5 = ${tlv1.get()}")
        return 0
    }

    let res6 = spawn {
        tlv1.set(None)
        println("res6 = ${tlv1.get()}")
        return 0
    }

    let res7 = spawn {
        tlv2.set(add)
        if (tlv2.get().getOrThrow()(1, 2) == 3) {
            return 0
        }
        return 1
    }

    let res8 = spawn {
        tlv1.set(add(1, 3))
        let res8_1 = spawn {
            tlv1.set(10 + 20)
            println("res8_1 = ${tlv1.get()}")
            if (tlv1.get().getOrThrow() == 30) {
                return 0
            }
            return 1
        }
        res8_1.get()
        if (tlv1.get().getOrThrow() == 4) {
            return 0
        }
        return 1
    }

    let res9 = spawn {
        tlv1.set(365)
        let res9_1 = spawn {
            println("res9_1 = ${tlv1.get()}")
        }
        res9_1.get()
        if (tlv1.get().getOrThrow() == 365) {
            return 0
        }
        return 1
    }

    if (res1.get() == 1 || res2.get() == 1 || res3.get() == 1 || res4.get() == 1 || res5.get() == 1 || res6.get() == 1 ||
        res7.get() == 1 || res8.get() == 1 || res9.get() == 1) {
        return 1
    }
    return 0
}
