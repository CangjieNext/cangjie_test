/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cffi

import "testing"

func BenchmarkCffiPrimitive1(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunPrimitive1()
	}
}

func BenchmarkCffiPrimitive2(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunPrimitive2()
	}
}

func BenchmarkCffiPrimitive3(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunPrimitive3()
	}
}

func BenchmarkCffiPrimitive4(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunPrimitive4()
	}
}

func BenchmarkCffiPrimitive5(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunPrimitive5()
	}
}

func BenchmarkCffiPrimitive6(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunPrimitive6()
	}
}

func BenchmarkCffiPrimitive7(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunPrimitive7()
	}
}
