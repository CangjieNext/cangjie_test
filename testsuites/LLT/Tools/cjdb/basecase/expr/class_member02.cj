// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func foo<T>(para: T) {
    var a: T = para
    a
}

public func genericsfun_c<T>(a: T) {
    func test_c<T>(a: T) {
        var gengricsvar = a
        return 0
    }
    var testa = test_c(a)
    return 0
}

public struct R1<T> {
    public var width: T
    public var length: T
    public init (side: T) {
        this(side, side)
    }
    public init (width: T, length: T) {
        this.width = width
        this.length = length
    }

}


public enum TimeUnit1<T> {
    Year(T) | Month(T)

    public func funcdemo1(): TimeUnit1<T> {
        print("I am in instance func.\n")
        return this
    }

    public static func foo(b: T):T{
        print("I am in static func.\n")
        return b
    }

    public operator func -():TimeUnit1<T>{
        print("I am in operator func.\n")
        return this
    }
}

var top_r = R1<Int32>(10)

class Pair<T1, T2> {
    var first: T1
    var second: T2
    public init(a: T1, b: T2) {
        first = a
        second = b
    }
}

interface Eq<T> {
    func equals(other: T): Bool
}

extend<T1, T2> Pair<T1, T2> <: Eq<Pair<T1, T2>> where T1 <: Eq<T1>, T2 <: Eq<T2> {
    public func equals(other: Pair<T1, T2>) {
        first.equals(other.first) && second.equals(other.second)
    }
}

class Foo <: Eq<Foo> {
    public func equals(other: Foo): Bool {
        false
    }
}

let a = Pair(Foo(), 8).first
    let b = Pair(Foo(), Foo()).equals
    let c = Pair<Int64, Bool>(6, true)
    let d = Foo().equals(Foo())

class Foo1<X> {
    let width: X
    let height: X

    public init(width:X, height: X) {
        this.width = width
        this.height = height
    }
    public var b = 0
}
	
public func test():Unit
{
	var aa = [1,2]
	while(true) {
		sleep(1000 * Duration.millisecond)
		println("hello world")
		var a1 = foo<Int8>(1)
		var a2 = genericsfun_c(aa)
		var a3 = R1<Int32>(10)
		let a4 = TimeUnit1<Int64>.Year(2020).funcdemo1()
		let a = Pair(Foo(), 8).first
    let b = Pair(Foo(), Foo()).equals
    let c = Pair<Int64, Bool>(6, true)
    let d = Foo().equals(Foo())
	var x = Foo1<Int64>(6,8)
    let y = x.b + 1
	let z = 0
	}
   
}

main(){
	test()
}