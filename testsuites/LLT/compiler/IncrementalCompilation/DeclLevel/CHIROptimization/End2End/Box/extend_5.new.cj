func foo(){
    1
}
public interface top {
	func f():Int64 {
        foo()
    }
}

extend Int64 <: top {
}

main() {
	var a : top = 1
	return a.f()
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
