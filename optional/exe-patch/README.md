# exe 补丁工具 / Executable Patch Tool

## 这是做什么的 / What it does

`limit8digit.pkm` 把「资源上限输入框」的长度从 6 位改成 8 位，但游戏本体里还有一个
**硬编码的上限 999999**（写在 `Application-steam-x64.exe` 里）。想真正填到 99999999，
需要改这 4 个字节。

`limit8digit.pkm` allows 8 digits, but the game still hard-caps the value at 999999.
That cap is a 4-byte constant inside `Application-steam-x64.exe`.

```
偏移 / offset : 0x7C317
原值 / before : 3F 42 0F 00   (= 999999)
新值 / after  : FF E0 F5 05   (= 99999999)
```

## 用法 / Usage

1. 双击 `apply-patch.bat`，按提示输入游戏目录（含 `Application-steam-x64.exe` 的那一层）
2. 脚本会自动备份原文件为 `Application-steam-x64.exe.orig_backup`
3. 想还原：双击 `restore.bat`

或直接传参 / or pass the path:

```
apply-patch.bat "D:\Banished"
```

## 安全说明 / Safety notes

- 只改这 4 个字节，其余部分不动
- 会先校验原字节；如果对不上（版本不同），**直接中止，不做任何修改**
- 重复运行是安全的（已打过补丁会提示"无需修改"）
- 原始文件备份在 exe 同目录，可随时还原

## 适用范围 / Supported builds

仅适用于 **Banished 1.0.7 build 170910**（exe 大小 2,132,176 字节）。
其它版本请勿使用。

Only for Banished 1.0.7 build 170910 (exe size 2,132,176 bytes).

## 免责 / Disclaimer

修改游戏可执行文件属于个人使用行为，请自行承担风险。
本项目**不提供**修改后的 exe 文件，只提供这个 4 字节补丁脚本。
