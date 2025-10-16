// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

var top_a = 10

func foo_b1<T>(a: T): T{
    foo_b2<T>(a)
}
func foo_b2<T>(a: T): T{
    foo_b3<T>(a)
}
func foo_b3<T>(a: T): T{
    foo_b4<T>(a)
}
func foo_b4<T>(a: T): T{
    foo_b5<T>(a)
}
func foo_b5<T>(a: T): T{
    foo_b6<T>(a)
}
func foo_b6<T>(a: T): T{
    foo_b7<T>(a)
}
func foo_b7<T>(a: T): T{
    foo_b8<T>(a)
}
func foo_b8<T>(a: T): T{
    foo_b9<T>(a)
}
func foo_b9<T>(a: T): T{
    foo_b10<T>(a)
}
func foo_b10<T>(a: T): T{
    foo_b11<T>(a)
}
func foo_b11<T>(a: T): T{
    foo_b2<T>(a)
}
func foo_b12<T>(a: T): T{
    foo_b13<T>(a)
}
func foo_b13<T>(a: T): T{
    foo_b14<T>(a)
}
func foo_b14<T>(a: T): T{
    foo_b15<T>(a)
}
func foo_b15<T>(a: T): T{
    foo_b16<T>(a)
}
func foo_b16<T>(a: T): T{
    foo_b17<T>(a)
}
func foo_b17<T>(a: T): T{
    foo_b18<T>(a)
}
func foo_b18<T>(a: T): T{
    foo_b19<T>(a)
}
func foo_b19<T>(a: T): T{
    foo_b20<T>(a)
}
func foo_b20<T>(a: T): T{
    a
}
class G{
    static func foo_a<T>(a: T): T{
        foo_b1<T>(a)
    }

    func test(){
        var a = true && foo_a<Bool>(true)

        var b = true || foo_a<Bool>(true)

        var c = Option<Int64>.Some(100) ?? foo_a<Int64>(100)

        var c1 = Option<Int32>.Some(100) ?? foo_a<Int32>(100)

        var c2 = Option<Float64>.Some(100.0) ?? foo_a<Float64>(100.0)

        var c3 = Option<Unit>.Some(()) ?? foo_a<Unit>(())

        var c4 = Option<String>.Some("100") ?? foo_a<String>("100")

        var c5 = Option<(Float64,String)>.Some((10.0, "")) ?? foo_a<(Float64,String)>((10.0, ""))

        var c6 = Option<Array<String>>.Some([""]) ?? foo_a<Array<String>>([""])

        let d = true && foo_a<Bool>(true)

        let e = true || foo_a<Bool>(true)

        let f = Option<Int64>.Some(100) ?? foo_a<Int64>(100)

        let g = Option<Int64>.Some((1)) ?? foo_a<Int64>(100)

    }
}