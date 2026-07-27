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

func benchmarkD2Run(b *testing.B, arrLen int) {
	for i := 0; i < b.N; i++ {
		arr := make([][]int, arrLen)
		for j := 0; j < arrLen; j++ {
			arr[j] = make([]int, arrLen)
		}
	}
}

func BenchmarkArrayInitializationD2_N32(b *testing.B)      { benchmarkD2Run(b, arrLen[0]) }
func BenchmarkArrayInitializationD2_N256(b *testing.B)     { benchmarkD2Run(b, arrLen[1]) }
func BenchmarkArrayInitializationD2_N2048(b *testing.B)    { benchmarkD2Run(b, arrLen[2]) }

func benchmarkD2RunWithData(b *testing.B, arrLen int) {
	for i := 0; i < b.N; i++ {
		arr := make([][]int, arrLen)
		for j := 0; j < arrLen; j++ {
			arr[j] = make([]int, arrLen)
		}
		for i := 0; i < arrLen; i++ {
			for j := 0; j < arrLen; j++ {
				arr[i][j] = i
			}
		}
	}
}

func BenchmarkArrayInitDataD2_N32(b *testing.B)      { benchmarkD2RunWithData(b, arrLen[0]) }
func BenchmarkArrayInitDataD2_N256(b *testing.B)     { benchmarkD2RunWithData(b, arrLen[1]) }
func BenchmarkArrayInitDataD2_N2048(b *testing.B)    { benchmarkD2RunWithData(b, arrLen[2]) }