// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

@C
func callbacksss(s: Int32): Unit {
        println("callback cj ${s}")
}


foreign func set_callback(a:Int32, cb:CFunc<(Int32) -> Unit>) :Unit

main(){
	unsafe {set_callback(3 ,callbacksss)}
	foo(500, goo)
	0
}

func goo() {
	var a = 10
    return a
}

func foo(i:Int64, f:()->Int64) {
	var b = 20
}
