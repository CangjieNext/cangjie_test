// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// (CJNATIVE and not Windows) EXEC-0: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop 2>& 1
import java.lang.*

func f1(input: JArray<Float32>): JArray<Float32> {
    let local: JArray<Float32> = input
    let localNoType = input
    let localConstructed = JArray<Float32>(1)
    return JArray(1)
}

func f2(input: JArray<Int32>): JArray<Int32> {
    let local: JArray<Int32> = input
    let localNoType = input
    let localConstructed = JArray<Int32>(1)
    return JArray(1)
}

func f3(input: JArray<Int64>): JArray<Int64> {
    let local: JArray<Int64> = input
    let localNoType = input
    let localConstructed = JArray<Int64>(1)
    return JArray(1)
}

func f4(input: JArray<?JArray<String>>): JArray<?JArray<String>> {
    let local: JArray<?JArray<String>> = input
    let localNoType = input
    let localConstructed = JArray<?JArray<String>>(1)
    return JArray(1)
}

type typealias = JArray<?JArray<String>>
