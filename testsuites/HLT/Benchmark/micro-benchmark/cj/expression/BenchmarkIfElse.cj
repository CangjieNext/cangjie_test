/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %import-cangjie-stdx %optimization_level_2 %overflow_wrapping --no-sub-pkg -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run_stdx %output %run_utest_opt %run_args

import stdx.encoding.json.*
import std.io.*
import std.time.*
import std.convert.*

let reps = 100000000
public var m = 2
public var n = 2
public var k = 2
public var l = 2

func benchmarkIfElseD1(): Unit {
    for (i in 0..reps) {
        if (n > 16) {
            n = 16
        } else if (n > 15) {
            n = 15
        } else if (n > 14) {
            n = 14
        } else if (n > 13) {
            n = 13
        } else if (n > 12) {
            n = 12
        } else if (n > 11) {
            n = 11
        } else if (n > 10) {
            n = 10
        } else if (n > 9) {
            n = 9
        } else if (n > 8) {
            n = 8
        } else if (n > 7) {
            n = 7
        } else if (n > 6) {
            n = 6
        } else if (n > 5) {
            n = 5
        } else if (n > 4) {
            n = 4
        } else if (n > 3) {
            n = 3
        } else if (n > 2) {
            n = 2
        } else {
            n = 1
        }
    }
}

func benchmarkIfElseD2(): Unit {
    for (i in 0..reps) {
        if (n > 16) {
            if (m > 16) {
                n = 16
            } else {
                n = 17
            }
        } else if (n > 15) {
            if (m > 15) {
                n = 15
            } else {
                n = 16
            }
        } else if (n > 14) {
            if (m > 14) {
                n = 14
            } else {
                n = 15
            }
        } else if (n > 13) {
            if (m > 13) {
                n = 13
            } else {
                n = 14
            }
        } else if (n > 12) {
            if (m > 12) {
                n = 12
            } else {
                n = 13
            }
        } else if (n > 11) {
            if (m > 11) {
                n = 11
            } else {
                n = 12
            }
        } else if (n > 10) {
            if (m > 10) {
                n = 10
            } else {
                n = 11
            }
        } else if (n > 9) {
            if (m > 9) {
                n = 9
            } else {
                n = 10
            }
        } else if (n > 8) {
            if (m > 8) {
                n = 8
            } else {
                n = 9
            }
        } else if (n > 7) {
            if (m > 7) {
                n = 7
            } else {
                n = 8
            }
        } else if (n > 6) {
            if (m > 6) {
                n = 6
            } else {
                n = 7
            }
        } else if (n > 5) {
            if (m > 5) {
                n = 5
            } else {
                n = 6
            }
        } else if (n > 4) {
            if (m > 4) {
                n = 4
            } else {
                n = 5
            }
        } else if (n > 3) {
            if (m > 3) {
                n = 3
            } else {
                n = 4
            }
        } else if (n > 2) {
            if (m > 2) {
                n = 2
            } else {
                n = 3
            }
        } else {
            if (m > 1) {
                n = 1
            } else {
                n = 2
            }
        }
    }
}

