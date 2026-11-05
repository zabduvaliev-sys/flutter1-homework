import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const CalendarApp());
}

class CalendarApp extends StatefulWidget {
  const CalendarApp({super.key});

  @override
  State<CalendarApp> createState() => _CalendarAppState();
}

class _CalendarAppState extends State<CalendarApp> {
  // Язык приложения: русский
  Locale _locale = const Locale('ru');

  // Переключение языка
  void _toggleLanguage() {
    setState(() {
      _locale = _locale.languageCode == 'ru'
          ? const Locale('en')
          : const Locale('ru');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Календарь',

      // Текущий язык приложения
      locale: _locale,

      // Поддерживаемые языки
      supportedLocales: const [
        Locale('ru'),
        Locale('en'),
      ],

      // Настройки локализации Flutter
    localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      home: CalendarPage(
        onToggleLanguage: _toggleLanguage,
      ),
    );
  }
}

class CalendarPage extends StatefulWidget {
  final VoidCallback onToggleLanguage;

  const CalendarPage({
    super.key,
    required this.onToggleLanguage,
  });

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  // Выбранная дата
  DateTime _selectedDay = DateTime.now();

  // Дата, на которой сейчас находится календарь
  DateTime _focusedDay = DateTime.now();

  // Список событий по датам
  final Map<DateTime, List<String>> _events = {};

  // Получаем события для конкретного дня
  List<String> _getEventsForDay(DateTime day) {
    final date = DateTime(day.year, day.month, day.day);
    return _events[date] ?? [];
  }

  // Добавление нового события
void _addEvent() {
  final controller = TextEditingController();

  showDialog(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        title: const Text('Новое событие'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Введите название события',
          ),
        ),
        actions: [
          // Кнопка отмены
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
            },
            child: const Text('Отмена'),
          ),

          // Кнопка сохранения
          ElevatedButton(
            onPressed: () {
              final event = controller.text.trim();

              if (event.isNotEmpty) {
                final date = DateTime(
                  _selectedDay.year,
                  _selectedDay.month,
                  _selectedDay.day,
                );

                setState(() {
                  _events.putIfAbsent(date, () => []).add(event);
                });
              }

              Navigator.pop(dialogContext);
            },
            child: const Text('Сохранить'),
          ),
        ],
      );
    },
  ).then((_) {
    controller.dispose();
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мой календарь'),
        actions: [
          IconButton(
            onPressed: widget.onToggleLanguage,
            icon: const Icon(Icons.language),
            tooltip: 'Сменить язык',
          ),
        ],
      ),
body: Column(
  children: [
    TableCalendar(
  // Язык календаря
  locale: Localizations.localeOf(context).languageCode,

  // Минимальная и максимальная даты
  firstDay: DateTime.utc(2020, 1, 1),
  lastDay: DateTime.utc(2030, 12, 31),

  // Отображаемый месяц
  focusedDay: _focusedDay,

  // Определяем выбранный день
  selectedDayPredicate: (day) {
    return isSameDay(_selectedDay, day);
  },

  // Что происходит при выборе даты
  onDaySelected: (selectedDay, focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
  },

  // Получаем события для каждого дня
  eventLoader: _getEventsForDay,

  // Внешний вид календаря
  calendarStyle: const CalendarStyle(
    todayDecoration: BoxDecoration(
      color: Colors.blue,
      shape: BoxShape.circle,
    ),
    selectedDecoration: BoxDecoration(
      color: Colors.deepPurple,
      shape: BoxShape.circle,
    ),
    markerDecoration: BoxDecoration(
      color: Colors.red,
      shape: BoxShape.circle,
    ),
  ),
),
const SizedBox(height: 20),

ElevatedButton.icon(
  onPressed: _addEvent,
  icon: const Icon(Icons.add),
  label: const Text('Добавить событие'),
),
const SizedBox(height: 20),

Text(
  'Выбранная дата: ${_selectedDay.day}.${_selectedDay.month}.${_selectedDay.year}',
  style: const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 10),

Expanded(
  child: ListView(
    children: _getEventsForDay(_selectedDay)
        .map(
          (event) => ListTile(
  leading: const Icon(Icons.event),
  title: Text(event),
  trailing: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      // Кнопка редактирования
      IconButton(
        icon: const Icon(Icons.edit, color: Colors.blue),
        onPressed: () {
          final controller = TextEditingController(text: event);

          showDialog(
            context: context,
            builder: (dialogContext) {
              return AlertDialog(
                title: const Text('Редактировать событие'),
                content: TextField(
                  controller: controller,
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: 'Название события',
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(dialogContext);
                    },
                    child: const Text('Отмена'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final updatedEvent = controller.text.trim();

                      if (updatedEvent.isNotEmpty) {
                        final date = DateTime(
                          _selectedDay.year,
                          _selectedDay.month,
                          _selectedDay.day,
                        );

                        final events = _events[date];
                        final index = events?.indexOf(event) ?? -1;

                        if (index != -1) {
                          setState(() {
                            events![index] = updatedEvent;
                          });
                        }
                      }

                      Navigator.pop(dialogContext);
                    },
                    child: const Text('Сохранить'),
                  ),
                ],
              );
            },
          ).then((_) {
            controller.dispose();
          });
        },
      ),

      // Кнопка удаления
      IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: () {
          final date = DateTime(
            _selectedDay.year,
            _selectedDay.month,
            _selectedDay.day,
          );

          setState(() {
            _events[date]?.remove(event);

            if (_events[date]?.isEmpty ?? false) {
              _events.remove(date);
            }
          });
        },
      ),
    ],
  ),
),
        )
        .toList(),
  ),
),
         ],
    ),
    );
  }
}