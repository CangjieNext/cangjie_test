/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan A B C D E F G H I J K L M N O P Q R S T U V W X Y 

let a: Range<Rune> = r'A'..r'Z' : 1

main(): Int64 {
    for (c in a) {
        print("${c} ")
    }
    return 0;
}
