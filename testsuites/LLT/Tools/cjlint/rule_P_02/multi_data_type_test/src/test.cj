// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.sync.*
internal import stdx.serialization.serialization.*

var m4 = ReentrantMutex()
var gVar1 : Int32 = 23

open class c1BaseBase {
	var c1bbm1 : Int32 = 1
	static var c1bbs1 : Int32 = 2
	var c1bbm2 : String = "1234"
	func c1bbf1() : Int32 {
		return 0
	}
}

open class c1Base <: c1BaseBase {
	var c1bm1 : Int32 = 1
	var c1bm2 : String = "1234"
	func c1bf1() : Int32 {
		return 0
	}
}
class c0 {
	var c0m1 : Int32 = 2
	var c0m2 : String = "23"
}

class c1 <: c1Base {
	var c1m0 : c0 = c0()
	var c1m1 : Int32 = 2
	var c1m2 : String = "5678"
	var c1m3 : ReentrantMutex = ReentrantMutex()
	func c1f1() {
		spawn {
			c1m0.c0m1 = 3
			c1m1 = 3
			if (c1m1 > 3) {
				c1m2 = "qwer"
			}
			c1bm1 = 31
			c1bbs1 = 31
			c1bbm1 = 32
			c1m3.lock()
			c1m1 = 4
			if (c1m1 > 4) {
				c1m2 = "tyui"
			}
			c1m3.unlock()
		}
		spawn {
			c1m0.c0m1 = 3
			c1m1 = 3
			if (c1m1 > 3) {
				c1m2 = "qwer"
			}
			c1bm1 = 31
			c1bbs1 = 31
			c1bbm1 = 32
			c1m3.lock()
			c1m1 = 4
			if (c1m1 > 4) {
				c1m2 = "tyui"
			}
			c1m3.unlock()
		}
	}
	func c1f2() {
		spawn {
			c1m0.c0m1 = 5
			c1m1 = 5
			if (c1m1 > 5) {
				c1m2 = "asdf"
			}
			c1m3.lock()
			c1m1 = 6
			if (c1m1 > 6) {
				c1m2 = "ghjk"
			}
			c1m3.unlock()
		}
	}
}

interface i1 {
	func i1f1() : Int32 {
		return 0
	}
}

struct r1 {
	var r1m1 : Int32 = 2
	var r1m2 : String = "5678"
	var r1m3 : ReentrantMutex = ReentrantMutex()
}

class c2 <: c1BaseBase & i1 {
	var c2m0 : c0 = c0()
	var c2m1 : Int32 = 2
	var c2m2 : String = "5678"
	var c2m3 : ReentrantMutex = ReentrantMutex()
	func c2f1() {
		spawn {
			c2m0.c0m1 = 3
			c2m1 = 3
			if (c2m1 > 3) {
				c2m2 = "qwer"
			}
			c2m3.lock()
			c2m1 = 4
			if (c2m1 > 4) {
				c2m2 = "tyui"
			}
			c2m3.unlock()
		}
		spawn {
			c2m0.c0m1 = 3
			c2m1 = 3
			if (c2m1 > 3) {
				c2m2 = "qwer"
			}
			c2m3.lock()
			c2m1 = 4
			if (c2m1 > 4) {
				c2m2 = "tyui"
			}
			c2m3.unlock()
		}
	}
}

func testDataType() : Int32 {
	spawn {
		m4.lock()
		if (gVar1 > 1) {
			m4.unlock()
            return
		}
        return
	}
	gVar1 = 16
	return 0
}

enum EnumTest3 {
    | TEST3_M1
    | TEST3_M2
}

struct s1 <: i1 {
	var s1m1 : Int32 = 2
	var s1m2 : String = "5678"
	var s1m3 : ReentrantMutex = ReentrantMutex()
	var s1m4 : EnumTest3 = TEST3_M1
	public func i1f1() : Int32 {
		return 1
	}
}

class c3 {
	var c3m1 : s1 = s1()
	var c3m2 : EnumTest3 = TEST3_M1
	func c3f1() {
		spawn {
			c3m1.s1m2 = "1234"
			c3m1.s1m4 = TEST3_M2
			c3m2 = TEST3_M2
		}
		spawn {
			c3m1.s1m2 = "1234"
			c3m1.s1m4 = TEST3_M2
			c3m2 = TEST3_M2
		}
	}
}

main() {}