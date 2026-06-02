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

enum TimeUnit1 {
    One(TimeUnit2)
}

enum TimeUnit2 {
    Two(TimeUnit3)
}

enum TimeUnit3 {
    Three(TimeUnit4)
}

enum TimeUnit4 {
    Four(TimeUnit5)
}

enum TimeUnit5 {
    Five
}

func run(): Int64 {
    var time = TimeUnit1.One(Two(Three(Four(Five))))
    var res: Int32 = match (time) {
        case One(Two(Three(Four(Five)))) => 4
        case _ => 5
    }

    if (res == 4) {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    return run()
}
