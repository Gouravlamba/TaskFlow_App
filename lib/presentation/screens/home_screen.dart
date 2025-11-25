import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:taskflow/presentation/widgets/custom_home_appbar.dart';
import 'package:taskflow/presentation/widgets/gif_widget.dart';

import '../../logic/task/task_cubit.dart';
import '../../logic/task/task_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildProfileDrawer(),
      appBar: CustomHomeAppBar(title: ""),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            final total = state.tasks.length;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Welcome ',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Image.asset(
                      'assets/images/hello.png',
                      height: 30,
                      width: 50,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text('Manage your daily tasks easily.'),
                const SizedBox(height: 24),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFF875AA),
                        Color.fromARGB(190, 241, 147, 65),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Card(
                    elevation: 0,
                    color: Colors.transparent,
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total Tasks',
                            style: TextStyle(
                              color: Color(0xFF11224E),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '$total',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF11224E),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Open the Tasks tab to view your list.'),
                      ),
                    );
                  },
                  icon: const Icon(Icons.checklist),
                  label: const Text('Go to Tasks'),
                ),
                const SizedBox(height: 24),
                const GifWidget(),
              ],
            );
          },
        ),
      ),
    );
  }

//drawer
  Drawer _buildProfileDrawer() {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 20, 31, 58),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 20, 31, 58),
            ),
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Color(0xFF11224E)),
                ),
                SizedBox(height: 12),
                Text(
                  "Gourav",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 4),
                Text(
                  "gouravlambha007@.com",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.white),
            title:
                const Text("Settings", style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          SwitchListTile(
            secondary: const Icon(Icons.dark_mode, color: Colors.white),
            title:
                const Text("Dark Mode", style: TextStyle(color: Colors.white)),
            value: false,
            onChanged: (value) {},
          ),
          const Divider(color: Colors.white30),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.redAccent),
            title: const Text(
              "Logout",
              style: TextStyle(color: Colors.redAccent),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
