/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package http_test_test

import (
	"bytes"
	"context"
	"errors"
	"fmt"
	"io"
	"io/ioutil"
	"log"
	"net"
	"net/http"
	"strconv"
	"strings"
	"testing"
	"time"
)

type handler struct{}

func (h *handler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	v := r.URL.Query()
	receiveSizeStr := v.Get("receiveSize")
	receiveSize, err := strconv.Atoi(receiveSizeStr)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		return
	}
	isFormStr := v.Get("isForm")
	isForm, err := strconv.ParseBool(isFormStr)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		return
	}
	if isForm {
		r.ParseForm()
	}

	w.WriteHeader(http.StatusOK)
	data := make([]byte, receiveSize)
	if _, e := w.Write(data); e != nil {
		panic(e)
	}
}

var port int

func init() {
	server := http.Server{
		Addr:    "0.0.0.0:0",
		Handler: &handler{},
	}
	l, err := net.Listen("tcp", server.Addr)
	if err != nil {
		log.Fatalf(err.Error())
		return
	}
	port = l.Addr().(*net.TCPAddr).Port
	go func() {
		err = server.Serve(l)

		if err != nil {
			panic(err)
		}
	}()
}

func request(b *testing.B, method string, sendSize int, receiveSize int, isForm bool) {
	if method == http.MethodGet && sendSize != 0 {
		b.Error(fmt.Errorf("invalid %s request: sendSize %d", method, sendSize))
		return
	}
	if method == http.MethodHead && ( sendSize != 0 || receiveSize != 0) {
		b.Error(fmt.Errorf("invalid %s request: sendSize %d, receiveSize %d", method, sendSize, receiveSize))
		return
	}
	data := make([]byte, sendSize)
	for i := 0; i < sendSize; i++ {
		data[i] = 'a'
	}
	var bodyStr string
	if isForm {
		var r http.Request
		err := r.ParseForm()
		if err != nil {
			b.Error(err)
			return
		}
		r.Form.Add("key", string(data))
		bodyStr = strings.TrimSpace(r.Form.Encode())
	}
	url := fmt.Sprintf("http://localhost:%d?receiveSize=%d&isForm=%v", port, receiveSize, isForm)
	client := &http.Client{
		Timeout: time.Minute,
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		if doRequest(b, client, method, isForm, bodyStr, data, url, receiveSize) {
			return
		}
	}
}

func doRequest(b *testing.B, client *http.Client, method string, isForm bool, bodyStr string, data []byte, url string, receiveSize int) bool {
	var body io.Reader = nil
	if isForm {
		body = strings.NewReader(bodyStr)
	} else {
		body = bytes.NewReader(data)
	}
	request, err := http.NewRequest(method, url, body)
	if err != nil {
		b.Error(err)
		return true
	}
	ctx, cancelFunc := context.WithCancel(context.Background())
	request = request.WithContext(ctx)
	if isForm {
		request.Header.Set("Content-Type", "application/x-www-form-urlencoded")
	}
	resp, err := client.Do(request)
	if err != nil {
		b.Error(err)
		return true
	}
	defer cancelFunc()
	if resp.StatusCode != http.StatusOK {
		b.Error(errors.New("invalid status: " + resp.Status))
		return true
	}
	respData, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		b.Error(err)
		return true
	}
	if len(respData) != receiveSize {
		b.Error(fmt.Errorf("invalid receiveSize: expected %d, actual %d", receiveSize, int64(len(respData))))
		return true
	}
	return false
}

