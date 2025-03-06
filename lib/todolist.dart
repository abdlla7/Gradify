import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Todolist extends StatefulWidget {
  const Todolist({super.key});

  @override
  State<Todolist> createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {
  List<String> toDoList = [];
  List<bool> taskCompleted = [];
  String newTask = '';

  @override
  void initState() {
    super.initState();
    _loadTasks(); // تحميل المهام عند فتح التطبيق
  }

  // تحميل المهام المخزنة
  void _loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tasksString = prefs.getString('tasks');
    if (tasksString != null) {
      List<dynamic> tasksJson = jsonDecode(tasksString);
      setState(() {
        toDoList = tasksJson.map((task) => task['title'].toString()).toList();
        taskCompleted = tasksJson.map((task) => task['completed'] as bool).toList();
      });
    }
  }

  // حفظ المهام في التخزين
  void _saveTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> tasksJson = List.generate(toDoList.length, (index) {
      return {
        'title': toDoList[index],
        'completed': taskCompleted[index],
      };
    });
    prefs.setString('tasks', jsonEncode(tasksJson));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD),
      appBar: AppBar(
        title: const Text('To Do List'),
        backgroundColor: const Color(0xFF0D47A1),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Card(
              color: const Color(0xFF0D47A1),
              elevation: 10,
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('You clicked: ${toDoList[index]}')),
                  );
                },
                borderRadius: BorderRadius.circular(10),
                child: Row(
                  children: [
                    Checkbox(
                      value: taskCompleted[index],
                      onChanged: (bool? newValue) {
                        setState(() {
                          taskCompleted[index] = newValue!;
                          _saveTasks(); // حفظ البيانات بعد التغيير
                        });
                      },
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          toDoList[index],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: taskCompleted[index] ? Colors.grey : Colors.white,
                            decoration: taskCompleted[index] ? TextDecoration.lineThrough : null,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.white),
                      onPressed: () {
                        setState(() {
                          toDoList.removeAt(index);
                          taskCompleted.removeAt(index);
                          _saveTasks(); // حفظ التعديلات بعد الحذف
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0D47A1),
        foregroundColor: Colors.white,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Add Task'),
                content: TextField(
                  onChanged: (value) {
                    newTask = value;
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      if (newTask.isNotEmpty) {
                        setState(() {
                          toDoList.add(newTask);
                          taskCompleted.add(false);
                          _saveTasks(); // حفظ القائمة بعد الإضافة
                        });
                      }
                      Navigator.pop(context);
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
