name: Build proxy-enabled gmod-chttp

on:
  workflow_dispatch:
  push:
    branches: [ main, master ]

jobs:
  build:
    runs-on: ubuntu-22.04
    steps:
      - name: Checkout wrapper repo
        uses: actions/checkout@v4

      - name: Clone upstream gmod-chttp
        run: |
          git clone --depth 1 --recurse-submodules https://github.com/timschumi/gmod-chttp.git upstream

      - name: Apply overlay
        run: |
          cp overlay/src/HTTPRequest.h upstream/src/HTTPRequest.h
          cp overlay/src/HTTPRequest.cpp upstream/src/HTTPRequest.cpp
          cp overlay/src/chttp.cpp upstream/src/chttp.cpp
          mkdir -p upstream/filter
          cp overlay/filter/proxy.lua upstream/filter/proxy.lua

      - name: Build upstream dist
        run: |
          cd upstream
          export CHTTP_VERSION="proxy-${GITHUB_SHA::7}"
          ./dist.sh

      - name: Upload build artifacts
        uses: actions/upload-artifact@v4
        with:
          name: gmod-chttp-proxy-binaries
          path: upstream/dist/*
          if-no-files-found: error
