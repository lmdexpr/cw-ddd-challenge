# cw-ddd-challenge
https://chatwork.connpass.com/event/263334/

# 問題
## 対象ドメイン
チャットにおけるメッセージの予約送信を、コミニュケーションの心理的障壁軽減のために、ソフトウェアで解決する

## アクター
ユーザー（社会人）

## ユースケース
- ユーザーは、【チャット】の【名前】、【所属メンバー】などを設定する
- ユーザーは、【チャット】の【所属メンバー】に【メッセージ】を送信する
  - ユーザーは、【メッセージ】をすぐに送信するか、【送信予定時刻】を設定するかを選択できる
    - 過去の時刻に【送信予定時刻】を設定することはできない
- ユーザーは、【送信予定のメッセージ】を全て確認できる
- ユーザーは、【送信予定のメッセージ】を編集・削除できる
- ユーザーは、【送信予定のメッセージ】の【送信予定時刻】を変更できる
  - 過去の時刻に【送信予定時刻】を設定することはできない
- 【スケジューラー】は、【送信予定のメッセージ】を送信する

# 設計
## EventStorming
```mermaid
flowchart TD

subgraph chat initialization
  chat_created[A chat created]
  name_setted[A chat name setted]
  member_setted[A chat member setted]

  U0((User)) --> Create([Create a chat]) --> name_setted --> chat_created
  Create --> member_setted --> chat_created
end

message_sent[A message sent to a member in a chat]
U1((User)) --> SentMsg([Sent a message]) --> message_sent
chat_created --> message_sent

message_scheduled[A message scheduled to be sent to a member in the chat]
chat_created ---> message_scheduled
U2((User)) --> Schedule([Schedule a message]) --> message_scheduled

subgraph operations of scheduled messages
  listed[All my scheduled messages listed]
  U3((User)) --> Show([Show my list]) --> listed
  message_scheduled ----> listed

  edited[A my scheduled message edited]
  U4((User)) --> Edit([Edit a my scheduled message]) --> edited
  message_scheduled ----> edited

  deleted[A my scheduled message deleted]
  U5((User)) --> Delete([Delete a my scheduled message]) --> deleted
  message_scheduled ----> deleted

  configured[A schedule time of my message configured]
  U6((User)) --> Configure([Configure a time of a my scheduled message]) --> configured
  message_scheduled ----> configured
end

sent[Scheduled messages sent]
message_scheduled ------> sent
Scheduler((Scheduler)) --> SentSdl([Sent all scheduled messages]) --> sent
```
