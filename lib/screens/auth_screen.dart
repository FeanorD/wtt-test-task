import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wtt_test_task/widgets/auth/login_tab.dart';
import 'package:wtt_test_task/widgets/auth/signup_tab.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  List<String> _headers = [
    'See You There',
    'Create Account',
  ];

  TabController _tabController;
  int _currentTabIndex;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _currentTabIndex = _tabController.index;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFF820F),
                    Color(0xFFFB31FF),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    blurRadius: 15,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          _headers[_currentTabIndex],
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    ColoredBox(
                      color: Color.fromRGBO(0, 0, 0, 0.08),
                      child: TabBar(
                        controller: _tabController,
                        indicatorColor: Colors.white,
                        indicatorWeight: 3,
                        unselectedLabelColor: Colors.white.withOpacity(0.5),
                        labelStyle: Theme.of(context).textTheme.button.copyWith(
                          fontSize: 19,
                        ),
                        tabs: [
                          Tab(text: 'Sign up',),
                          Tab(text: 'Log in',),
                        ],
                        onTap: (index) {
                          setState(() {
                            _currentTabIndex = index;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: LayoutBuilder(
              builder: (context, constraints) {
//                print(constraints.smallest.height);
                return ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: constraints.smallest.height,
                  ),
                  child: TabBarView(
                    controller: _tabController,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      SingleChildScrollView(child: SignUpTab()),
                      SingleChildScrollView(child: LogInTab()),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
