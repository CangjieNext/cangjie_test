/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.ast.*
import std.fs.*
import std.io.*

public macro M1(input: Tokens) {
	var path: String = "./"
	if (exists(path)) {
		throw IOException("File does not exist")
	}
	input
}

main() {
}


