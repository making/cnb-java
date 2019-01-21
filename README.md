```
$ pack version
v0.0.9 (git sha: a1a1a0eef63bd09136ab76663bdbc3b0ab3a4931)
```

```
./create-toml-milestone.sh
or
./create-toml-snapshot.sh

pack create-builder -b builder.toml making/cnb-java
```


```
cd my-java-app
pack build making/my-java-app --builder making/cnb-java
```
