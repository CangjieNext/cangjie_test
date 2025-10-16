// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//-----BEGIN PRIVATE KEY-----
//////12345
//-----END PRIVATE KEY-----

//52:54:00:0c:77:e3
class A {
	var pwd = "abc"
	var key = "00123456"
	var token = "30123456"
	var session = "wx123456"
}

let a:A = A()
main() {
	a.pwd = "200"
	return 0
}