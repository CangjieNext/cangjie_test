// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.sync.*
internal import std.core.*

enum EnumTest1 {
    | TEST1_M1
    | TEST1_M2
}

enum EnumTest2 {
    | TEST2_M1
    | TEST2_M2
}
var m5 = ReentrantMutex()
var e1 : EnumTest1 = TEST1_M1
var e2 : EnumTest1 = TEST1_M2

func testArray() : Int32 {
	spawn {
		e1 = e2
	}
	return 0
}

func testArray2() : Int32 {
	spawn {
		e1 = e2
	}
	return 0
}

main() {}