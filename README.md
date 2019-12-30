# php protobuf segfault tests

This is a simple example to show segfault with the protobuf 3.11.x PHP extension. 

The segfault is not present in 3.10.

edit Dockerfile and change VERSION to test different versions of the extension.

Run `./run.sh` to test.  `gdb` should be called automatically if there is a segfault. 

environment variables for run.sh:

- `GOOGLE_APPLICATION_CREDENTIALS` - path to service account json file
- `SPANNER_INSTANCE` - test spanner instance
- `SPANNER_DATABASE` - test spannerer database

Have seen same behavior using php-fpm, cli, and mod_php.



