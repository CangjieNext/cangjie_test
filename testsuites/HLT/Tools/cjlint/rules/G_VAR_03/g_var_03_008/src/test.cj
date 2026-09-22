/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

var globalCounter = 0

const GLOBAL_THRESHOLD = 100

main() {
    globalCounter = 1
    println(GLOBAL_THRESHOLD)
}
