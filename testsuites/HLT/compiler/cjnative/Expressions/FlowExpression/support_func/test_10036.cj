/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package test

public class A {
    public static var a: (Int64) -> Int64 = {input: Int64 => input}

    public static var b: (Int64) -> Int64 = {input: Int64 => input}

    public static var c: ((Int64) -> Int64) -> Int64 = {input: (Int64) -> Int64 => input(1)}
}
