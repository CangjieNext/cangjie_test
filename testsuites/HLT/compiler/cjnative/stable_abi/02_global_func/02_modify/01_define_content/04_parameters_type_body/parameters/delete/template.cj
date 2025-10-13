/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test global func: modify parameters
public interface I {}

extend Int64 <: I {}

func global_func_01() {
    0
}

func global_func_11(a: Int64) {
    0
}

func global_func_21(a!: Int64) {
    0
}

func global_func_31(a!: Int64 = 0) {
    0
}

func global_func_02() {
    0
}

func global_func_12(a: Int64) {
    0
}

func global_func_22(a!: Int64) {
    0
}

func global_func_32(a!: Int64 = 0) {
    0
}

const func global_func_03() {
    0
}

const func global_func_13(a: Int64) {
    0
}

const func global_func_23(a!: Int64) {
    0
}

const func global_func_33(a!: Int64 = 0) {
    0
}

public func global_func_04() {
    0
}

public func global_func_14(a: Int64) {
    0
}

public func global_func_24(a!: Int64) {
    0
}

public func global_func_34(a!: Int64 = 0) {
    0
}

public const func global_func_05() {
    global_func_03()
}

public const func global_func_15(a: Int64) {
    global_func_13(0)
}

public const func global_func_25(a!: Int64) {
    global_func_23(a: 0)
}

public const func global_func_35(a!: Int64 = 0) {
    global_func_33(a: 0)
}

@Frozen
public func global_func_06() {
    global_func_02()
}

@Frozen
public func global_func_16() {
    global_func_12(0)
}

@Frozen
public func global_func_26() {
    global_func_22(a: 0)
}

@Frozen
public func global_func_36() {
    global_func_32(a: 0)
}
