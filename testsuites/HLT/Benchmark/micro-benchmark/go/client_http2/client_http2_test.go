/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package client_http2_test

import (
	"bytes"
	"fmt"
	"io/ioutil"
	"crypto/tls"
	"net/http"
	"strconv"
	"testing"
	"time"
)

func benchmarkHttp2ClientGet(b *testing.B, bodysize int) {
	url := fmt.Sprintf("https://127.0.0.1:60003/get%s", strconv.Itoa(bodysize))
	tr := &http.Transport{
		TLSClientConfig:   &tls.Config{InsecureSkipVerify: true},
		ForceAttemptHTTP2: true,
	}
	client := &http.Client{
		Transport: tr,
		Timeout: time.Minute,
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		req, err := http.NewRequest("GET", url, nil)
		if err != nil {
			fmt.Println(err)

			return
		}
		req.Proto = "HTTP/2.0"
	
		resp, err := client.Do(req)
		if err != nil {
			fmt.Println(err)
			return
		}
		_, err1 := ioutil.ReadAll(resp.Body)
		if err1 != nil {
			panic(err1)
		}
	}
}

func BenchmarkHttp2ClientGet_N_0(b *testing.B) { benchmarkHttp2ClientGet(b, 0) }
func BenchmarkHttp2ClientGet_N_32(b *testing.B) { benchmarkHttp2ClientGet(b, 32) }
func BenchmarkHttp2ClientGet_N_256(b *testing.B) { benchmarkHttp2ClientGet(b, 256) }
func BenchmarkHttp2ClientGet_N_2048(b *testing.B) { benchmarkHttp2ClientGet(b, 2048) }
func BenchmarkHttp2ClientGet_N_16384(b *testing.B) { benchmarkHttp2ClientGet(b, 16384) }
func BenchmarkHttp2ClientGet_N_131072(b *testing.B) { benchmarkHttp2ClientGet(b, 131072) }
func BenchmarkHttp2ClientGet_N_1048576(b *testing.B) { benchmarkHttp2ClientGet(b, 1048576) }

func benchmarkHttp2ClientPost(b *testing.B, bodysize int) {
	url := "https://127.0.0.1:60003/post"
	body := make([]byte, bodysize)
	tr := &http.Transport{
		TLSClientConfig:   &tls.Config{InsecureSkipVerify: true},
		ForceAttemptHTTP2: true,
	}
	client := &http.Client{
		Transport: tr,
		Timeout: time.Minute,
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		req, err := http.NewRequest("POST", url, bytes.NewReader(body))
		if err != nil {
			fmt.Println(err)

			return
		}
		req.Proto = "HTTP/2.0"
	
		resp, err := client.Do(req)
		if err != nil {
			fmt.Println(err)
			return
		}
		if resp.StatusCode != http.StatusOK {
			fmt.Println(err)
		}
	}
}

func BenchmarkHttp2ClientPost_N_0(b *testing.B) { benchmarkHttp2ClientPost(b, 0) }
func BenchmarkHttp2ClientPost_N_32(b *testing.B) { benchmarkHttp2ClientPost(b, 32) }
func BenchmarkHttp2ClientPost_N_256(b *testing.B) { benchmarkHttp2ClientPost(b, 256) }
func BenchmarkHttp2ClientPost_N_2048(b *testing.B) { benchmarkHttp2ClientPost(b, 2048) }
func BenchmarkHttp2ClientPost_N_16384(b *testing.B) { benchmarkHttp2ClientPost(b, 16384) }
func BenchmarkHttp2ClientPost_N_131072(b *testing.B) { benchmarkHttp2ClientPost(b, 131072) }
func BenchmarkHttp2ClientPost_N_1048576(b *testing.B) { benchmarkHttp2ClientPost(b, 1048576) }