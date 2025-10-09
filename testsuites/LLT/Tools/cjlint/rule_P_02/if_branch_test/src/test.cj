// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.sync.*
internal import stdx.serialization.serialization.*

var m3 = ReentrantMutex()
var gVar : Int32 = 23

func testIfBranch() : Int32 {
	spawn {
		m3.lock()
		if (gVar > 1) {
			m3.unlock()
			return
		} else if (gVar > 2) {
			if (gVar < 3) {
				gVar = 4
			}
			m3.unlock()
			gVar = 5
			if (gVar < 6) {
				gVar = 7
			}
		} else {
			gVar = 8
			m3.unlock()
			match (gVar) {
				case 9 => gVar = 10
				case 11 => print("gVar = 11")
				case _ => print("unknown")
			}
		}

		match (gVar) {
			case 12 => gVar = 13
			case 14 => print("gVar = 14")
			case _ => print("unknown")
		}
		gVar = 15
		m3.unlock()
        return
	}
	gVar = 16
	return 0
}

func testIfBranch2() : Int32 {
	spawn {
		gVar = 17
	}
	return 0
}

main() {}