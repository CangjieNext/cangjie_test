# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.

import json
import sys
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from urllib.parse import urlparse


class Handler(BaseHTTPRequestHandler):
    def log_message(self, _format, *_args):
        return

    def do_GET(self):
        name = urlparse(self.path).path.rsplit("/", 1)[-1]
        if name == "idx500":
            status = 500
            data = json.dumps({"errors": [{"message": "refresh failed"}]}).encode()
        else:
            status = 200
            data = (json.dumps({
                "copyright": "Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.",
                "organization": "",
                "name": name,
                "version": "1.0.0",
                "dependencies": [],
                "test-dependencies": [],
                "script-dependencies": [],
                "sha256sum": "",
                "yanked": False,
                "cjc-version": "1.0.0",
                "index-version": 1,
            }) + "\n").encode()
        self.send_response(status)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(data)))
        self.end_headers()
        self.wfile.write(data)


ThreadingHTTPServer(("127.0.0.1", int(sys.argv[1])), Handler).serve_forever()
