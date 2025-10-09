import std.io.*

struct A{
	func foo( file!:Unit = { => if (File.exist("path")) {
			throw IOException("File does not exist")
		}
	}()){
		file
	}
}

main(){
	0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
