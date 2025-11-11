/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class A{
    private var top_a = 10
    private var top_a1 : Int32 = 10
    protected var top_b = true
    public var top_c = 1.0
    public var top_d = ()
    public static var top_e = ""
    public var top_f = (0.0, "100")
    public var top_g = Array<String>(1, { i =>""} )

    public func test(){
        var a = true && {top_b=false; false}()

        var b = true || {top_b=false; false}()

        var c = Option<Int64>.Some(100) ?? {top_b=false; 1}()

        var c1 = Option<Int32>.Some(100) ??  {top_a1 = 3; Int32(3)}()

        var c2 = Option<Float64>.Some(100.0) ?? {top_c=1.0; 1.0}()

        var c3 = Option<Unit>.Some(()) ?? {top_d=(); ()}()

        var c4 = Option<String>.Some("100") ?? { top_e= "hicchi"; "a"}()

        var c5 = Option<(Float64,String)>.Some((10.0, "")) ?? { top_f= (10.0, ""); (10.0, "")}()

        var c6 = Option<Array<String>>.Some(top_g) ?? {top_g.set(0, "hi"); top_g}()

        let d = true &&  {top_b=false; false}()

        let e = true ||  {top_b=false; false}()

        let f = Option<Int64>.Some(100) ?? {top_a = 3; 3}()

        let g = Option<Int64>.Some((1)) ??  {top_a = 3; 3}()
    }
}

main(){

}



