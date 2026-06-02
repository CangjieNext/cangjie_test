/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cjpm_run_env_01

internal import std.fs.*
internal import std.collection.*
internal import std.process.*

main(): Unit {
    let envs: Map<String, String> = Process.current.environment

    println("envs: ${envs["MY_ENV"]}")
    return
}
