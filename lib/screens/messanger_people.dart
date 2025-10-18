import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class MessangerPeople extends StatelessWidget {
  const MessangerPeople({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            _buildSearchBar(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildStoryItem(),
                  _buildPersonItem(
                    imagePath: 'assets/images/287_380.png',
                    name: 'Martha Craig',
                    status: PersonStatus.online,
                  ),
                  _buildDivider(),
                  _buildPersonItem(
                    imagePath: 'assets/images/287_404.png',
                    name: 'Kieron Dotson',
                    status: PersonStatus.recent,
                    lastSeen: '8 min.',
                  ),
                  _buildDivider(),
                  _buildPersonItem(
                    imagePath: 'assets/images/287_418.png',
                    name: 'Zack John',
                    status: PersonStatus.recent,
                    lastSeen: '10 min.',
                  ),
                  _buildDivider(),
                  _buildPersonItem(
                    imagePath: 'assets/images/287_392.png',
                    name: 'Jamie Franco',
                    status: PersonStatus.online,
                  ),
                  _buildDivider(),
                  _buildPersonItem(
                    imagePath: 'assets/images/287_432.png',
                    name: 'Tabitha Potter',
                    status: PersonStatus.recent,
                    lastSeen: '10 min.',
                  ),
                  _buildSectionHeader('Recently active'),
                  _buildPersonItem(
                    imagePath: 'assets/images/287_447.png',
                    name: 'Albert Lasker',
                    status: PersonStatus.recent,
                    lastSeen: '30 min.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/287_483.png'),
          ),
          const SizedBox(width: 12),
          Text(
            'People',
            style: GoogleFonts.sfProDisplay(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          _buildAppBarIcon(Icons.chat_bubble_outline),
          const SizedBox(width: 8),
          _buildAppBarIcon(Icons.person_add_alt_1),
        ],
      ),
    );
  }

  Widget _buildAppBarIcon(IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black, size: 22),
        onPressed: () {},
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: GoogleFonts.sfProText(
            color: const Color(0xFF8E8E93),
            fontSize: 17,
            letterSpacing: -0.41,
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

  Widget _buildStoryItem() {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.add, color: Colors.black),
      ),
      title: Text(
        'Your story',
        style: GoogleFonts.sfProText(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        'Add to your story',
        style: GoogleFonts.sfProText(
          fontSize: 13,
          color: Colors.black.withOpacity(0.5),
        ),
      ),
      onTap: () {},
    );
  }

  Widget _buildPersonItem({
    required String imagePath,
    required String name,
    required PersonStatus status,
    String? lastSeen,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(imagePath),
          ),
          if (status == PersonStatus.online)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: const Color(0xFF5AD439),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
          if (status == PersonStatus.recent && lastSeen != null)
            Positioned(
              left: 2,
              bottom: -4,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                decoration: BoxDecoration(
                  color: const Color(0xFFC7F5BE),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Text(
                  lastSeen,
                  style: GoogleFonts.sfProText(
                    fontSize: 8,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
        ],
      ),
      title: Text(
        name,
        style: GoogleFonts.sfProText(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      trailing: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.07),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: const Icon(Icons.waving_hand, color: Colors.black, size: 16),
          onPressed: () {},
        ),
      ),
      onTap: () {},
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.only(left: 72, right: 16),
      child: Divider(
        height: 1,
        thickness: 0.5,
        color: Color.fromRGBO(0, 0, 0, 0.12),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
      child: Text(
        title.toUpperCase(),
        style: GoogleFonts.sfProText(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Colors.black.withOpacity(0.34),
        ),
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    final String currentPath = GoRouterState.of(context).uri.toString();

    return BottomAppBar(
      color: Colors.white.withOpacity(0.8),
      elevation: 0,
      child: Container(
        height: 52,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0xFFA6A6AA),
              width: 0.33,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.chat_bubble,
                  color: currentPath == '/messanger_chats'
                      ? Colors.black
                      : const Color(0xFFC7C7C7)),
              onPressed: () => context.go('/messanger_chats'),
            ),
            IconButton(
              icon: Icon(Icons.people,
                  color: currentPath == '/messanger_people'
                      ? Colors.black
                      : const Color(0xFFC7C7C7)),
              onPressed: () => context.go('/messanger_people'),
            ),
            IconButton(
              icon: const Icon(Icons.explore, color: Color(0xFFC7C7C7)),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

enum PersonStatus { online, recent }