public interface top {
	func f():Int64

    func n():Int64
}

extend Int64 <: top {
	public func f(): Int64 {
        -1
	}

    public func n(): Int64 {
        2
    }
}

main() {
	var a : top = 1
	return a.f() + a.n()
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
