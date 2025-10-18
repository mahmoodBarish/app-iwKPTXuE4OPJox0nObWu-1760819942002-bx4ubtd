import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MessangerSwipeActions extends StatelessWidget {
  const MessangerSwipeActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const _CustomAppBar(),
      body: Column(
        children: [
          const _StoriesSection(),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: _chatData.length,
              itemBuilder: (context, index) {
                final chat = _chatData[index];
                if (chat.isAd) {
                  return _AdItem(chat: chat);
                }
                return _ChatItem(chat: chat);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const _CustomBottomNavBar(),
    );
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color(0x99FFFFFF),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/287_286.png'),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Chats',
                    style: GoogleFonts.inter(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  _AppBarIcon(
                      icon: Icons.camera_alt_outlined,
                      onPressed: () {}),
                  const SizedBox(width: 8),
                  _AppBarIcon(icon: Icons.edit_outlined, onPressed: () {}),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: GoogleFonts.inter(
                      color: const Color(0xFF8E8E93), fontSize: 17),
                  prefixIcon: const Icon(Icons.search, color: Color(0xFF8E8E93)),
                  filled: true,
                  fillColor: const Color(0x0D000000),
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(116);
}

class _AppBarIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _AppBarIcon({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: const Color(0x0A000000),
        child: Icon(icon, color: Colors.black, size: 22),
      ),
    );
  }
}

class _StoriesSection extends StatelessWidget {
  const _StoriesSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 106,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        itemCount: _storyData.length,
        itemBuilder: (context, index) {
          final story = _storyData[index];
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    if (story.isAddButton)
                      const CircleAvatar(
                        radius: 26,
                        backgroundColor: Color(0x0A000000),
                        child: Icon(Icons.add, color: Colors.black, size: 28),
                      )
                    else
                      CircleAvatar(
                        radius: 26,
                        backgroundImage: AssetImage(story.imageUrl),
                      ),
                    if (story.isOnline)
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const CircleAvatar(
                          radius: 6,
                          backgroundColor: Color(0xFF5AD439),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  story.name,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ChatItem extends StatelessWidget {
  final _Chat chat;
  const _ChatItem({required this.chat});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(chat.name),
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.65,
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: const Color(0xFF0083FE),
            foregroundColor: Colors.white,
            icon: Icons.camera_alt,
          ),
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: const Color(0x0A000000),
            foregroundColor: Colors.black,
            icon: Icons.videocam,
          ),
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: const Color(0x0A000000),
            foregroundColor: Colors.black,
            icon: Icons.call,
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.65,
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: const Color(0x0A000000),
            foregroundColor: Colors.black,
            icon: Icons.menu,
          ),
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: const Color(0x0A000000),
            foregroundColor: Colors.black,
            icon: Icons.notifications,
          ),
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: const Color(0xFFFE294D),
            foregroundColor: Colors.white,
            icon: Icons.delete,
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(chat.imageUrl),
        ),
        title: Text(
          chat.name,
          style: GoogleFonts.inter(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          chat.lastMessage,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        trailing: chat.isRead
            ? const Icon(Icons.check_circle_outline,
                color: Color(0xFFC2C5CC), size: 16)
            : null,
      ),
    );
  }
}

class _AdItem extends StatelessWidget {
  final _Chat chat;

  const _AdItem({required this.chat});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(chat.imageUrl),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      chat.name,
                      style: GoogleFonts.inter(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Text(
                        'Ad',
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  chat.lastMessage,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                Text(
                  'View More',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF0084FD),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/287_317.png',
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}

class _CustomBottomNavBar extends StatelessWidget {
  const _CustomBottomNavBar();

  @override
  Widget build(BuildContext context) {
    final String currentPath = GoRouterState.of(context).uri.toString();
    int currentIndex = 0;
    if (currentPath == '/messanger_people') {
      currentIndex = 1;
    }

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == 0) {
          context.go('/messanger_chats');
        } else if (index == 1) {
          context.go('/messanger_people');
        }
      },
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble),
          label: 'Chats',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(Icons.people),
              Positioned(
                right: -8,
                top: -4,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Color(0x295AD439),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '2',
                    style: GoogleFonts.inter(
                      color: const Color(0xFF5AD439),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          label: 'People',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.explore_outlined),
          label: 'Discover',
        ),
      ],
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    );
  }
}

class _Story {
  final String name;
  final String imageUrl;
  final bool isOnline;
  final bool isAddButton;

  _Story({
    required this.name,
    this.imageUrl = '',
    this.isOnline = false,
    this.isAddButton = false,
  });
}

final List<_Story> _storyData = [
  _Story(name: 'Your story', isAddButton: true),
  _Story(
      name: 'Joshua',
      imageUrl: 'assets/images/287_264.png',
      isOnline: true),
  _Story(
      name: 'Martin',
      imageUrl: 'assets/images/287_269.png',
      isOnline: true),
  _Story(
      name: 'Karen',
      imageUrl: 'assets/images/287_274.png',
      isOnline: true),
  _Story(
      name: 'Martha',
      imageUrl: 'assets/images/287_279.png',
      isOnline: true),
  _Story(
      name: 'Andrew',
      imageUrl: 'assets/images/287_207.png',
      isOnline: false),
];

class _Chat {
  final String name;
  final String imageUrl;
  final String lastMessage;
  final bool isRead;
  final bool isAd;

  _Chat({
    required this.name,
    required this.imageUrl,
    required this.lastMessage,
    this.isRead = false,
    this.isAd = false,
  });
}

final List<_Chat> _chatData = [
  _Chat(
    name: 'Martin Randolph',
    imageUrl: 'assets/images/287_242.png',
    lastMessage: 'You: What’s man! · 9:40 AM',
    isRead: true,
  ),
  _Chat(
    name: 'Andrew Parker',
    imageUrl: 'assets/images/287_207.png',
    lastMessage: 'You: Ok, thanks! · 9:25 AM',
    isRead: true,
  ),
  _Chat(
    name: 'Maisy Humphrey',
    imageUrl: 'assets/images/287_217.png',
    lastMessage: 'Have a good day, Jacob! · Fri',
    isRead: true,
  ),
  _Chat(
    name: 'Karen Castillo',
    imageUrl: 'assets/images/287_227.png',
    lastMessage: 'You: Ok, See you in To… · Fri',
    isRead: true,
  ),
  _Chat(
    name: 'Joshua Lawrence',
    imageUrl: 'assets/images/287_251.png',
    lastMessage: 'The business plan loo…  · Thu',
  ),
  _Chat(
    name: 'Pixsellz',
    imageUrl: 'assets/images/287_310.png',
    lastMessage: 'Make design process easier…',
    isAd: true,
  ),
  _Chat(
    name: 'Maximillian Jacobson',
    imageUrl: 'assets/images/287_237.png',
    lastMessage: 'Messenger UI · Thu',
  ),
];