# yaak-file-upload-bug-repro

This repro assumes you have the following installed:

- NodeJS v22
- npm
- bash

## Steps

1. Install deps

   ```sh
   cd yaak-file-upload-repro && npm i
   ```

2. Run the server

    ```sh
    npm run start
    ```

3. Open a new terminal instance in the repo root and use pre-prepared scripts to create test files

    ```sh
    ./scripts/create-test-files.sh
    ```

4. Run upload tests with curl to ensure the API is operational, without issues

    ```sh
    ./scripts/curl-test.sh
    ```

5. Update the Yaak workspace file paths to use an absolute path pointing to the `test_files` dir in this repo

    ```sh
    ./scripts/update-yaak-workspace-file-paths.sh
    ```

6. Use the included Yaak workspace to test uploading the files of various sizes.
7. Observe success on the files smaller than 1MB and failure on files 1MB or larger
