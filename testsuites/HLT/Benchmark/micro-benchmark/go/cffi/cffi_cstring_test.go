/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cffi

import "testing"

func BenchmarkCffiCString1(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunCString1()
	}
}

func BenchmarkCffiCString2(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunCString2()
	}
}

func BenchmarkCffiCString3(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunCString3()
	}
}

func BenchmarkCffiCString4(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunCString4()
	}
}
