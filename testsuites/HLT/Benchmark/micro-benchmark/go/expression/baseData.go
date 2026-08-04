/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package expression_test

import (
	"math"
	"math/rand"
	"time"
)

// The array length for test - 32, 64, 2K, 16K, 128K, 1M, 8M
var arrLen = []int{32, 256, 2048, 16384, 131072, 1048576, 8388608}

func generateArrD1(arrLen int) []int {
	return make([]int, arrLen)
}

func generateArrD2(arrLen int) [][]int {
	arrD2 := make([][]int, arrLen)
	for r := range arrD2 {
		arrD2[r] = generateArrD1(arrLen)
	}
	return arrD2
}

func generateArrD3(arrLen int) [][][]int {
	arrD3 := make([][][]int, arrLen)
	for r := range arrD3 {
		arrD3[r] = generateArrD2(arrLen)
	}
	return arrD3
}

func randomizeD1(arr []int) {
	rand.Seed(time.Now().UnixNano())
	for r := range arr {
		arr[r] = rand.Intn(math.MaxInt)
	}
}

func randomizeD2(arr [][]int) {
	for r := range arr {
		randomizeD1(arr[r])
	}
}

func randomizeD3(arr [][][]int) {
	for r := range arr {
		randomizeD2(arr[r])
	}
}