package inc

private func foo() {
    0
}

public interface top {
	func f():Int64
}

extend Int64 <: top {  // 这里是对Int64的扩展，在编译器中，考虑到内存布局，会使用box进行包装
	@Frozen
	public func f(): Int64 {
        foo()
	}
}



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
