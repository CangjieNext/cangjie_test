/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cffi

import "testing"

func BenchmarkCffiStruct1(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunStruct1()
	}
}

func BenchmarkCffiStruct2(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunStruct2()
	}
}

func BenchmarkCffiStruct3(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunStruct3()
	}
}

func BenchmarkCffiStruct4(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunStruct4()
	}
}

func BenchmarkCffiStruct5(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunStruct5()
	}
}

func BenchmarkCffiStruct6(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunStruct6()
	}
}

func BenchmarkCffiStruct7(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunStruct7()
	}
}

func BenchmarkCffiStruct8(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunStruct8()
	}
}
