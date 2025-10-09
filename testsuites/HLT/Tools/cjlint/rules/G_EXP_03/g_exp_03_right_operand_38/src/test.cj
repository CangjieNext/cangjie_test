func foo_b<T>(a: T){
    a
}


class A{

    static private var top_a = 10
    private var top_a1 : Int32 = 10
    protected var top_b = true
    public var top_c = 1.0
    public let top_d = ()
    public static let top_e = ""
    public let top_f = (0.0, "100")
    public var top_g = [""]

    public static func foo_a<T>(a: T){
        top_a++
        a
    }

    public static func foo_c<T>(a: T){
        top_a
        a
    }

    public func test(){
        var a = true && (foo_a<Bool>(true) && foo_b<Bool>(true) && foo_c<Bool>(true))

        var b = true || (foo_a<Bool>(true) && foo_b<Bool>(true) && foo_c<Bool>(true))

        var c = Option<Int64>.Some(100) ?? (foo_a<Int64>(100) - foo_b<Int64>(100) + foo_c<Int64>(100))

        var c1 = Option<Int32>.Some(100) ??  (foo_a<Int32>(100) + foo_b<Int32>(100) - foo_c<Int32>(100))

        var c2 = Option<Float64>.Some(100.0) ?? (foo_a<Float64>(100.0) * foo_b<Float64>(100.0)/ foo_c<Float64>(100.0))

        var c3 = Option<Unit>.Some(()) ?? foo_a<Unit>(foo_b<Unit>(foo_c<Unit>(())))

        var c4 = Option<String>.Some("100") ?? (foo_a<String>("100") + foo_b<String>("100") + foo_c<String>("100"))

        var c5 = Option<(Float64,String)>.Some((10.0, "")) ?? foo_b<(Float64,String)>(foo_a<(Float64,String)>(foo_c<(Float64,String)>((10.0, ""))))

        var c6 = Option<Array<String>>.Some([""]) ?? foo_a<Array<String>>(foo_b<Array<String>>(foo_c<Array<String>>([""])))

        let d = true &&  (foo_a<Bool>(true) && foo_b<Bool>(true) && foo_c<Bool>(true))

        let e = true ||  (foo_a<Bool>(true) && foo_b<Bool>(true) && foo_c<Bool>(true))

        let f = Option<Int64>.Some(100) ?? (foo_a<Int64>(100) - foo_b<Int64>(100) + foo_c<Int64>(100))

        let g = Option<Int64>.Some((1)) ??  (foo_a<Int64>(100) - foo_b<Int64>(100) + foo_c<Int64>(100))

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
