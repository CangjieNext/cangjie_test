var top_a = 10

func fooB1<T>(a: T): T{
    fooB2<T>(a)
}
func fooB2<T>(a: T): T{
    fooB3<T>(a)
}
func fooB3<T>(a: T): T{
    fooB4<T>(a)
}
func fooB4<T>(a: T): T{
    fooB5<T>(a)
}
func fooB5<T>(a: T): T{
    fooB6<T>(a)
}
func fooB6<T>(a: T): T{
    fooB7<T>(a)
}
func fooB7<T>(a: T): T{
    fooB8<T>(a)
}
func fooB8<T>(a: T): T{
    fooB9<T>(a)
}
func fooB9<T>(a: T): T{
    fooB10<T>(a)
}
func fooB10<T>(a: T): T{
    fooB11<T>(a)
}
func fooB11<T>(a: T): T{
    fooB12<T>(a)
}
func fooB12<T>(a: T): T{
    fooB13<T>(a)
}
func fooB13<T>(a: T): T{
    fooB14<T>(a)
}
func fooB14<T>(a: T): T{
    fooB15<T>(a)
}
func fooB15<T>(a: T): T{
    fooB16<T>(a)
}
func fooB16<T>(a: T): T{
    fooB17<T>(a)
}
func fooB17<T>(a: T): T{
    fooB18<T>(a)
}
func fooB18<T>(a: T): T{
    fooB19<T>(a)
}
func fooB19<T>(a: T): T{
    fooB20<T>(a)
}
func fooB20<T>(a: T): T{
    top_a++
    a
}
class A{
    public static func fooA<T>(a: T): T{
        fooB1<T>(a)
    }

    public func test(){
        var a = true && fooA<Bool>(true)

        var b = true || fooA<Bool>(true) 

        var c = Option<Int64>.Some(100) ?? fooA<Int64>(100) 

        var c1 = Option<Int32>.Some(100) ??  fooA<Int32>(100) 

        var c2 = Option<Float64>.Some(100.0) ?? fooA<Float64>(100.0) 

        var c3 = Option<Unit>.Some(()) ?? fooA<Unit>(())

        var c4 = Option<String>.Some("100") ?? fooA<String>("100") 

        var c5 = Option<(Float64,String)>.Some((10.0, "")) ?? fooA<(Float64,String)>((10.0, ""))

        var c6 = Option<Array<String>>.Some([""]) ?? fooA<Array<String>>([""])

        let d = true && fooA<Bool>(true) 

        let e = true || fooA<Bool>(true)

        let f = Option<Int64>.Some(100) ?? fooA<Int64>(100)

        let g = Option<Int64>.Some((1)) ?? fooA<Int64>(100)

    }
}

main(){

}


/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
