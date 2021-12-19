# 一键部署soga

## 功能介绍

soga 后端同时支持 VMess、VLESS、Trojan、Shadowsocks、ShadowsocksR 协议，支持多个面板对接，功能丰富

------

**soga 后端特点**

- 专为面板对接打造，**`全新实现`** 每个协议，**`极致优化`** 内存和性能
- 配置简单明了，容易对接
- 一个软件即支持所有协议，无需安装其它软件
- **`全局限制`** 用户连接的 IP 数/设备数
- 方便的 **`一键安装`**、管理脚本
- 支持 VLESS 协议，支持 VMessAEAD，支持 xtls，支持 VMess FullCone 等众多 xray 特性
- soga 实现的 trojan、ss、ssr 均支持 UDP FullCone
- dns 流媒体解锁
- 多路由多出口负载均衡
- 多 ip 机器下可自动选择入口 ip 做为出口 ip
- 集成 [pass 隧道](https://pass.yougotme.cc)入站，隧道也可以获取用户真实 IP



## **社区版与商业版区别**

|                                                |       社区版 Community       | 商业授权版 Enterprise |
| :--------------------------------------------: | :--------------------------: | :-------------------: |
|         自动选择出口 ip（多 ip 机器）          |              ×               |           √           |
| 内置 [pass 隧道](https://pass.yougotme.cc)入站 |              ×               |           √           |
|                  其他所有功能                  |              √               |           √           |
|                随时更新到最新版                |              √               |           √           |
|                   配置授权码                   |            不需要            |     通过购买获得      |
|                  推荐使用场景                  | 学习、测试、88人以下团队使用 |        无限制         |
|                   支持用户数                   |              88              |        无限制         |

> 88 用户指面板有效用户，当有效用户超过 88 人时，只有前 88 人才能使用，后面的用户自动截断
>
> 有效用户通常指套餐未到期、流量未超的用户，简而言之：能正常使用代理的用户就算一个有效用户，否则不算。



## 一键部署

```shell
yum -y install git && git clone https://gitee.com/gz1903/docker_soga.git /usr/local/src/docker_soga && cd /usr/local/src/docker_soga && chmod +x docker_soga.sh && ./docker_soga.sh
```

![soga](https://cdn.jsdelivr.net/gh/gz1903/tu/soga.png)

需要填写信息：`前端ip或域名`、`对接的面板`、`对接的类型`、`通讯密钥`、`节点ID`

**以V2board为例：**

通讯密钥：

![soga](https://cdn.jsdelivr.net/gh/gz1903/tu/soga4.png)

编辑节点：

![soga](https://cdn.jsdelivr.net/gh/gz1903/tu/soga2.png)

节点管理：获取NodeID为4

![soga](https://cdn.jsdelivr.net/gh/gz1903/tu/soga3.png)



```shell
请输入V2board的IP或者域名（格式：http://x.x.x.x或者https://x.x.x.x）: http://192.168.120.128

请输入需要对接的后端，输入1或2（1.v2board 2.sspanel）: 1
正在对接v2board，请稍等~

请输入需要后端对接类型，输入1或2（1.v2ray 2.trojan）: 1
正在对接v2ray，请稍等~

请输入对接节点ID，Node_ID：4

请输入V2board与服务端通讯的密钥（或sspanel-Mukey）：12434539271243453927
#######################################################################
#                                                                     #
#                  正在部署soga  时间较长请稍等~                          #
#                                                                     #
#######################################################################
d446de553f8ca6c251b57b1275358bb6406ea50b3715d8a35c015e23e4de2cb1
0=部署完成，已授权无限制
--------------------------- 已完成 ---------------------------
 文件目录     :/etc/soga
 安装日志文件 :/var/log/soga_LuFly_2021-12-19_19:05:43.log
------------------------------------------------------------------
 如果安装有问题请反馈安装日志文件。
 使用有问题请在这里寻求帮助:https://gz1903.github.io
 电子邮箱:v2board@qq.com
------------------------------------------------------------------
```

