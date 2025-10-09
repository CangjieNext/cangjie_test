import std.fs.*
import std.io.*
import a.*

@M1
func test() {
	var path: String = "./"
	if (exists(path)) {
		throw IOException("File does not exist")
	}
}

main() {
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
