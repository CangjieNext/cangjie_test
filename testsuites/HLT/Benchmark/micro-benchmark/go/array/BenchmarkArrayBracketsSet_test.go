/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package array

import (
	"testing"
)

var element2 int = 666666
func benchmarkBracketsSetRunD1(b *testing.B, arrLen int) {
	arr := make([]int, arrLen)
	for i := 0; i < arrLen; i++ {
		arr[i] = i
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		arr[arrLen/2] = element2
	}
}

func BenchmarkArrayBracketsSetD1_N32(b *testing.B)      { benchmarkBracketsSetRunD1(b, 32) }
func BenchmarkArrayBracketsSetD1_N256(b *testing.B)     { benchmarkBracketsSetRunD1(b, 256) }
func BenchmarkArrayBracketsSetD1_N2048(b *testing.B)    { benchmarkBracketsSetRunD1(b, 2048) }
func BenchmarkArrayBracketsSetD1_N1048576(b *testing.B) { benchmarkBracketsSetRunD1(b, 1048576) }

func benchmarkBracketsSetRunD2(b *testing.B, arrLen int) {
	arr := make([][]int, arrLen)
	for j := 0; j < arrLen; j++ {
		arr[j] = make([]int, arrLen)
	}
	for i := 0; i < arrLen; i++ {
		for j := 0; j < arrLen; j++ {
			arr[i][j] = i
		}
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		arr[arrLen/2][arrLen/2] = element2
	}
}

func BenchmarkArrayBracketsSetD2_N32(b *testing.B)      { benchmarkBracketsSetRunD2(b, 32) }
func BenchmarkArrayBracketsSetD2_N256(b *testing.B)      { benchmarkBracketsSetRunD2(b, 256) }
func BenchmarkArrayBracketsSetD2_N2048(b *testing.B)      { benchmarkBracketsSetRunD2(b, 2048) }

func benchmarkBracketsSetRunD3(b *testing.B, arrLen int) {
	arr := make([][][]int, arrLen)
	for j := 0; j < arrLen; j++ {
		arr[j] = make([][]int, arrLen)
		for k := 0; k < arrLen; k++ {
			arr[j][k] = make([]int, arrLen)
		}
	}
	for i := 0; i < arrLen; i++ {
		for j := 0; j < arrLen; j++ {
			for k := 0; k < arrLen; k++ {
				arr[i][j][k] = i
			}
		}
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		arr[arrLen/2][arrLen/2][arrLen/2] = element2
	}
}

func BenchmarkArrayBracketsSetD3_N32(b *testing.B)      { benchmarkBracketsSetRunD3(b, 32) }
func BenchmarkArrayBracketsSetD3_N128(b *testing.B)      { benchmarkBracketsSetRunD3(b, 128) }