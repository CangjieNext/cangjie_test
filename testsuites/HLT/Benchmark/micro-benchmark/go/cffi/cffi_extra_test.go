/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cffi

import "testing"

func BenchmarkCffiExtra1(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunExtra1()
	}
}

func BenchmarkCffiExtra2(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunExtra2()
	}
}
