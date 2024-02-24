enum ChatState { wait, sent, received, read }

enum MediaType { text, voice, audio, photo, sticker, video }

enum ChatType { personal, group }

class ChatSummary {
  ChatType chatType;
  String? imageUrl;
  String title;
  ChatState? chatState;
  String? sender;
  MediaType mediaType;
  String lastMessageText;
  DateTime lastMessageTime;
  int unreadCount;
  bool pinned;

  ChatSummary({
    this.chatType = ChatType.personal,
    this.imageUrl,
    required this.title,
    this.chatState,
    this.sender,
    required this.mediaType,
    this.lastMessageText = '',
    required this.lastMessageTime,
    this.unreadCount = 0,
    this.pinned = false,
  }) {
    assert(((chatType == ChatType.group) == (sender != null)));
    if (mediaType != MediaType.text && lastMessageText.isEmpty) {
      switch (mediaType) {
        case MediaType.voice:
          lastMessageText = '0:04';
          break;
        case MediaType.audio:
          lastMessageText = 'Audio';
          break;
        case MediaType.photo:
          lastMessageText = 'Photo';
          break;
        case MediaType.sticker:
          lastMessageText = 'Sticker';
          break;
        case MediaType.video:
          lastMessageText = 'Video';
          break;
        default:
      }
    }
  }
}
