KERL_CONFIGURE_OPTIONS:

```
export KERL_CONFIGURE_OPTIONS=--disable-hipe
docker build --build-arg ERLANG_VSN=21.1 --build-arg KERL_CONFIGURE_OPTIONS="--disable-hipe" -t apline-linux-erlang:21_1_disable_hipe .
```