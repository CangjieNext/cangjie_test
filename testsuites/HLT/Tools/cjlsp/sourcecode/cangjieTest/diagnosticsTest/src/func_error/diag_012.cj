/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package diagnosticsTest.func_error

open class A12 {
	public open func test12(a!: Int32): Int32 {
		return a + 1
	}
}
class B12 <: A12 {
	public override func test12(a!: Int32): Int32 { // ok
		return a + 1
	}
}
class C12 <: A12 {
	public override func test12(b!: Int32): Int32 { // error
		return b + 1
	}
}
