/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cffi

import "testing"

func BenchmarkCffiCallback1(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunCallback1()
	}
}

func BenchmarkCffiCallback2(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunCallback2()
	}
}

func BenchmarkCffiCallback3(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunCallback3()
	}
}
func BenchmarkCffiCallback4(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunCallback4()
	}
}