func BenchmarkGet0_32(b *testing.B) { request(b, http.MethodGet, 0, 32, false) }
func BenchmarkGet0_256(b *testing.B) { request(b, http.MethodGet, 0, 256, false) }
func BenchmarkGet0_2K(b *testing.B) { request(b, http.MethodGet, 0, 2*1024, false) }
func BenchmarkGet0_16K(b *testing.B) { request(b, http.MethodGet, 0, 16*1024, false) }
func BenchmarkGet0_128K(b *testing.B) { request(b, http.MethodGet, 0, 128*1024, false) }
func BenchmarkGet0_1M(b *testing.B) { request(b, http.MethodGet, 0, 1024*1024, false) }
func BenchmarkGet0_8M(b *testing.B) { request(b, http.MethodGet, 0, 8*1024*1024, false) }
func BenchmarkGet0_64M(b *testing.B) { request(b, http.MethodGet, 0, 64*1024*1024, false) }
func BenchmarkGet0_512M(b *testing.B) { request(b, http.MethodGet, 0, 512*1024*1024, false) }
func BenchmarkGet0_4G(b *testing.B) { request(b, http.MethodGet, 0, 4*1024*1024*1024, false) }

func BenchmarkHead(b *testing.B) { request(b, http.MethodHead, 0, 0, false) }

func BenchmarkDelete(b *testing.B) { request(b, http.MethodDelete, 0, 0, true) }

func BenchmarkPost0_32(b *testing.B) { request(b, http.MethodPost, 0, 32, false) }
func BenchmarkPost0_256(b *testing.B) { request(b, http.MethodPost, 0, 256, false) }
func BenchmarkPost0_2K(b *testing.B) { request(b, http.MethodPost, 0, 2*1024, false) }
func BenchmarkPost0_16K(b *testing.B) { request(b, http.MethodPost, 0, 16*1024, false) }
func BenchmarkPost0_128K(b *testing.B) { request(b, http.MethodPost, 0, 128*1024, false) }
func BenchmarkPost0_1M(b *testing.B) { request(b, http.MethodPost, 0, 1024*1024, false) }
func BenchmarkPost0_8M(b *testing.B) { request(b, http.MethodPost, 0, 8*1024*1024, false) }
func BenchmarkPost0_64M(b *testing.B) { request(b, http.MethodPost, 0, 64*1024*1024, false) }
func BenchmarkPost0_512M(b *testing.B) { request(b, http.MethodPost, 0, 512*1024*1024, false) }
func BenchmarkPost0_4G(b *testing.B) { request(b, http.MethodPost, 0, 4*1024*1024*1024, false) }

func BenchmarkPost32_0(b *testing.B) { request(b, http.MethodPost, 32, 0, false) }
func BenchmarkPost256_0(b *testing.B) { request(b, http.MethodPost, 256, 0, false) }
func BenchmarkPost2K_0(b *testing.B) { request(b, http.MethodPost, 2*1024, 0, false) }
func BenchmarkPost16K_0(b *testing.B) { request(b, http.MethodPost, 16*1024, 0, false) }
func BenchmarkPost128K_0(b *testing.B) { request(b, http.MethodPost, 128*1024, 0, false) }
func BenchmarkPost1M_0(b *testing.B) { request(b, http.MethodPost,1024*1024, 0,  false) }
func BenchmarkPost8M_0(b *testing.B) { request(b, http.MethodPost,8*1024*1024, 0,  false) }
func BenchmarkPost64M_0(b *testing.B) { request(b, http.MethodPost, 64*1024*1024, 0, false) }
func BenchmarkPost512M_0(b *testing.B) { request(b, http.MethodPost, 512*1024*1024, 0, false) }
func BenchmarkPost4G_0(b *testing.B) { request(b, http.MethodPost, 4*1024*1024*1024, 0, false) }

func BenchmarkPut0_32(b *testing.B) { request(b, http.MethodPut, 0, 32, false) }
func BenchmarkPut0_256(b *testing.B) { request(b, http.MethodPut, 0, 256, false) }
func BenchmarkPut0_2K(b *testing.B) { request(b, http.MethodPut, 0, 2*1024, false) }
func BenchmarkPut0_16K(b *testing.B) { request(b, http.MethodPut, 0, 16*1024, false) }
func BenchmarkPut0_128K(b *testing.B) { request(b, http.MethodPut, 0, 128*1024, false) }
func BenchmarkPut0_1M(b *testing.B) { request(b, http.MethodPut, 0, 1024*1024, false) }
func BenchmarkPut0_8M(b *testing.B) { request(b, http.MethodPut, 0, 8*1024*1024, false) }
func BenchmarkPut0_64M(b *testing.B) { request(b, http.MethodPut, 0, 64*1024*1024, false) }
func BenchmarkPut0_512M(b *testing.B) { request(b, http.MethodPut, 0, 512*1024*1024, false) }
func BenchmarkPut0_4G(b *testing.B) { request(b, http.MethodPut, 0, 4*1024*1024*1024, false) }

