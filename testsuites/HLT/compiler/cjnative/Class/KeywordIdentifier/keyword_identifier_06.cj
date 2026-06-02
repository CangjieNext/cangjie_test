/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
enum public {
    private | protected | redef | override | abstract | open
}

main() {
    let c = public.redef
    let a = match (c) {
        case private => 2
        case protected => 3
        case redef => 4
        case override => 5
        case abstract => 6
        case open => 7
    }
    return a - 4
}
