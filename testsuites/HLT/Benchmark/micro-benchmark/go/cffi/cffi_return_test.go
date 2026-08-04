/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cffi

import "testing"

func BenchmarkCffiReturn1(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunReturn1()
	}
}

func BenchmarkCffiReturn2(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunReturn2()
	}
}
func BenchmarkCffiReturn3(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunReturn3()
	}
}
func BenchmarkCffiReturn4(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunReturn4()
	}
}
func BenchmarkCffiReturn5(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunReturn5()
	}
}
func BenchmarkCffiReturn6(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunReturn6()
	}
}
func BenchmarkCffiReturn7(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunReturn7()
	}
}

func BenchmarkCffiReturn8(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunReturn8()
	}
}

func BenchmarkCffiReturn9(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunReturn9()
	}
}
func BenchmarkCffiReturn10(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunReturn10()
	}
}
func BenchmarkCffiReturn11(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunReturn11()
	}
}
func BenchmarkCffiReturn12(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunReturn12()
	}
}
func BenchmarkCffiReturn13(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunReturn13()
	}
}
func BenchmarkCffiReturn14(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunReturn14()
	}
}
