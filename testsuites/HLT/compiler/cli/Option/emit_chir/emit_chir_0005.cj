/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt --emit-chir=opt %f
// (not MAC) EXEC: %sed -i "1i aaaa" default.chir
// (MAC) EXEC: %sed -i '' $'1i\\\naaaa' default.chir
// ERRCHECK: %chir-dis default.chir
// ASSERT: scan validation of 'default.chir' failed, please confirm it was created by compiler whose version is

main() {
    var a = 0
    return a
}
