/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1

// 单个参数不包含空格场景
// DEPENDENCE: mylib.cj
// EXEC: %compiler %cmp_opt --output-type=dylib mylib.cj -o libmylib.%dylib_suffix
// EXEC: mkdir "hello world"
// EXEC: %cp libmylib.%dylib_suffix "hello world"/libmylib.%dylib_suffix

// Windows仅支持使用双引号或单引号来包含空格，Linux则支持反斜杠转义空格
// EXEC: %compiler %cmp_opt %f -o %output --link-option="-Lhello world" --link-option=-lmylib
// (not Windows) EXEC: %compiler %cmp_opt %f -o %output --link-option=-Lhello\ world --link-option=-lmylib

// (not Windows) EXEC: %compiler %cmp_opt %f -o %output --link-option=-z --link-option=now
// (not Windows) EXEC: %compiler %cmp_opt %f -o %output --link-option=-z --link-option=relro
// (not Windows) EXEC: %compiler %cmp_opt %f -o %output --link-option=-z --link-option=noexecstack

// 同时使用--link-option选项和--link-options选项
// (not Windows) EXEC: %compiler %cmp_opt %f -o %output --link-option=-z --link-option=now --link-options="-z relro -z noexecstack"

main(): Unit {
    println("hello")
}
