import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lesson 6',
      themeMode: _themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey.shade100,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: HomePage(
        themeMode: _themeMode,
        onToggleTheme: toggleTheme,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;

  const HomePage({
    super.key,
    required this.themeMode,
    required this.onToggleTheme,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    final List<Map<String, String>> chats = [
        
        {'name': 'Алексей', 'message': 'Привет! Как дела?', 'time': '12:30', 'letter': 'А'},
    {'name': 'Flutter Group', 'message': 'Новое задание 👨‍💻', 'time': '11:15', 'letter': 'F'},
    {'name': 'Мама', 'message': 'Позвони мне', 'time': '10:02', 'letter': 'М'},
    {'name': 'Telegram', 'message': 'Обновление приложения', 'time': 'Вчера', 'letter': 'T'},
  ];
    final List<Map<String, String>> calls = [
    {
      'name': 'Мама',
      'date': 'Сегодня',
      'letter': 'М',
      'incoming': 'true',
    },
    {
      'name': 'Алексей',
      'date': 'Вчера',
      'letter': 'А',
      'incoming': 'false',
    },
    {
      'name': 'Мария',
      'date': '20 мая',
      'letter': 'М',
      'incoming': 'true',
    },
  ];
  final List<Map<String, String>> contacts = [
  {'name': 'Алексей', 'status': 'в сети', 'letter': 'А'},
  {'name': 'Мария', 'status': 'в сети', 'letter': 'М'},
  {'name': 'Данияр', 'status': 'в сети', 'letter': 'Д'},
  {'name': 'Айдана', 'status': 'в сети', 'letter': 'А'},
  {'name': 'Flutter Teacher', 'status': 'в сети', 'letter': 'F'},
];
   
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    Center(
      child: Text('Добро пожаловать!', style: TextStyle(fontSize: 24)),
    ),
    Center(
      child: Text('Мои заказы', style: TextStyle(fontSize: 24)),
    ),
    Center(
      child: Text('Мой профиль', style: TextStyle(fontSize: 24)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
      ['Telegram', 'Звонки', 'Контакты'][_selectedIndex],
        ),
      ),
      drawer: AppDrawer(
        themeMode: widget.themeMode,
        onToggleTheme: widget.onToggleTheme,
      ),
    body: _selectedIndex == 0
    ? ListView.separated(
        itemCount: chats.length,
        separatorBuilder: (context, index) => const Divider(
          height: 1,
          indent: 72,
        ),
        itemBuilder: (context, index) {
          final chat = chats[index];

          return ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 6,
            ),
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: const Color(0xFF8CCCF8),
              child: Text(
                chat['letter']!,
                style: const TextStyle(
                  color: Color(0xFF174766),
                  fontSize: 20,
                ),
              ),
            ),
            title: Text(
              chat['name']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              chat['message']!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(
              chat['time']!,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            onTap: () {},
          );
        },
      )
: _selectedIndex == 1
    ? ListView.separated(
        itemCount: calls.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final call = calls[index];

          return ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 6,
            ),
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: const Color(0xFFBFE5FF),
              child: Text(
                call['letter']!,
                style: const TextStyle(
                  color: Color(0xFF174766),
                  fontSize: 20,
                ),
              ),
            ),
            title: Text(call['name']!),
            subtitle: Text(call['date']!),
            trailing: Icon(
              call['incoming'] == 'true'
                  ? Icons.call_received
                  : Icons.call_made,
              color: Colors.green,
            ),
          );
        },
      )
  : _selectedIndex == 2
    ? ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];

          return ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 6,
            ),
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: const Color(0xFFBFE5FF),
              child: Text(
                contact['letter']!,
                style: const TextStyle(
                  color: Color(0xFF174766),
                  fontSize: 20,
                ),
              ),
            ),
            title: Text(contact['name']!),
            subtitle: Text(contact['status']!),
          );
        },
      )
    : _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
BottomNavigationBarItem(
  icon: Icon(Icons.chat),
  label: 'Чаты',
),
BottomNavigationBarItem(
  icon: Icon(Icons.call),
  label: 'Звонки',
),
BottomNavigationBarItem(
  icon: Icon(Icons.contacts),
  label: 'Контакты',
),
        ],
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;

  const AppDrawer({
    super.key,
    required this.themeMode,
    required this.onToggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 28,
                  child: Icon(Icons.person, size: 32),
                ),
                SizedBox(height: 10),
                Text(
                  'Иван Иванов',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Пользователь',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Главная'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('Заказы'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const OrdersPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Профиль'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ProfilePage(),
                ),
              );
            },
          ),
          ListTile(
  leading: const Icon(Icons.settings),
  title: const Text('Настройки'),
  onTap: () {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const SettingsPage(),
      ),
    );
  },
),
          const Divider(),
          SwitchListTile(
            secondary: Icon(
              themeMode == ThemeMode.light
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            title: const Text('Тёмная тема'),
            value: themeMode == ThemeMode.dark,
            onChanged: (_) {
              onToggleTheme();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Заказы')),
      body: const Center(
        child: Text('Мои заказы', style: TextStyle(fontSize: 22)),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Профиль')),
      body: const Center(
        child: Text('Мой профиль', style: TextStyle(fontSize: 22)),
      ),
    );
  }
}
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      body: ListView(
        children: [
          const ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Уведомления'),
            subtitle: Text('Настройки уведомлений'),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.language),
            title: Text('Язык'),
            subtitle: Text('Русский'),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.lock),
            title: Text('Конфиденциальность'),
            subtitle: Text('Настройки безопасности'),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('О приложении'),
            subtitle: Text('Урок 6 — Flutter'),
          ),
        ],
      ),
    );
  }
}