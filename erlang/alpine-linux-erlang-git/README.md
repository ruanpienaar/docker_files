KERL_CONFIGURE_OPTIONS:

```
export KERL_CONFIGURE_OPTIONS=--disable-hipe
docker build --build-arg GIT_ERLANG_TAG=OTP-21.3.8 --build-arg KERL_CONFIGURE_OPTIONS="--disable-hipe" -t apline-linux-erlang:21_3_8_disable_hipe .
```