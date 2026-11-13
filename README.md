# Banished 功能模组合集 v1.0.0

[![版本](https://img.shields.io/github/v/release/fuguangbeta/banished-dsh-mods?label=%E7%89%88%E6%9C%AC&color=blue)](https://github.com/fuguangbeta/banished-dsh-mods/releases) ![游戏](https://img.shields.io/badge/%E6%B8%B8%E6%88%8F-Banished%201.0.7%20%28170910%29-8B5A2B) ![平台](https://img.shields.io/badge/%E5%B9%B3%E5%8F%B0-Windows-0078D4) [![许可](https://img.shields.io/github/license/fuguangbeta/banished-dsh-mods?label=%E8%AE%B8%E5%8F%AF)](https://github.com/fuguangbeta/banished-dsh-mods/blob/main/LICENSE) [![Star](https://img.shields.io/github/stars/fuguangbeta/banished-dsh-mods?label=Star&color=yellow)](https://github.com/fuguangbeta/banished-dsh-mods/stargazers) [![总下载](https://img.shields.io/github/downloads/fuguangbeta/banished-dsh-mods/total?label=%E6%80%BB%E4%B8%8B%E8%BD%BD&color=2ea44f)](https://github.com/fuguangbeta/banished-dsh-mods/releases)

## 关于本模组 · *About These Mods*

这是一组针对 Banished 1.0.7（build 170910）的轻量玩法调整，一共六个，每个功能一个独立文件。它们只改动游戏原有的几处数值与组件参数，不新增建筑、不替换贴图、不引入任何外部素材，六个加起来不到 30 KB。

设计上刻意保持「一个功能一个开关」：想要什么就放什么进去，不想要直接删掉对应文件，彼此之间没有依赖。模组一旦做成合集，用户就很难只留其中一两项；拆开之后，取舍权在自己手里。

六个模组都建立在同一个前提上：**只对之后新建的东西生效**。已经建好的谷仓不会因为装了模组就突然变大，已经生成的墓碑也不会因为改了寿命而提前消失。这是存档本身的机制，不是模组的取舍。

有一点需要提前说明：这些模组采用「覆盖原版模板」的方式实现，所以与修改同类内容的模组天然冲突。如果你在玩 MegaMod、Colonial Charter 这类大型合集，基本上装不上。具体见第 5 节。

地形工具是这组里唯一需要动手操作的功能。它借用了游戏里采石场那套「建成即重塑地形」的机制，用 1×1 的模板把改动范围压到单格，从而绕开原版「坡度太大不能建造」的限制。用法和边界在第 3 节写清楚了，建议先读一遍。

This is a small set of gameplay tweaks for Banished 1.0.7 (build 170910): six mods, one file each. They only change a handful of existing values and component parameters, with no new buildings, no replacement textures and no external assets, so the whole set stays under 30 KB.

The design keeps one feature per switch on purpose: drop in what you want, delete what you do not, and nothing depends on anything else. Mod packs tend to remove that choice; keeping the files separate keeps it with you.

All six share one premise: **changes apply only to things built afterwards**. A storage barn already placed does not grow, and a tombstone already in the ground does not expire sooner. That is how the saves work, not a limitation added here.

One thing worth stating up front: these mods work by overriding vanilla templates, so they conflict with anything that touches the same content. Large overhaul packs such as MegaMod or Colonial Charter will almost certainly not work alongside them. See section 5.

The terrain tools are the only part that needs hands-on use. They borrow the quarry mechanism that reshapes the ground when a building completes, and squeeze its footprint down to a single tile with a 1x1 template, which sidesteps the vanilla slope check. Section 3 covers usage and limits; reading it first is worthwhile.

---
## 1. 模组清单 · *Mod List*

六个文件都放在 mods/ 目录下。

All six files live in mods/.

| 文件 · File | 名称 · Name | 改动 · What it changes |
|---|---|---|
| storage10x.pkm | 存储容量提升 | 堆料场 250→2500、谷仓 6000→60000、市场 10000→100000、贸易站 60000→600000、手推车 2500→25000 |
| infinitemine.pkm | 采石场与矿井无限产出 | 铁矿井与采石场最大产量 2000→2147483647 |
| pasture2x.pkm | 牧场容量提升 | 牛 20→10、羊 16→8、鸡 6→3 |
| limit8digit.pkm | 资源上限提升 | 资源上限输入框最大位数 6→8 位 |
| terratools.pkm | 地形工具 | 三个 1×1 工具：抬高 1 格 / 降低 1 格 / 整平 |
| tombstonehalf.pkm | 墓碑留存时间减半 | 墓碑寿命 60→30 个月，容差 12→6 |

---

### 1.1 存储容量提升 · *Storage x10*

改的是存储建筑的容量上限。堆料场给到 2500，谷仓 60000，市场 100000，贸易站 600000，手推车 25000。倍数统一按十倍算，没有再往上堆——再大也不会让搬运变快，只是把「仓库满了」的提示往后推。

Raises the capacity ceiling of the storage buildings by a factor of ten. Going higher would not make hauling any faster; it would only postpone the storage-full notice.

### 1.2 采石场与矿井无限产出 · *Infinite Mine and Quarry*

铁矿井和采石场原本有 2000 的总产量，挖完变成废墟。这里改成 2147483647，实际效果就是永远挖不完。适合那种不想每隔几年重开一座矿的存档。

Iron Mine and Quarry hold 2000 units before turning into ruins. Setting the total to 2147483647 means they never run out.

### 1.3 牧场容量提升 · *Pasture x2*

牧场能养多少牲畜，取决于牧场面积除以每头牲畜的占用面积。把占用面积减半，同样一块地就能养两倍。牛、羊、鸡三种都改了。

Pasture capacity is pasture area divided by the required area per animal. Halving the requirement doubles the capacity for cows, sheep and chickens alike.

### 1.4 资源上限提升 · *Bigger Resource Limit Input*

城镇大厅与生产建筑的资源上限输入框，原本最多 6 位数字。改成 8 位之后，输入框宽度也相应加宽，不至于数字被截断。

游戏本体里还有一个 999999 的硬上限写在可执行文件里，改模组绕不过去。想真正填到 99999999，见第 4 节。

The resource limit spinner allowed six digits; this allows eight, with a wider box so the value is not clipped.

The game also hard-caps the value at 999999 inside the executable, which no mod can reach. See section 4.

### 1.5 地形工具 · *Terrain Tools*

三个 1×1 工具，用来改单格地形。用法、边界和注意事项都在第 3 节。

Three 1x1 tools for single-tile terrain edits. See section 3.

### 1.6 墓碑留存时间减半 · *Tombstone Lifetime Halved*

墓碑默认站 60 个月，公墓很容易被旧墓碑占满。改成 30 个月、容差 6 个月之后，腾出的位置大约是原来的两倍。

Tombstones stand for 60 months by default, which fills cemeteries quickly. At 30 months with a 6-month tolerance, roughly twice as many graves free up.

---
## 2. 安装与卸载 · *Installation and Removal*

### 2.1 安装步骤 · *Steps*

1. 完全关闭游戏
2. 打开游戏安装目录下的 WinData 文件夹
3. 把想用的 .pkm 复制进去
4. 启动游戏，在主菜单的「模组」列表里勾选
5. 读档或开新局

1. Close the game completely.
2. Open the WinData folder inside your Banished installation.
3. Copy in the .pkm files you want.
4. Start the game and tick them in the Mods list on the main menu.
5. Load a save or start a new game.

路径形如 D:/Banished/WinData/。放进去就算安装，删掉就算卸载，不需要安装器，也不会写注册表以外的东西。

The path looks like D:/Banished/WinData/. Copying a file in installs it; deleting it removes it. No installer is involved.

### 2.2 卸载 · *Removal*

删掉 WinData 下对应的 .pkm 即可。六个文件互不依赖，可以只删其中一个。

Delete the matching .pkm from WinData. The six files do not depend on each other, so removing one leaves the rest working.

已经建好的建筑不会因为卸载而丢失，只是新建的恢复原版数值。

Buildings already placed are not lost when you remove a mod; only new construction goes back to vanilla values.

---

## 3. 地形工具 · *Terrain Tools*

原版里坡地上放不了建筑，判定写在引擎里，模组改不到。地形工具的思路是换个方向：先用一个 1×1 的建筑把那一格地形改成能盖的样子，再拆掉它，然后正常建造。

Vanilla refuses buildings on sloped ground, and that check lives in the engine where no mod can reach it. The terrain tools take a different route: place a 1x1 structure that reshapes that one tile, demolish it, then build normally.

### 3.1 三个工具 · *The Three Tools*

| 工具 · Tool | 作用 · Effect |
|---|---|
| 地形抬高 1 格 | 把该格地形抬高一层 |
| 地形降低 1 格 | 把该格地形降低一层 |
| 地形整平 | 把该格压到与点击处一致的、可以盖建筑的高度 |

三个工具都是零造价、零工作量，放下即完成。图标是绿箭头、红箭头和蓝色横杠，位于建造菜单里。

All three are free, instant, and sit in the build menu with a green up arrow, a red down arrow and a blue bar.

### 3.2 操作流程 · *Workflow*

1. 选地形工具，点要改的那一格
2. 地形立刻改变，原地留下一小块标记（一块小石碑）
3. 用「拆除建筑」工具把它拆掉，或点它面板里的拆除按钮
4. 拆完后该格清空，可以正常盖房子

拆掉的只是标记，地形改动是永久的。

1. Pick a terrain tool and click the tile.
2. The ground changes at once and a small marker is left behind.
3. Remove it with the demolish tool, or use the button in its panel.
4. The tile is now free for normal construction.

Only the marker is removed; the terrain change is permanent.

### 3.3 为什么是 1×1 · *Why One Tile*

游戏里能重塑地形的组件（采石场那套）作用范围由它引用的地板网格决定，跟建筑占地无关。全游戏只有少数几个建筑带真正的平地板，其中最小的是木桥的桥面，正好一格。所以工具的范围被锁在一格 —— 这不是省事，是唯一能用的尺寸。

The component that reshapes terrain (the one quarries use) follows the floor mesh it references, not the building footprint. Only a few buildings ship a genuinely flat floor mesh, and the smallest is the wooden bridge deck at exactly one tile. That is why the tools work on a single tile: it is the only size available.

### 3.4 使用限制 · *Limits*

- 在水面上「降低」不会挖深河床。地形深度是相对该格表面算的，水面上的表面就是水面，所以结果是把河床抬到水面下方一格，看起来反而变浅
- 地形高度有下限，连续降低到某个程度后不再变化，这是地形数据的边界
- 工具本身需要手动拆除，不会自动消失

- Lowering on water does not deepen the riverbed. Depth is measured from the tile surface, which on water is the water level, so the result raises the bed to just below the surface.
- Terrain has a floor limit; repeated lowering eventually stops having an effect.
- The marker must be removed manually; it does not disappear on its own.

---

## 4. 资源上限提升与可执行文件补丁 · *Bigger Resource Limit and the Executable Patch*

limit8digit.pkm 只是把输入框放宽到 8 位。游戏本体里还有一个 999999 的上限写在 Application-steam-x64.exe 里，模组改不到。

limit8digit.pkm only widens the input box to eight digits. The game itself still caps the value at 999999, and that constant lives inside Application-steam-x64.exe.

想真正填到 99999999，需要改四个字节：

To reach 99999999 you need a four-byte patch:
```
偏移 offset : 0x7C317
原值 before : 3F 42 0F 00   (999999)
新值 after  : FF E0 F5 05   (99999999)
```

仓库里的 optional/exe-patch/ 提供了脚本：

The optional/exe-patch/ folder ships a patcher:

- apply-patch.bat 双击运行，按提示输入游戏目录
- 脚本会先校验原字节，对不上就中止，不做任何修改
- 会自动备份原文件为 Application-steam-x64.exe.orig_backup
- restore.bat 用于还原

- apply-patch.bat prompts for the game folder and patches in place.
- It verifies the original bytes first and aborts without touching anything if they do not match.
- It backs the original up as Application-steam-x64.exe.orig_backup.
- restore.bat puts the backup back.

**仓库不提供改好的 exe 文件。** 补丁只适用于 1.0.7 build 170910，其它版本请勿使用。

**This repository does not ship a patched executable.** The patch applies to 1.0.7 build 170910 only.

不打这个补丁也可以正常使用其它五个模组，只是资源上限停在 999999。

The other five mods work fine without the patch; the limit simply stays at 999999.

---

## 5. 兼容性 · *Compatibility*

六个模组都通过覆盖原版模板实现，所以只要别的模组改了同一处内容，就会冲突。

All six work by overriding vanilla templates, so any mod that touches the same content will conflict.

| 模组 · Mod | 冲突对象 · Conflicts with |
|---|---|
| 存储容量提升 | 任何修改谷仓 / 堆料场 / 市场 / 贸易站 / 手推车的模组 |
| 采石场与矿井无限产出 | 任何修改铁矿井 / 采石场的模组 |
| 牧场容量提升 | 任何修改牲畜的模组 |
| 资源上限提升 | 任何修改资源上限输入框的模组 |
| 墓碑留存时间减半 | 任何修改墓碑的模组 |
| 地形工具 | 任何同样占用 debug / noise / capture 三个隐藏工具栏位置的模组 |

大型合集基本等同全冲突：MegaMod、Colonial Charter、RK Editor Choice 等。

Large overhaul packs conflict with all of the above: MegaMod, Colonial Charter, RK Editor Choice and similar.

地形工具额外说明：原版建造菜单里有三个隐藏的开发者按钮（debug、noise、capture），玩家正常情况下调不出来。工具复用了这三个位置来注册自己，这样就不必改动整张建造菜单清单 —— 改清单会和所有建筑类模组冲突。代价是原版这三个隐藏按钮被替换掉了。

A note on the terrain tools: the vanilla build menu contains three hidden developer buttons (debug, noise, capture) that players cannot normally reach. The tools reuse those three slots instead of editing the whole toolbar list, because editing the list conflicts with every building mod. The trade-off is that those three hidden buttons are replaced.

---

## 6. 已知限制 · *Known Limitations*

- 存储、牧场、矿井、墓碑的改动只对新建内容生效，已有建筑与墓碑保持原样
- 地形工具一次只能改一格，大面积施工需要一格一格来
- 地形工具在水面上的深度基准是水面，不能用来挖深河道
- 地形工具的标记需要手动拆除
- 资源上限的 999999 硬上限需要改 exe，模组无法突破

- Storage, pasture, mine and tombstone changes apply only to new content; existing buildings and graves keep their original values.
- The terrain tools change one tile at a time; large areas take repeated use.
- On water, terrain depth is measured from the water surface, so the tools cannot dredge a river.
- Terrain tool markers must be removed manually.
- The 999999 resource cap lives in the executable and cannot be raised by a mod.

---

## 系统要求 · *System Requirements*

| 项 | 要求 |
|------|------|
| 游戏 | Banished 1.0.7 build 170910（Steam 版与非 Steam 版均可） |
| 平台 | Windows |
| 安装位置 | 游戏目录下的 WinData 文件夹 |
| 第三方依赖 | 无 |
| 存档影响 | 只影响新建内容，已有存档可继续使用 |

| Item | Requirement |
|------|------|
| Game | Banished 1.0.7 build 170910 (Steam or non-Steam) |
| Platform | Windows |
| Install location | The WinData folder inside the game directory |
| Third-party dependencies | None |
| Save impact | New content only; existing saves keep working |

---

## 常见问题 · *Frequently Asked Questions*

**装进去之后建造菜单里没有变化？**
存储、牧场、矿井、墓碑这几个模组改的是既有建筑，不会新增按钮，直接看建筑界面里的数值即可。只有地形工具会在建造菜单里多出三个图标。

**地形工具的图标在哪？**
建造菜单里找绿箭头、红箭头和蓝色横杠，原版没有这三个图标。

**地形工具放了之后拆不掉？**
用「拆除建筑」工具框选它，或者点它打开面板用拆除按钮。拆除后标记消失，地形改动保留。

**为什么地形工具只能改一格？**
作用范围由所引用的地板网格决定，全游戏最小的纯平地板就是木桥桥面，正好一格。见第 3.3 节。

**资源上限为什么还是只能填到 999999？**
那是写在 exe 里的硬上限，需要打 optional/exe-patch/ 里的补丁。见第 4 节。

**能和 MegaMod 一起用吗？**
基本不能。两者改的是同一批模板，谁后加载谁生效，结果不可预期。

**为什么改完数值，老存档里的谷仓没变大？**
容量在建筑建成时就写定了。拆掉重建，或者新开一局。

**Nothing new appears in the build menu after installing.**
Storage, pasture, mine and tombstone mods change existing buildings, so no new buttons appear. Only the terrain tools add three icons.

**Where are the terrain tool icons?**
Look for a green up arrow, a red down arrow and a blue bar in the build menu.

**A terrain tool marker cannot be removed.**
Use the demolish tool and drag over it, or click it and use the button in its panel. The terrain change stays.

**Why do the terrain tools only cover one tile?**
The area follows the referenced floor mesh, and the smallest flat mesh in the game is the wooden bridge deck at one tile. See section 3.3.

**Why is the resource limit still capped at 999999?**
That cap lives in the executable and needs the patch in optional/exe-patch/. See section 4.

**Does this work with MegaMod?**
Almost certainly not. Both change the same templates, and the result depends on load order.

**Why did my existing storage barn not get bigger?**
Capacity is written when a building is completed. Demolish and rebuild, or start a new game.

---

> [GitHub Releases](https://github.com/fuguangbeta/banished-dsh-mods/releases) — 下载最新版本 · *Download Latest Release*

---

## 许可 · *License*

MIT，见 [LICENSE](LICENSE)。*MIT, see [LICENSE](LICENSE).*

修改游戏可执行文件属于个人使用行为，请自行承担风险；本仓库不提供修改后的 exe 文件，也不包含任何游戏本体资源。

Modifying a game executable is a personal choice at your own risk. This repository ships no patched executable and contains no game assets.

---

## 反馈 · *Feedback*

遇到问题请提交 issue，附上游戏版本、已启用的模组列表和复现步骤。

Please open an issue with the game build, the list of enabled mods and steps to reproduce.
