# 基本操作列表


## 系统
---
    ``` php
    //获取系统时间戳
    $cts      = $bootstrap->cts(); 

    //临时缓存操作
    CoTemp::setIcon($k, Icon::ICON_GUILD_APPLY, 0);
    $apply_state = CoTemp::getIcon($k, Icon::ICON_GUILD_APPLY);

    //更新推送红点图标状态异步消息。
    $ipc = new \Application\Entity\IPC\AsyncIcon($k, [Icon::ICON_GUILD_APPLY]);
    $ipc->submit();

    //RPC
    $dr = YarClient::get($bootstrap, new YarRequestGuildWar($ctx->cross_dist_id, 'show'), $d1['guild_gid'], $client->uid);
    
    YarClient::async(new YarRequestGuildWar($ctx->cross_dist_id, 'doActionUpdateProfile'), [$guild_gid, ['logo_id' => $val]]);//异步

    //发送邮件消息
     \Application\Common\Mail::send($bootstrap, new SysMailMessage($uid, 0, '<MSG_201150>', "<MSG_201151|0_{$client->guild_name}>"));

    ```

## 模型操作
---
   ``` php
   //获取数据
   $d_base_guild_level = BaseGuildLevel::instance($bootstrap)->get($guild_level);

   //清缓存
   UserGuild::instance($bootstrap)->delGet($guild_id);
   UserGuildApply::instance($bootstrap)->delAll($guild_id);
   ```


## 事件
---
   ``` php
   //触发事件
   $bootstrap->dispatcher->dispatch(UserEvent::JOIN_GUILD, new UserEvent($client, ['ach_num' => 1]));

   //异步触发
   (new \Application\Entity\IPC\AsyncEventDispatch($client->uid, ReloadEvent::class, ReloadEvent::RELOAD, [Reloader::L_META]))
                ->submit();
   ```

## 资源
---
    ``` php
    //奖励
    // 实例化 奖励资源对象。
    $prize = new PrizeRes();
    // 设置推送模式（浮动）。
    $prize->setPushModal(Res::PUSH_FLOAT);
    // 添加道具。（公会币）
    $prize->addProp(14, $guild_coin);
    // 添加公会经验。
    $prize->addGuildExp($exp_t);

    // 也可以根据 解析奖励 JSON 数据并构建 PrizeRes 对象!
    $s = '{"e":2000,"g":10000,"p":{"10":[1],"13":[2,0.55]}}';
    $got = ResParser::parse($s);

    //消耗
    $consume = new SpendRes();
    $consume->addDiamond(10)  # 扣 10 钻石
        ->addProp(10, 1); # 扣道具 id#10 数量 x 1
    ```

>如果涉及消耗必须先执行 `Res::checkBeforeExecute` 方法进行检测
