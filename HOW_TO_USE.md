1. Create a new empty GitHub repository.
2. Upload **all files from this archive** to the repository root.
3. Open the **Actions** tab.
4. Run **Build proxy-enabled gmod-chttp**.
5. Wait for the job to finish.
6. Download the artifact named **gmod-chttp-proxy-binaries**.
7. From the artifact, take `gmsv_chttp_linux.dll` for your Linux x86 server.
8. Put it into `garrysmod/lua/bin/`.

The workflow clones upstream `timschumi/gmod-chttp`, applies the overlay, and builds the normal upstream `dist/` bundle.
