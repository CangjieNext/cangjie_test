// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %disableCodegen  -Woff all %f -o %n.%suffix 2>&1 | compare %f
// ASSERT: scan [ConstAnalysis] The const value of Add at [47,13] has been set to 2

var array1: Array<Int8> = [1, 2, 3, 4, 5]
var array2: Array<Int16> = [1, 2, 3, 4, 5]
var array3: Array<Int32> = [1, 2, 3, 4, 5]
var array4: Array<Int64> = [1, 2, 3, 4, 5]
var array5: Array<UInt8> = [1, 2, 3, 4, 5]
var array6: Array<UInt16> = [1, 2, 3, 4, 5]
var array7: Array<UInt32> = [1, 2, 3, 4, 5]
var array8: Array<UInt64> = [1, 2, 3, 4, 5]
var array9: Array<Float16> = [1.1, 2.1, 3.1, 4.1, 5.1]
var array10: Array<Float32> = [1.1, 2.1, 3.1, 4.1, 5.1]
var array11: Array<Float64> = [1.1, 2.1, 3.1, 4.1, 5.1]
var array12: Array<Bool> = [true, false, true, false, true]
var array13: Array<String> = ["11", "22", "33", "44", "55"]
var array14 = [0b00011000, 0b00011001, 0b00011010, 0b00011100, 0b00011101, 0b00011100,
    0b00011000, 0b00011000, 0b00011000, 0b00011000, 0b00011000, 0b00011000, 0b00011000,
    0b00011000, 0b00011000, 0b00011000, 0b00011000, 0b00011000, 0b00011000, 0b00011000]
var array15 = [0o31, 0o32, 0o32, 0o33, 0o34, 0o35, 0o36, 0o37, 0o41, 0o42,
    0o31, 0o32, 0o32, 0o33, 0o34, 0o35, 0o36, 0o37, 0o41, 0o42,
    0o31, 0o32, 0o32, 0o33, 0o34, 0o35, 0o36, 0o37, 0o41, 0o42,
    0o31, 0o32, 0o32, 0o33, 0o34, 0o35, 0o36, 0o37, 0o41, 0o42,
    0o31, 0o32, 0o32, 0o33, 0o34, 0o35, 0o36, 0o37, 0o41, 0o42,]
var array16 = [0x01, 0x10, 0x11, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16]
var array17 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 10, 11, 12, 13, 14, 15]
var array18 = [1.1, 2.1, 3.1, 4.1, 5.1, 6.1, 7.1, 8.1, 9.1, 10.1, 11.1]
var array19 = ["1234567", "1234567", "1234567", "1234567", "1234567", "1234567",
    "1234567", "1234567", "1234567", "1234567", "1234567", "1234567", "1234567"]

class A {
    var a = 1
}

