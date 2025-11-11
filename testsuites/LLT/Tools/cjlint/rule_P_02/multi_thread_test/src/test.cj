// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.sync.*
internal import stdx.serialization.serialization.*

var a1 = b()
var a3 : Int32 = 34
var m1 = ReentrantMutex()
let m2 = m1
let m3 = ReentrantMutex()

class b2 {
	var m: Int32 = 12
}

class b {
  	var m: Int32 = 32
	var m1: b2 = b2()
  	func get(): Int32 {
    	return m
  	}
  	func set(v: Int32) {
      	m = v
  	}
}

func foo(p: b) {
  	p.m = 12
}

func goo(v: Int32) {
  	var n = v
}

func newThread() {
	let a2 = b()
	spawn {
		m1.lock()
      	var v1 = a1.get()
      	goo(a1.m1.m)
		m3.lock()
		goo(a1.m1.m)
		m3.unlock()
		while (a1.m > 44) {
			spawn {
				var v2 = a2.get()
				synchronized(m2) {
					goo(a2.m)
				}
        	}
		}
		let arr: Array<Int32> = [0,1,2,3]
		for (item in arr) {
			spawn {
				var v3 = a2.get()
				synchronized(m2) {
					goo(a2.m)
				}
        	}
		}
		do {
			spawn {
				var v4 = a2.get()
				synchronized(m2) {
					goo(a2.m)
				}
        	}
		} while (a1.m < 57)

        if (a1.m == 33) {
			m2.lock()
            a1.m1.m = 34
			return
        } else {
			m2.lock()
            a1.m = 35
			spawn {
				var v4 = a2.get()
				goo(a2.m)
        	}
        }
		a1.m = 55
		m2.unlock()
		a1.m = 99
		m1.unlock()
  	}
  	spawn {
  		a1.m = 32
      	a1.set(12)
      	foo(a1)
      	a2.m = 32
      	a2.set(12)
      	foo(a2)
		goo(a3)
		var aa = a3.serialize()
  	}
    spawn {
        var aa = 3
    }
}

main() : Int32 {
	let a2 = b()
  	spawn {
		m1.lock()
      	var v1 = a1.get()
      	goo(a1.m1.m)
		while (a1.m > 44) {
			spawn {
				var v2 = a2.get()
				synchronized(m2) {
					goo(a2.m)
				}
        	}
		}
		let arr: Array<Int32> = [0,1,2,3]
		for (item in arr) {
			spawn {
				var v3 = a2.get()
				synchronized(m2) {
					goo(a2.m)
				}
        	}
		}
		do {
			spawn {
				var v4 = a2.get()
				synchronized(m2) {
					goo(a2.m)
				}
        	}
		} while (a1.m < 57)

        if (a1.m == 33) {
			m2.lock()
            a1.m1.m = 34
			return
        } else {
			m2.lock()
            a1.m = 35
			spawn {
				var v4 = a2.get()
				goo(a2.m)
        	}
        }
		a1.m = 55
		m2.unlock()
		a1.m = 99
		m1.unlock()
  	}
  	spawn {
  		a1.m = 32
      	a1.set(12)
      	foo(a1)
      	a2.m = 32
      	a2.set(12)
      	foo(a2)
		goo(a3)
		var aa = a3.serialize()
  	}
    spawn {
        var aa = 3
    }
    return 0
}