func BenchmarkPut32_0(b *testing.B) { request(b, http.MethodPut, 32, 0, false) }
func BenchmarkPut256_0(b *testing.B) { request(b, http.MethodPut, 256, 0, false) }
func BenchmarkPut2K_0(b *testing.B) { request(b, http.MethodPut, 2*1024, 0, false) }
func BenchmarkPut16K_0(b *testing.B) { request(b, http.MethodPut, 16*1024, 0, false) }
func BenchmarkPut128K_0(b *testing.B) { request(b, http.MethodPut, 128*1024, 0, false) }
func BenchmarkPut1M_0(b *testing.B) { request(b, http.MethodPut,1024*1024, 0,  false) }
func BenchmarkPut8M_0(b *testing.B) { request(b, http.MethodPut,8*1024*1024, 0,  false) }
func BenchmarkPut64M_0(b *testing.B) { request(b, http.MethodPut, 64*1024*1024, 0, false) }
func BenchmarkPut512M_0(b *testing.B) { request(b, http.MethodPut, 512*1024*1024, 0, false) }
func BenchmarkPut4G_0(b *testing.B) { request(b, http.MethodPut, 4*1024*1024*1024, 0, false) }

func BenchmarkPostForm32_0(b *testing.B) { request(b, http.MethodPost, 32, 0, true) }
func BenchmarkPostForm256_0(b *testing.B) { request(b, http.MethodPost, 256, 0, true) }
func BenchmarkPostForm2K_0(b *testing.B) { request(b, http.MethodPost, 2*1024, 0, true) }
func BenchmarkPostForm16K_0(b *testing.B) { request(b, http.MethodPost, 16*1024, 0, true) }
func BenchmarkPostForm128K_0(b *testing.B) { request(b, http.MethodPost, 128*1024, 0, true) }
func BenchmarkPostForm1M_0(b *testing.B) { request(b, http.MethodPost,1024*1024, 0,  true) }
func BenchmarkPostForm8M_0(b *testing.B) { request(b, http.MethodPost,8*1024*1024, 0,  true) }
func BenchmarkPostForm64M_0(b *testing.B) { request(b, http.MethodPost, 64*1024*1024, 0, true) }
func BenchmarkPostForm512M_0(b *testing.B) { request(b, http.MethodPost, 512*1024*1024, 0, true) }
func BenchmarkPostForm4G_0(b *testing.B) { request(b, http.MethodPost, 4*1024*1024*1024, 0, true) }

func BenchmarkPutForm32_0(b *testing.B) { request(b, http.MethodPut, 32, 0, true) }
func BenchmarkPutForm256_0(b *testing.B) { request(b, http.MethodPut, 256, 0, true) }
func BenchmarkPutForm2K_0(b *testing.B) { request(b, http.MethodPut, 2*1024, 0, true) }
func BenchmarkPutForm16K_0(b *testing.B) { request(b, http.MethodPut, 16*1024, 0, true) }
func BenchmarkPutForm128K_0(b *testing.B) { request(b, http.MethodPut, 128*1024, 0, true) }
func BenchmarkPutForm1M_0(b *testing.B) { request(b, http.MethodPut,1024*1024, 0,  true) }
func BenchmarkPutForm8M_0(b *testing.B) { request(b, http.MethodPut,8*1024*1024, 0,  true) }
func BenchmarkPutForm64M_0(b *testing.B) { request(b, http.MethodPut, 64*1024*1024, 0, true) }
func BenchmarkPutForm512M_0(b *testing.B) { request(b, http.MethodPut, 512*1024*1024, 0, true) }
func BenchmarkPutForm4G_0(b *testing.B) { request(b, http.MethodPut, 4*1024*1024*1024, 0, true) }