func benchmarkIfElseD4(): Unit {
    for (i in 0..reps) {
        if (n > 16) {
            if (m > 16) {
                if (l > 16) {
                    if (k > 16) {
                        n = 16
                    } else {
                        n = 17
                    }
                } else {
                    n = 18
                }
            } else {
                n = 19
            }
        } else if (n > 15) {
            if (m > 15) {
                if (l > 15) {
                    if (k > 15) {
                        n = 15
                    } else {
                        n = 16
                    }
                } else {
                    n = 17
                }
            } else {
                n = 18
            }
        } else if (n > 14) {
            if (m > 14) {
                if (l > 14) {
                    if (k > 14) {
                        n = 14
                    } else {
                        n = 15
                    }
                } else {
                    n = 16
                }
            } else {
                n = 17
            }
        } else if (n > 13) {
            if (m > 13) {
                if (l > 13) {
                    if (k > 13) {
                        n = 13
                    } else {
                        n = 14
                    }
                } else {
                    n = 15
                }
            } else {
                n = 16
            }
        } else if (n > 12) {
            if (m > 12) {
                if (l > 12) {
                    if (k > 12) {
                        n = 12
                    } else {
                        n = 13
                    }
                } else {
                    n = 14
                }
            } else {
                n = 15
            }
        } else if (n > 11) {
            if (m > 11) {
                if (l > 11) {
                    if (k > 11) {
                        n = 11
                    } else {
                        n = 12
                    }
                } else {
                    n = 13
                }
            } else {
                n = 14
            }
        } else if (n > 10) {
            if (m > 10) {
                if (l > 10) {
                    if (k > 10) {
                        n = 10
                    } else {
                        n = 11
                    }
                } else {
                    n = 12
                }
            } else {
                n = 13
            }
        } else if (n > 9) {
            if (m > 9) {
                if (l > 9) {
                    if (k > 9) {
                        n = 9
                    } else {
                        n = 10
                    }
                } else {
                    n = 11
                }
            } else {
                n = 12
            }
        } else if (n > 8) {
            if (m > 8) {
                if (l > 8) {
                    if (k > 8) {
                        n = 8
                    } else {
                        n = 9
                    }
                } else {
                    n = 10
                }
            } else {
                n = 11
            }
        } else if (n > 7) {
            if (m > 7) {
                if (l > 7) {
                    if (k > 7) {
                        n = 7
                    } else {
                        n = 8
                    }
                } else {
                    n = 9
                }
            } else {
                n = 10
            }
        } else if (n > 6) {
            if (m > 6) {
                if (l > 6) {
                    if (k > 6) {
                        n = 6
                    } else {
                        n = 7
                    }
                } else {
                    n = 8
                }
            } else {
                n = 9
            }
        } else if (n > 5) {
            if (m > 5) {
                if (l > 5) {
                    if (k > 5) {
                        n = 5
                    } else {
                        n = 6
                    }
                } else {
                    n = 7
                }
            } else {
                n = 8
            }
        } else if (n > 4) {
            if (m > 4) {
                if (l > 4) {
                    if (k > 4) {
                        n = 4
                    } else {
                        n = 5
                    }
                } else {
                    n = 6
                }
            } else {
                n = 7
            }
        } else if (n > 3) {
            if (m > 3) {
                if (l > 3) {
                    if (k > 3) {
                        n = 3
                    } else {
                        n = 4
                    }
                } else {
                    n = 5
                }
            } else {
                n = 6
            }
        } else if (n > 2) {
            if (m > 2) {
                if (l > 2) {
                    if (k > 2) {
                        n = 2
                    } else {
                        n = 3
                    }
                } else {
                    n = 4
                }
            } else {
                n = 5
            }
        } else {
            if (m > 1) {
                if (l > 1) {
                    if (k > 1) {
                        n = 1
                    } else {
                        n = 2
                    }
                } else {
                    n = 3
                }
            } else {
                n = 4
            }
        }
    }
}

func timeBenchmarkIfElseD1(): Unit {
    var startTime = DateTime.now()
    benchmarkIfElseD1()
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkIfElseD1: " + perTime.format(".3") + " ns/op")
}

func timeBenchmarkIfElseD2(): Unit {
    var startTime = DateTime.now()
    benchmarkIfElseD2()
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkIfElseD2: " + perTime.format(".3") + " ns/op")
}

func timeBenchmarkIfElseD4(): Unit {
    var startTime = DateTime.now()
    benchmarkIfElseD4()
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkIfElseD4: " + perTime.format(".3") + " ns/op")
}

main(): Int64 {
    timeBenchmarkIfElseD1()
    timeBenchmarkIfElseD2()
    timeBenchmarkIfElseD4()
    return 0
}