func f1() {
    let a = (A(), 1)
    if (a[0].a == 0) {
        return
    }
    let b = a[1] + 1
    for (i in array1) {
        if (i % 2 == 0) {
            continue
        }
    }
    for (i in array2) {
        if (i % 2 == 0) {
            continue
        }
    }
    for (i in array3) {
        if (i % 2 == 0) {
            continue
        }
    }
    for (i in array4) {
        if (i % 2 == 0) {
            continue
        }
    }
    for (i in array5) {
        if (i % 2 == 0) {
            continue
        }
    }
    for (i in array6) {
        if (i % 2 == 0) {
            continue
        }
    }
    for (i in array7) {
        if (i % 2 == 0) {
            continue
        }
    }
    for (i in array8) {
        if (i % 2 == 0) {
            continue
        }
    }
    for (i in array9) {
        if (i > 3.0) {
            break
        }
    }
    for (i in array10) {
        if (i > 3.0) {
            break
        }
    }
    for (i in array11) {
        if (i > 3.0) {
            break
        }
    }
    for (i in array12) {
        if (i == false) {
            break
        }
    }
    for (i in array13) {
        if (i.size == 10) {
            throw Exception("is a Exception")
        }
    }
    for (i in array14) {
        if (i % 2 == 0) {
            continue
        }
    }
    for (i in array15) {
        if (i % 2 == 0) {
            continue
        }
    }
    for (i in array16) {
        if (i % 2 == 0) {
            continue
        }
    }
    for (i in array17) {
        if (i % 2 == 0) {
            continue
        }
    }
    for (i in array18) {
        if (i > 50.0) {
            continue
        }
    }
    for (i in array19) {
        if (i.size == 100) {
            continue
        }
    }
    for (i in 1..100) {
        if (i % 2 == 0) {
            continue
        }
    }
    for (i in 1..100 : 1) {
        if (i % 2 == 0) {
            continue
        }
    }
    for (i in 1..100 : 4) {
        if (i % 2 == 0) {
            continue
        }
    }
    for (i in 100..1 : -1) {
        if (i % 2 == 0) {
            continue
        }
    }
    for (i in 100..1 : -4) {
        if (i % 2 == 0) {
            continue
        }
    }
    for (i in 1..=100) {
        if (i % 2 == 0) {
            continue
        }
    }
    for (i in 1..=100 : 1) {
        if (i % 2 == 0) {
            continue
        }
    }
    for (i in 1..=100 : 4) {
        if (i % 2 == 0) {
            continue
        }
    }
    for (i in 100..=1 : -1) {
        if (i % 2 == 0) {
            continue
        }
    }
    for (i in 100..=1 : -4) {
        if (i % 2 == 0) {
            continue
        }
    }
    for (i in 1..100 where i % 3 == 0) {
        if (i % 2 == 0) {
            continue
        }
    }
    for (_ in 1..100) {
        let tmp = 1
        if (tmp > 10) {
            break
        }
    }

    for (i in array1) {
        if (i % 2 == 0) {
            continue
        }
        for (i in array2) {
            if (i % 2 == 0) {
                continue
            }
            for (i in array3) {
                if (i % 2 == 0) {
                    continue
                }
                for (i in array4) {
                    if (i % 2 == 0) {
                        continue
                    }
                    for (i in array5) {
                        if (i % 2 == 0) {
                            continue
                        }
                        for (i in array6) {
                            if (i % 2 == 0) {
                                continue
                            }
                            for (i in array7) {
                                if (i % 2 == 0) {
                                    continue
                                }
                                for (i in array8) {
                                    if (i % 2 == 0) {
                                        continue
                                    }
                                    for (i in array9) {
                                        if (i > 3.0) {
                                            break
                                        }
                                        for (i in array10) {
                                            if (i > 3.0) {
                                                break
                                            }
                                            for (i in array11) {
                                                if (i > 3.0) {
                                                    break
                                                }
                                                for (i in array12) {
                                                    if (i == false) {
                                                        break
                                                    }
                                                    for (i in array13) {
                                                        if (i.size == 10) {
                                                            throw Exception("is a Exception")
                                                        }
                                                        for (i in array14) {
                                                            if (i % 2 == 0) {
                                                                continue
                                                            }
                                                            for (i in array15) {
                                                                if (i % 2 == 0) {
                                                                    continue
                                                                }
                                                                for (i in array16) {
                                                                    if (i % 2 == 0) {
                                                                        continue
                                                                    }
                                                                    for (i in array17) {
                                                                        if (i % 2 == 0) {
                                                                            continue
                                                                        }
                                                                        for (i in array18) {
                                                                            if (i > 50.0) {
                                                                                continue
                                                                            }
                                                                            for (i in array19) {
                                                                                if (i.size == 100) {
                                                                                    continue
                                                                                }
                                                                                for (i in 1..100) {
                                                                                    if (i % 2 == 0) {
                                                                                        continue
                                                                                    }
                                                                                    for (i in 1..100 : 1) {
                                                                                        if (i % 2 == 0) {
                                                                                            continue
                                                                                        }
                                                                                        for (i in 1..100 : 4) {
                                                                                            if (i % 2 == 0) {
                                                                                                continue
                                                                                            }
                                                                                            for (i in 100..1 : -1) {
                                                                                                if (i % 2 == 0) {
                                                                                                    continue
                                                                                                }
                                                                                                for (i in 100..1 : -4) {
                                                                                                    if (i % 2 == 0) {
                                                                                                        continue
                                                                                                    }
                                                                                                    for (i in 1..=100) {
                                                                                                        if (i % 2 == 0) {
                                                                                                            continue
                                                                                                        }
                                                                                                        for (i in 1..=100 : 1) {
                                                                                                            if (i % 2 == 0) {
                                                                                                                continue
                                                                                                            }
                                                                                                            for (i in 1..=100 : 4) {
                                                                                                                if (i % 2 == 0) {
                                                                                                                    continue
                                                                                                                }
                                                                                                                for (i in 100..=1 : -1) {
                                                                                                                    if (i % 2 == 0) {
                                                                                                                        continue
                                                                                                                    }
                                                                                                                    for (i in 100..=1 : -4) {
                                                                                                                        if (i % 2 == 0) {
                                                                                                                            continue
                                                                                                                        }
                                                                                                                        for (i in 1..100 where i % 3 == 0) {
                                                                                                                            if (i % 2 == 0) {
                                                                                                                                continue
                                                                                                                            }
                                                                                                                            for (_ in 1..100) {
                                                                                                                                let tmp = 1
                                                                                                                                if (tmp > 10) {
                                                                                                                                    break
                                                                                                                                }
                                                                                                                            }
                                                                                                                        }
                                                                                                                    }
                                                                                                                }
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return
}

main() {
    f1()
    0
}