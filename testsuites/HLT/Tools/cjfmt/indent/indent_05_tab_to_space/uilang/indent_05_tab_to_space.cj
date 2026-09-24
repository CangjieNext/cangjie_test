/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class T {
	let v: Int64 = 1
	public init() {
	}
	public func get(): Int64 {
			return v
	}
}

main() {
		println(T().get())
}
