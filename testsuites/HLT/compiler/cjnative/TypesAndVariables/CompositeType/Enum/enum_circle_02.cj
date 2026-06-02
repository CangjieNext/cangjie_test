/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

enum TimeUnit {
    Year(Int32)
    | OneUnit(TimeUnit)
    | TwoUnit(TimeUnit)
    | ThreeUnit(TimeUnit)
    | Four(TimeUnit)
}

func run(): Int64 {
    var time = TimeUnit.Four(ThreeUnit(TwoUnit(OneUnit(Year(2020)))))
    var res: Int32 = match (time) {
        case Year(x) => x * 0
        case OneUnit(Year(x)) => x * 1
        case TwoUnit(OneUnit(Year(x))) => x * 2
        case ThreeUnit(TwoUnit(OneUnit(Year(x)))) => x * 3
        case Four(ThreeUnit(TwoUnit(OneUnit(Year(x))))) => x * 4
        case _ => 0
    }

    if (res == 8080) {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    return run()
}
