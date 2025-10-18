import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class MessangerChats extends StatelessWidget {
  const MessangerChats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            _buildSearchBar(context),
            _buildStories(context),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _ChatItem(
                    imageUrl: 'assets/images/287_10.png',
                    name: 'Martin Randolph',
                    message: 'You: What’s man! · 9:40 AM',
                    isRead: true,
                  ),
                  _ChatItem(
                    imageUrl: 'assets/images/287_19.png',
                    name: 'Andrew Parker',
                    message: 'You: Ok, thanks! · 9:25 AM',
                    isRead: true,
                  ),
                  _ChatItem(
                    imageUrl: 'assets/images/287_29.png',
                    name: 'Karen Castillo',
                    message: 'You: Ok, See you in To… · Fri',
                    isRead: true,
                  ),
                  _ChatItem(
                    imageUrl: 'assets/images/287_44.png',
                    name: 'Maisy Humphrey',
                    message: 'Have a good day, Maisy! · Fri',
                    isRead: true,
                  ),
                  _ChatItem(
                    imageUrl: 'assets/images/287_39.png',
                    name: 'Joshua Lawrence',
                    message: 'The business plan loo… · Thu',
                    isRead: false,
                  ),
                  _AdItem(),
                  _ChatItem(
                    imageUrl: 'assets/images/287_5.png',
                    name: 'Maximillian Jacobson',
                    message: 'Messenger UI · Thu',
                    isRead: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/287_84.png'),
          ),
          const SizedBox(width: 12),
          Text(
            'Chats',
            style: GoogleFonts.sfProDisplay(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          _buildAppBarButton(Icons.camera_alt_outlined),
          const SizedBox(width: 12),
          _buildAppBarButton(Icons.edit_outlined),
        ],
      ),
    );
  }

  Widget _buildAppBarButton(IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.black, size: 22),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: GoogleFonts.sfProText(
            color: const Color(0xFF8E8E93),
            fontSize: 17,
          ),
          prefixIcon: const Icon(Icons.search, color: Color(0xFF8E8E93)),
          filled: true,
          fillColor: Colors.black.withOpacity(0.05),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }

  Widget _buildStories(BuildContext context) {
    return Container(
      height: 106,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          _StoryCircle(
            isYourStory: true,
            label: 'Your story',
          ),
          _StoryCircle(
            imageUrl: 'assets/images/287_62.png',
            label: 'Joshua',
            isOnline: true,
          ),
          _StoryCircle(
            imageUrl: 'assets/images/287_67.png',
            label: 'Martin',
            isOnline: true,
          ),
          _StoryCircle(
            imageUrl: 'assets/images/287_72.png',
            label: 'Karen',
            isOnline: true,
          ),
          _StoryCircle(
            imageUrl: 'assets/images/287_77.png',
            label: 'Martha',
            isOnline: true,
          ),
          _StoryCircle(
            imageUrl: 'assets/images/287_19.png',
            label: 'Andrew',
            isOnline: false,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(Icons.people),
              Positioned(
                right: -10,
                top: -4,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Color(0xFF5AD439),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '2',
                    style: GoogleFonts.sfProText(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.explore_outlined),
          label: '',
        ),
      ],
      currentIndex: 0,
      onTap: (index) {
        if (index == 1) {
          context.go('/messanger_people');
        }
      },
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.black,
      unselectedItemColor: const Color(0xFFA4AAB1),
      backgroundColor: const Color(0x99FFFFFF),
      elevation: 0,
    );
  }
}

class _StoryCircle extends StatelessWidget {
  final String? imageUrl;
  final String label;
  final bool isOnline;
  final bool isYourStory;

  const _StoryCircle({
    this.imageUrl,
    required this.label,
    this.isOnline = false,
    this.isYourStory = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: SizedBox(
        width: 52,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isYourStory ? Colors.black.withOpacity(0.04) : null,
                    image: isYourStory
                        ? null
                        : DecorationImage(
                            image: AssetImage(imageUrl!),
                            fit: BoxFit.cover,
                          ),
                  ),
                  child: isYourStory
                      ? const Icon(Icons.add, color: Colors.black)
                      : null,
                ),
                if (isOnline)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: const Color(0xFF5AD439),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 7),
            Text(
              label,
              style: GoogleFonts.sfProText(
                fontSize: 13,
                color: Colors.black.withOpacity(0.35),
                letterSpacing: -0.08,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String message;
  final bool isRead;

  const _ChatItem({
    required this.imageUrl,
    required this.name,
    required this.message,
    this.isRead = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imageUrl),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.sfProText(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      letterSpacing: -0.4,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    message,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.sfProText(
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.5),
                      letterSpacing: -0.15,
                    ),
                  ),
                ],
              ),
            ),
            if (isRead)
              const Icon(
                Icons.done_all,
                size: 16,
                color: Color(0xFFC2C5CC),
              ),
          ],
        ),
      ),
    );
  }
}

class _AdItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/287_108.png'),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Pixsellz',
                        style: GoogleFonts.sfProText(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          letterSpacing: -0.4,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Text(
                          'Ad',
                          style: GoogleFonts.sfProText(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(
                    'Make design process easier…',
                    style: GoogleFonts.sfProText(
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  Text(
                    'View More',
                    style: GoogleFonts.sfProText(
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
                'assets/images/287_115.png',
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}