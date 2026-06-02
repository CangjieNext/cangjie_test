/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cjpm_run_env_01

internal import std.unittest.*
internal import std.fs.*
internal import std.collection.*
internal import std.process.*

@Test
public class TestM {
    @TestCase
    func addTest(): Unit {
        let envs: Map<String, String> = Process.current.environment
        println("envs: ${envs["PATH"]}")
        @Assert("this_is_a_test" != envs["PATH"])
    }
}
