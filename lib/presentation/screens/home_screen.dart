import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp/domain/entities/user_entity.dart';
import 'package:whatsapp/presentation/bloc/auth/auth_cubit.dart';
import 'package:whatsapp/presentation/pages/calls_page.dart';
import 'package:whatsapp/presentation/pages/camera_page.dart';
import 'package:whatsapp/presentation/pages/chat_page.dart';
import 'package:whatsapp/presentation/pages/status_page.dart';
import 'package:whatsapp/presentation/widgets/custom_tab_bar.dart';
import 'package:whatsapp/presentation/widgets/theme/style.dart';

class HomeScreen extends StatefulWidget {
  final UserEntity userInfo;

  const HomeScreen({Key? key, required this.userInfo}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearch = false;
  int _currentPageIndex = 1;
  final PageController _pageViewController = PageController(initialPage: 1);

  List<Widget> get _pages => [
        const CameraPage(),
        ChatPage(
          userInfo: widget.userInfo,
        ),
        const StatusPage(),
        const CallsPage(),
      ];

  _buildSearch() {
    return Container(
      height: 45,
      margin: const EdgeInsets.only(top: 25),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(.3),
            spreadRadius: 1,
            offset: const Offset(0.0, 0.50))
      ]),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search...",
          prefixIcon: InkWell(
            onTap: () {
              setState(() {
                _isSearch = false;
              });
            },
            child: const Icon(Icons.arrow_back),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentPageIndex != 0
          ? AppBar(
              elevation: 0.0,
              automaticallyImplyLeading: false,
              backgroundColor:
                  _isSearch == false ? primaryColor : Colors.transparent,
              title: _isSearch == false
                  ? const Text("WhatsApp Clone")
                  : const SizedBox(
                      height: 0.0,
                      width: 0.0,
                    ),
              flexibleSpace: _isSearch == false
                  ? const SizedBox(
                      height: 0.0,
                      width: 0.0,
                    )
                  : _buildSearch(),
              actions: <Widget>[
                IconButton(
                  onPressed: () {
                    /*setState(() {
                      _isSearch = true;
                    });*/
                  },
                  icon: const Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {
                    BlocProvider.of<AuthCubit>(context).loggedOut();
                  },
                  icon: const Icon(Icons.logout_rounded),
                )
              ],
            )
          : null,
      body: Column(
        children: <Widget>[
          _isSearch == false
              ? _currentPageIndex != 0
                  ? CustomTabBar(index: _currentPageIndex)
                  : const SizedBox(
                      height: 0.0,
                      width: 0.0,
                    )
              : const SizedBox(
                  height: 0.0,
                  width: 0.0,
                ),
          Expanded(
            child: PageView.builder(
              itemCount: _pages.length,
              controller: _pageViewController,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              itemBuilder: (_, index) {
                return _pages[index];
              },
            ),
          )
        ],
      ),
    );
  }
}
