/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0-core
// EXEC: %compiler %cmp_opt --emit-chir=raw %f
// EXEC: %chir-dis default.chir

main() {
    var a = 0
    return a
}
