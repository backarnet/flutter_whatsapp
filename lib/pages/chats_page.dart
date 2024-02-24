import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/char_summary.dart';
import '../widgets/my_badge.dart';
import 'tab_page.dart';

const Color white = Color(0xFFFFFFFF);
const Color grey = Color(0xFF8696A0);
const Color green = Color(0xFF25D366);
const Color blue = Color(0xFF53BDEB);
final DateFormat formatter = DateFormat('yyyy-MM-dd');

final Map<ChatState?, Widget> stateIcon = {
  null: const SizedBox(),
  ChatState.wait: const Icon(Icons.access_time_rounded, color: grey, size: 14),
  ChatState.sent: const Icon(Icons.done, color: grey, size: 20),
  ChatState.received: const Icon(Icons.done_all, color: grey, size: 20),
  ChatState.read: const Icon(Icons.done_all, color: blue, size: 20),
};

final Map<MediaType, Widget> mediaIcon = {
  MediaType.text: const SizedBox(),
  MediaType.voice: const Icon(Icons.mic, color: grey),
  MediaType.audio: const Icon(Icons.headphones, color: grey),
  MediaType.photo: const Icon(Icons.photo, color: grey),
  MediaType.video: const Icon(Icons.videocam, color: grey),
  MediaType.sticker: const Icon(Icons.sticky_note_2_rounded, color: grey),
};

class ChatsPage extends TabPage {
  const ChatsPage({required super.pageTitle, required super.badge, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ChatRow(
            chat: ChatSummary(
          chatType: ChatType.group,
          sender: 'You',
          title: 'احتياطي',
          chatState: ChatState.received,
          mediaType: MediaType.audio,
          lastMessageTime: DateTime.parse('2024-02-22'),
          pinned: true,
        )),
        ChatRow(
            chat: ChatSummary(
          title: 'صور حوالات',
          mediaType: MediaType.photo,
          lastMessageTime: DateTime.parse('2024-02-23'),
          chatType: ChatType.group,
          sender: 'شادي',
          lastMessageText: 'محمد محمد',
          pinned: true,
          unreadCount: 7,
        )),
        ChatRow(
            chat: ChatSummary(
          title: 'كوين: ادلب/انطاكيا',
          mediaType: MediaType.text,
          lastMessageTime: DateTime.parse('2024-02-23'),
          chatType: ChatType.group,
          sender: 'سامي',
          lastMessageText: 'محمد حمد\n41\$واحد واربعون دولار\nادلب المدينه',
          pinned: true,
        )),
      ],
    );
  }
}

class ChatRow extends StatelessWidget {
  const ChatRow({required this.chat, super.key});

  final ChatSummary chat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: grey.withOpacity(.4),
              borderRadius: BorderRadius.circular(25)),
          child: Icon(
              chat.chatType == ChatType.group ? Icons.group : Icons.person,
              color: white,
              size: 30),
        ),
        title: Text(chat.title),
        subtitle: Row(children: [
          stateIcon[chat.chatState]!,
          SizedBox(width: chat.chatState == null ? 0 : 5),
          chat.sender != null ? Text('${chat.sender}: ') : const SizedBox(),
          mediaIcon[chat.mediaType]!,
          SizedBox(width: chat.mediaType == MediaType.text ? 0 : 5),
          Flexible(
            child: Text(
              chat.lastMessageText.replaceAll('\n', ' '),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
            ),
          ),
        ]),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              formatter.format(chat.lastMessageTime),
              style: TextStyle(
                  color: chat.unreadCount > 0 ? green : grey, fontSize: 12),
            ),
            const SizedBox(height: 7),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform.rotate(
                  angle: .7,
                  child: chat.pinned
                      ? const Icon(Icons.push_pin, color: grey)
                      : const SizedBox(),
                ),
                SizedBox(width: chat.unreadCount > 0 ? 5 : 0),
                chat.unreadCount > 0
                    ? MyBadge(
                        text: chat.unreadCount.toString(),
                        size: 20,
                        backgroundColor: green,
                        foregroundColor: white,
                      )
                    : const SizedBox(),
              ],
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
