# yaak-file-upload-bug-repro

This repro assumes you have the following installed:

- NodeJS
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

5. Use the included Yaak workspace to test uploading the files of various sizes. You'll need to update the file base paths, they should all be pointing to the correct location in the repo already.
6. Observe success on the files smaller than 1MB and failure on files 1MB or larger
