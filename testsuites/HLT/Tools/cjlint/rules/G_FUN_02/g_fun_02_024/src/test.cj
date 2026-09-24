/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func connect(timeout: Int64, retries!: Int64 = timeout): Int64 {
    return retries
}

main() {
    println(connect(5))
}
