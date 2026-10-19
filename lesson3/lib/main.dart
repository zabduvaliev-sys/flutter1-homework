import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Корневой виджет приложения (StatelessWidget)

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            home: CalculatorScreen(),
    );
  }
}



// Экран калькулятора (StatefulWidget)

class CalculatorScreen extends StatefulWidget {
  @override
  CalculatorScreenState createState() => CalculatorScreenState();
}

// State-класс — хранит состояние калькулятора

class CalculatorScreenState extends State<CalculatorScreen> {
  // Контроллеры для полей ввода

  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();

  double result = 0;

  // Получение чисел из полей
  double get firstValue => double.tryParse(firstController.text) ?? 0;
  double get secondValue => double.tryParse(secondController.text) ?? 0;

  void resetCalculator() {
    setState(() {
      firstController.clear();
      secondController.clear();
      result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
          backgroundColor: const Color(0xFF0F766E),
  foregroundColor: Colors.white,
        title: Text("Мини-калькулятор"),
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            

// ----------- ПЕРВОЕ ЧИСЛО -----------
            TextField(
              controller: firstController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Первое число",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 16),

            // ----------- ВТОРОЕ ЧИСЛО -----------
            TextField(
              controller: secondController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Второе число",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 24),

            // ----------- КНОПКИ +  −  СБРОС -----------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = firstValue + secondValue;
                    });
                  },
                  child: Text("+", style: TextStyle(fontSize: 24)),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
  backgroundColor: const Color(0xFF0F766E),
  foregroundColor: Colors.white,
),
                  onPressed: () {
                    setState(() {
                      result = firstValue - secondValue;
                    });
                  },
                  child: Text("−", style: TextStyle(fontSize: 24)),
                ),
ElevatedButton(
  style: ElevatedButton.styleFrom(
  backgroundColor: const Color(0xFF475569),
  foregroundColor: Colors.white,
),
  onPressed: () {
    setState(() {
      result = firstValue * secondValue;
    });
  },
  child: Text("×", style: TextStyle(fontSize: 24)),
),

ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFFD97706),
    foregroundColor: Colors.white,
  ),
  onPressed: () {
    setState(() {
      if (secondValue != 0) {
        result = firstValue / secondValue;
      } else {
        result = 0;
      }
    });
  },
  child: Text("÷", style: TextStyle(fontSize: 24)),
),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  
                  onPressed: resetCalculator,
                  child: Text(
                    "Сброс",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),

            // ----------- РЕЗУЛЬТАТ -----------
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(16),
  border: Border.all(
    color: const Color(0xFF0F766E),
    width: 2,
  ),
),
              child: Text(
                "Результат: $result",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

