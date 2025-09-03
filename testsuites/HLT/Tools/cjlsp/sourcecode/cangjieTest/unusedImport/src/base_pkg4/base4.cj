package unusedImport.base_pkg4

public interface I4 {
	func myfunc() : Unit
}

public interface X4 {
	
}

extend<T> Array<T><: I4 where T <: X4{
	public func myfunc() : Unit {
		println("x4")
	}
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
