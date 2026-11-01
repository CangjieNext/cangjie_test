/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// 打印命令行参数到标准输出，用于校验空字符串参数是否传递成功
// EXEC: %compiler %cmp_opt %f -o %output

main(argv: Array<String>): Int64 {
    println("argc=${argv.size}")
    for (i in 0..argv.size) {
        println("arg${i}=<${argv[i]}>")
    }
    return 0
}
